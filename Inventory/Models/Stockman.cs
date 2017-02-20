using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Inventory.Models
{
    public class Stockman
    {
        public virtual int Id { get; set; }
        public virtual string Code { get; set; }
        public virtual string Firstname { get; set; }
        public virtual string Secondname { get; set; }
        public virtual Nullable<int> TypeOfRightsId { get; set; }
        public virtual string Shifr { get; set; }

        public virtual TypeOfRights TypeOfRight { get; set; }

        public virtual List<Operation> Operations { get; set; }


    }
}