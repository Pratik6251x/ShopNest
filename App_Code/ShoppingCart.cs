using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopNest
{
    /// <summary>
    /// Manages the user's shopping cart stored in ASP.NET Session.
    /// </summary>
    [Serializable]
    public class ShoppingCart
    {
        public List<CartItem> Items { get; private set; }

        public ShoppingCart()
        {
            Items = new List<CartItem>();
        }

        /// <summary>
        /// Retrieves the current ShoppingCart instance from ASP.NET Session,
        /// or initializes a new one if it does not yet exist.
        /// </summary>
        public static ShoppingCart GetCart(HttpContext context)
        {
            if (context == null || context.Session == null)
            {
                return new ShoppingCart();
            }

            ShoppingCart cart = context.Session["Cart"] as ShoppingCart;
            if (cart == null)
            {
                cart = new ShoppingCart();
                context.Session["Cart"] = cart;
            }
            return cart;
        }

        /// <summary>
        /// Adds a product to the cart. If already present, increments the quantity.
        /// </summary>
        public void AddItem(Product product, int quantity = 1)
        {
            if (product == null || quantity <= 0) return;

            CartItem existing = Items.FirstOrDefault(i => i.ProductId == product.Id);
            if (existing != null)
            {
                existing.Quantity += quantity;
            }
            else
            {
                Items.Add(new CartItem(
                    product.Id,
                    product.Name,
                    product.Category,
                    product.Price,
                    quantity,
                    product.ImageUrl
                ));
            }
        }

        /// <summary>
        /// Increases the quantity of a product in the cart by 1.
        /// </summary>
        public void IncreaseQuantity(int productId)
        {
            CartItem item = Items.FirstOrDefault(i => i.ProductId == productId);
            if (item != null)
            {
                item.Quantity++;
            }
        }

        /// <summary>
        /// Decreases the quantity of a product in the cart. If quantity reaches 0, removes the item.
        /// </summary>
        public void DecreaseQuantity(int productId)
        {
            CartItem item = Items.FirstOrDefault(i => i.ProductId == productId);
            if (item != null)
            {
                if (item.Quantity > 1)
                {
                    item.Quantity--;
                }
                else
                {
                    Items.Remove(item);
                }
            }
        }

        /// <summary>
        /// Updates the quantity for a product directly.
        /// </summary>
        public void UpdateQuantity(int productId, int quantity)
        {
            CartItem item = Items.FirstOrDefault(i => i.ProductId == productId);
            if (item != null)
            {
                if (quantity > 0)
                {
                    item.Quantity = quantity;
                }
                else
                {
                    Items.Remove(item);
                }
            }
        }

        /// <summary>
        /// Removes an item completely from the cart.
        /// </summary>
        public void RemoveItem(int productId)
        {
            CartItem item = Items.FirstOrDefault(i => i.ProductId == productId);
            if (item != null)
            {
                Items.Remove(item);
            }
        }

        /// <summary>
        /// Empties all items from the cart.
        /// </summary>
        public void Clear()
        {
            Items.Clear();
        }

        /// <summary>
        /// Calculates the total dollar amount for all items in the cart.
        /// </summary>
        public decimal GetGrandTotal()
        {
            return Items.Sum(i => i.TotalPrice);
        }

        /// <summary>
        /// Calculates the total count of items in the cart.
        /// </summary>
        public int GetTotalCount()
        {
            return Items.Sum(i => i.Quantity);
        }
    }
}
