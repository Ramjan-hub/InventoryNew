using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Inventory.Models;


namespace Inventory.Controllers
{
    public class StockmenController : Controller
    {
        // GET: Stockmen

        InventoryContext db = new InventoryContext();
            
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult getStockmen()
        {
            var jsonData = new
            {
                total = 1,
                page = 1,
                records = db.Stockmen.ToList().Count,
                rows = (
                  from st in db.Stockmen.ToList()
                  select new
                  {
                      id = st.Id,
                      cell = new string[] { 
                      st.Firstname,
                      st.Secondname,
                      st.TypeOfRight.NameOfType,
                      st.Shifr
                  }
                  }).ToArray()

            };
            var rr = Json(jsonData, JsonRequestBehavior.AllowGet);
            return rr;
        }
    }
}