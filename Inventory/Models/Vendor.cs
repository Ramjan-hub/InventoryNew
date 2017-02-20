using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Inventory.Models
{
    public class Vendor
    {
        public virtual int Id { get; set; }
        public virtual string Abbr { get; set; }
        public virtual string UPC { get; set; }
        public virtual List<Operation> Operations { get; set; }

        public virtual List<InventoryR> InventoryRs { get; set; }
    }
}