using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SportsStore.Domain.Abstract;

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
        public ViewResult List()
        {
            return View(productRepo.Products);
        }
    }
}