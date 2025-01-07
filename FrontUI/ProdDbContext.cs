using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace FrontUI
{
    public class Product
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public decimal Price { get; set; }

        [Required]
        public string Category { get; set; }
    }

    public class ProdDbContext:DbContext
    {
        public ProdDbContext(): base("ProdsDbConnStr")
        {
            
        }
        public DbSet<Product> Products { get; set; }
    }
}