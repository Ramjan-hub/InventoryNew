using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Inventory.Models;

namespace Inventory.Controllers
{
    public class OperationsController : Controller
    {
        private InventoryContext db = new InventoryContext();

        // GET: Operations
        public ActionResult Index()
        {
            var operations = db.Operations.Include(o => o.Product).Include(o => o.Stockman).Include(o => o.Vendor);
            return View(operations.ToList());
        }

        // GET: Operations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Operation operation = db.Operations.Find(id);
            if (operation == null)
            {
                return HttpNotFound();
            }
            return View(operation);
        }

        // GET: Operations/Create
        public ActionResult Create()
        {
            ViewBag.ProductID = new SelectList(db.Products, "Id", "Name");
            ViewBag.StockmanId = new SelectList(db.Stockmen, "Id", "Code");
            ViewBag.VendorId = new SelectList(db.Vendors, "Id", "Abbr");
            return View();
        }

        // POST: Operations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,TypeOfOper,Qty,OperDate,Lot,ExpirationDate,BoxNo,Shelf,ProductID,VendorId,StockmanId,LocationId,DateIn")] Operation operation)
        {
            if (ModelState.IsValid)
            {
                db.Operations.Add(operation);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ProductID = new SelectList(db.Products, "Id", "Name", operation.ProductID);
            ViewBag.StockmanId = new SelectList(db.Stockmen, "Id", "Code", operation.StockmanId);
            ViewBag.VendorId = new SelectList(db.Vendors, "Id", "Abbr", operation.VendorId);
            return View(operation);
        }

        // GET: Operations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Operation operation = db.Operations.Find(id);
            if (operation == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProductID = new SelectList(db.Products, "Id", "Name", operation.ProductID);
            ViewBag.StockmanId = new SelectList(db.Stockmen, "Id", "Code", operation.StockmanId);
            ViewBag.VendorId = new SelectList(db.Vendors, "Id", "Abbr", operation.VendorId);
            return View(operation);
        }

        // POST: Operations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,TypeOfOper,Qty,OperDate,Lot,ExpirationDate,BoxNo,Shelf,ProductID,VendorId,StockmanId,LocationId,DateIn")] Operation operation)
        {
            if (ModelState.IsValid)
            {
                db.Entry(operation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProductID = new SelectList(db.Products, "Id", "Name", operation.ProductID);
            ViewBag.StockmanId = new SelectList(db.Stockmen, "Id", "Code", operation.StockmanId);
            ViewBag.VendorId = new SelectList(db.Vendors, "Id", "Abbr", operation.VendorId);
            return View(operation);
        }

        // GET: Operations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Operation operation = db.Operations.Find(id);
            if (operation == null)
            {
                return HttpNotFound();
            }
            return View(operation);
        }

        // POST: Operations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Operation operation = db.Operations.Find(id);
            db.Operations.Remove(operation);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
