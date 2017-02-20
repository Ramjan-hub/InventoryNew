using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Inventory.Models
{
    public class TypeOfItems
    {
        public virtual int Id { get; set; }
        public virtual string Name { get; set; }
        public virtual List<Product> Products { get; set; }

    }
}