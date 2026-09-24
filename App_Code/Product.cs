using System;

namespace ShopNest
{
    /// <summary>
    /// Represents a product item in the ShopNest store.
    /// </summary>
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Category { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
        public bool IsFeatured { get; set; }
        public string StockStatus { get; set; }

        public Product()
        {
            StockStatus = "In Stock";
        }

        public Product(int id, string name, string category, decimal price, string description, string imageUrl, bool isFeatured = false)
        {
            Id = id;
            Name = name;
            Category = category;
            Price = price;
            Description = description;
            ImageUrl = imageUrl;
            IsFeatured = isFeatured;
            StockStatus = "In Stock";
        }
    }
}
