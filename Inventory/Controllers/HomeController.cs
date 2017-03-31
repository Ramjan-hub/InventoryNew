using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Inventory.Models;

namespace Inventory.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Dictionaries()
        {
            ViewBag.Message = "Dictionaries";
            return View();
        }

        public ActionResult InventoryIn()
        {
            ViewBag.Message = "InventoryIn";
            return View();
        }

        public ActionResult UploadExcelIn(FormCollection formCollection)
        {
            if (Request != null)
            {
                HttpPostedFileBase file = Request.Files["1"];

                if ((file != null) && (file.ContentLength > 0) && !string.IsNullOrEmpty(file.FileName))
                {
                    string fileName = file.FileName;
                    string fileContemtType = file.ContentType;
                    byte[] fileBytes = new byte[file.ContentLength];
                    var data = file.InputStream.Read(fileBytes, 0, Convert.ToInt32(file.ContentLength));

                    List<string> listOfUPC = new List<string>();

                    using (var package = new ExcelPackage(file.InputStream))
                    {
                        var workSheets = package.Workbook.Worksheets;
                        var currentSheet = workSheets.First();
                        var noOfRow = currentSheet.Dimension.End.Row;

                        for (int i = 1; i <= noOfRow; i++)
                        {
                            listOfUPC.Add(currentSheet.Cells[i, 1].Value.ToString());
                        }
                    }

                    var oo = from p in listOfUPC group p by p into g select new { UPC = g, Col = g.Count() };

                    List<qutOfAProd> lQ = new List<qutOfAProd>();

                    foreach (var oo1 in oo)
                    {
                        qutOfAProd qu = new qutOfAProd();
                        qu.UPC = oo1.UPC.First().ToString();
                        qu.Qut = oo1.Col;
                        lQ.Add(qu);

                    }


                    ViewData["listOfUPC"] = listOfUPC;
                    ViewData["listOfUPCWithCount"] = lQ;
                }
            }

            return View();
        }

        public ActionResult DictVendors()
        {
            ViewBag.Message = "Vendors";

            return View();
        }

        public ActionResult DictProducts()
        {
            ViewBag.Message = "Products";
            return View();
        }

        public ActionResult DictStockmen()
        {
            ViewBag.Message = "Stockmen";
            return View();
        }
    }
}
    