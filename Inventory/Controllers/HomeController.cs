using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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