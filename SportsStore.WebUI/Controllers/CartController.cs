using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SportsStore.Domain.Entities;
using SportsStore.Domain.Abstract;
using SportsStore.WebUI.Models;

namespace SportsStore.WebUI.Controllers
{
    public class CartController : Controller
    {
        private readonly IProductsRepository _prodRepo;

        public CartController(IProductsRepository productsRepository)
        {
            _prodRepo = productsRepository;
        }

        //GET CART
        public Cart GetCart()
        {
            Cart cart = (Cart)Session["Cart"];
            if (cart == null )
            {
                cart = new Cart();
                Session["Cart"] = cart;
            }
            return cart;
        }

        //ADD TO CART
        public RedirectToRouteResult AddToCart(int Id, string returnUrl)
        {
            Product product = _prodRepo.Products.FirstOrDefault(p => p.Id == Id);
            if (product != null)
            {
                GetCart().AddItem(product, 1);
            }
            return RedirectToAction("Index", new { returnUrl });
        }

        //REMOVE FROM CART
        public RedirectToRouteResult RemoveFromCart(int productId, string returnUrl)
        {
            Product product = _prodRepo.Products.FirstOrDefault(p => p.Id == productId);
            if (product == null)
            {
                GetCart().RemoveLine(product);
            }
            return RedirectToRoute("Index", new { returnUrl });
        }

        public ViewResult Index(string returnUrl)
        {
            return View(new CartIndexViewModel 
            { 
                cart = GetCart(),
                returnUrl = returnUrl 
            });
        }
    }
}