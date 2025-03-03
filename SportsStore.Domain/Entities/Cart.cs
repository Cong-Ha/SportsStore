using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SportsStore.Domain.Entities
{
    public class CartLine
    {
        public Product Product { get; set; }
        public int Quantity { get; set; }
    }
    public class Cart
    {
        //initialize the cart
        //getter for CartLine
        //add new item
        //if item exists increase quantity
        //remove item
        //compute total cost of all items in cart
        //emptying cart
        private List<CartLine> lineCollection = new List<CartLine>();

        //acccess content of cart
        public IEnumerable<CartLine> Lines { get { return lineCollection; } }

        //add item
        public void AddItem(Product product, int quantity)
        {
            CartLine line = Lines
                .Where(p => p.Product.Id == product.Id)
                .FirstOrDefault();

            //add new item, else increase quantity
            if (line == null)
            {
                lineCollection.Add(new CartLine
                {
                    Product = product,
                    Quantity = quantity
                });
            }
            else
            {
                line.Quantity += quantity;
            }
        }

        //remove item
        public void RemoveLine(Product product)
        {
            lineCollection.RemoveAll(l => l.Product.Id == product.Id);
        }

        //compute total of items in cart
        public decimal ComputeTotalValue()
        {
            return lineCollection.Sum(t => t.Product.Price * t.Quantity);
        }

        //empty or reset cart
        public void Clear()
        {
            lineCollection.Clear();
        }

    }
}
