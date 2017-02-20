using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Inventory.Models
{
    public class Product
    {
        public virtual int Id { get; set; }
        public virtual string Name { get; set; }
        public virtual string UPC { get; set; }

        public virtual Nullable<int> ManufacturerId { get; set; }
        public virtual Nullable<int> TypeOfItemsId { get; set; }
        public virtual Nullable<decimal> Qwantity { get; set; }
        public virtual Manufacturer Manufacturer { get; set; }
        public virtual TypeOfItems TypeOfItems { get; set; }
        public virtual  List<Operation> Operations { get; set; }
        public virtual List<InventoryR> InventoryRs { get; set; }


    }
}