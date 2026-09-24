using System;

namespace ShopNest
{
    /// <summary>
    /// Represents a single item stored within the shopping cart.
    /// </summary>
    [Serializable]
    public class CartItem
    {
        public int ProductId { get; set; }
        public string Name { get; set; }
        public string Category { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public string ImageUrl { get; set; }

        public decimal TotalPrice
        {
            get { return Price * Quantity; }
        }

        public CartItem()
        {
            Quantity = 1;
        }

        public CartItem(int productId, string name, string category, decimal price, int quantity, string imageUrl)
        {
            ProductId = productId;
            Name = name;
            Category = category;
            Price = price;
            Quantity = quantity;
            ImageUrl = imageUrl;
        }
    }
}
