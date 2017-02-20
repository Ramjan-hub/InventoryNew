using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Inventory.Models
{
    public class Operation
    {
        public virtual int Id { get; set; }
        public virtual int TypeOfOper { get; set; }
        public virtual int Qty { get; set; }
        public virtual DateTime OperDate { get; set; }
   
        public virtual string Lot { get; set; }

        public virtual DateTime ExpirationDate { get; set; }

        public virtual string BoxNo { get; set; }
        public virtual string Shelf { get; set; }
        public virtual int ProductID { get; set; }
        public virtual int VendorId { get; set; }
        public virtual int StockmanId { get; set; }

        public virtual Nullable<int> LocationId { get; set; }
        public virtual Nullable<DateTime> DteIn { get; set; }
        public virtual Vendor Vendor { get; set; }
        public virtual Stockman Stockman { get; set; }
        public virtual Product Product { get; set; }
        
    }
}