using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Inventory.Models
{
    public class InventoryR
    {

        public virtual int Id { get; set; }

        public virtual int? VendorId { get; set; }
        public virtual Nullable<int> ProductId { get; set; }
        public virtual string LOT { get; set; }
        public virtual System.DateTime ExpirationDate { get; set; }
        public virtual Nullable<System.DateTime> DateIn { get; set; }
        public virtual Nullable<long> MinId { get; set; }
        public virtual string BoxNo { get; set; }
        public virtual string Shelf { get; set; }
        public virtual Nullable<int> Qty { get; set; }
        public virtual Product Product { get; set; }
        public virtual Vendor Vendor { get; set; }
    }
}