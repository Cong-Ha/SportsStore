using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Web;
using System.Web.Mvc;
using SportsStore.Domain.Abstract;
using SportsStore.WebUI.Models;

namespace SportsStore.WebUI.Controllers
{
    public class ProductController : Controller
    {
        private IProductsRepository productRepo;

        public ProductController(IProductsRepository prodRepo)
        {
            this.productRepo = prodRepo;
        }

        // GET: Product

        public int PageSize = 4;
        public ViewResult List(string category, int page = 1)
        {
            // Skip(int) - Ignores the specified number of items
            // and return a sequence starting at the item after the
            // last skipped item (if any).
            // Take(int) - Returns the specified number of contiguous
            // elements from the start of a sequence.
            ProductListViewModel model = new ProductListViewModel
            {
                Products = productRepo.Products
                    .Where(b => category == null || b.Category == category)
                    .OrderBy(p => p.Id)
                    .Skip((page - 1) * PageSize)
                    .Take(PageSize),
                PageInfo = new PageInfo
                {
                    CurrentPage = page,
                    ItemsPerPage = PageSize,
                    TotalItems = productRepo.Products.Count()
                },
                CurrentCategory = category
            };
            return View(model);
        }
    }
}