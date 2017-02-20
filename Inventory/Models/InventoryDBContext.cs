using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Inventory.Models
{
    public class InventoryContext : DbContext
    {
        public InventoryContext(): base("name=InventoryContext")
        {
        }

        public DbSet<InventoryR> InventoryRs { get; set; }
        public DbSet<Location> Locations { get; set; }
        public DbSet<Manufacturer> Manufacturers { get; set; }
        public DbSet<Operation> Operations { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Stockman> Stockmen { get; set; }
        public DbSet<TypeOfItems> TypesOfItems { get; set; }
        public DbSet<TypeOfRights> TypesOfRights { get; set; }
        public DbSet<Vendor> Vendors { get; set; }

    }
}