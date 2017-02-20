using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Inventory.Models
{
    public class TypeOfRights
    {
        public virtual int Id { get; set; }
        public virtual string NameOfType { get; set; }

        public virtual List<Stockman> Stokmen { get; set; }
    }
}