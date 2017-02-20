using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Inventory.Models
{
    public class Manufacturer
    {
        public virtual int Id { get; set; }
        public virtual string Name { get; set; }
        public virtual string Abbr { get; set; }
        public virtual string UPC { get; set; }
        public virtual List<Product> Products { get; set; }

    }
}