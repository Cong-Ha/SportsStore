using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SportsStore.Domain.Abstract;
using SportsStore.Domain.Entities;

namespace SportsStore.Domain.Concrete
{
    public class ProductsRepository : IProductsRepository
    {
        private readonly SportsStoreDbContext context = new SportsStoreDbContext();

        public IEnumerable<Product> Products 
        {
            get { return context.Products; }
        }
    }
}
