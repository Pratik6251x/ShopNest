using System;
using System.Collections.Generic;
using System.Linq;

namespace ShopNest
{
    /// <summary>
    /// Product repository providing sample e-commerce catalog data.
    /// In this college project, sample data is maintained in-memory for instant, 
    /// zero-configuration execution. A SQL Server database script is also provided in App_Data.
    /// </summary>
    public static class ProductRepository
    {
        private static readonly List<Product> _products = new List<Product>();

        static ProductRepository()
        {
            InitializeSampleProducts();
        }

        private static void InitializeSampleProducts()
        {
            // === ELECTRONICS ===
            _products.Add(new Product(
                1,
                "Wireless Headphones",
                "Electronics",
                79.99m,
                "High-fidelity active noise-cancelling over-ear headphones with 30-hour battery life and Bluetooth 5.2.",
                "Images/products/headphones.svg",
                true
            ));

            _products.Add(new Product(
                2,
                "Smart Watch",
                "Electronics",
                149.99m,
                "Sleek fitness smartwatch featuring an AMOLED display, heart-rate tracking, GPS, and water resistance up to 50m.",
                "Images/products/smartwatch.svg",
                true
            ));

            _products.Add(new Product(
                3,
                "Bluetooth Speaker",
                "Electronics",
                49.99m,
                "Portable waterproof outdoor speaker delivering 360-degree punchy stereo sound with rich deep bass.",
                "Images/products/speaker.svg",
                false
            ));

            _products.Add(new Product(
                4,
                "Wireless Mouse",
                "Electronics",
                24.99m,
                "Ergonomic rechargeable optical wireless mouse with silent clicks, adjustable DPI, and multi-device pairing.",
                "Images/products/mouse.svg",
                false
            ));

            // === CLOTHING ===
            _products.Add(new Product(
                5,
                "Classic Cotton T-Shirt",
                "Clothing",
                19.99m,
                "Premium 100% combed ringspun cotton crewneck t-shirt. Soft, breathable, and designed for daily casual comfort.",
                "Images/products/tshirt.svg",
                false
            ));

            _products.Add(new Product(
                6,
                "Fleece Pullover Hoodie",
                "Clothing",
                39.99m,
                "Cozy unisex brushed fleece pullover hoodie with front kangaroo pocket, ribbed cuffs, and drawstring hood.",
                "Images/products/hoodie.svg",
                true
            ));

            _products.Add(new Product(
                7,
                "Slim Fit Denim Jeans",
                "Clothing",
                49.99m,
                "Modern mid-rise slim stretch denim jeans with five pockets and durable double-stitched seams.",
                "Images/products/jeans.svg",
                false
            ));

            _products.Add(new Product(
                8,
                "Windproof Winter Jacket",
                "Clothing",
                89.99m,
                "Insulated weather-resistant all-season jacket with thermal inner lining and detachable faux-fur hood.",
                "Images/products/jacket.svg",
                false
            ));

            // === BOOKS ===
            _products.Add(new Product(
                9,
                "Python Programming Guide",
                "Books",
                29.99m,
                "Comprehensive hands-on guide covering Python 3 fundamentals, data structures, OOP, and real-world projects.",
                "Images/products/python-book.svg",
                false
            ));

            _products.Add(new Product(
                10,
                "Modern Web Development",
                "Books",
                34.99m,
                "Master modern frontend & backend principles: HTML5, CSS3, JavaScript, ASP.NET, and responsive web design.",
                "Images/products/webdev-book.svg",
                true
            ));

            _products.Add(new Product(
                11,
                "Database Management Systems",
                "Books",
                39.99m,
                "Authoritative textbook on relational database architecture, SQL queries, normalization, indexing, and transactions.",
                "Images/products/dbms-book.svg",
                false
            ));

            _products.Add(new Product(
                12,
                "Computer Networks Fundamentals",
                "Books",
                44.99m,
                "Clear, top-down exploration of TCP/IP, OSI layers, routing algorithms, wireless protocols, and network security.",
                "Images/products/network-book.svg",
                false
            ));

            // === ACCESSORIES ===
            _products.Add(new Product(
                13,
                "Everyday Urban Backpack",
                "Accessories",
                54.99m,
                "Water-resistant laptop backpack with USB charging port, anti-theft hidden pockets, and padded shoulder straps.",
                "Images/products/backpack.svg",
                true
            ));

            _products.Add(new Product(
                14,
                "UV Polarized Sunglasses",
                "Accessories",
                24.99m,
                "Classic aviator-style sunglasses with UV400 polarized lenses that eliminate glare and protect your eyes.",
                "Images/products/sunglasses.svg",
                true
            ));

            _products.Add(new Product(
                15,
                "Slim Leather Wallet",
                "Accessories",
                29.99m,
                "Genuine top-grain minimalist bifold wallet with RFID-blocking technology and quick-access card slots.",
                "Images/products/wallet.svg",
                false
            ));

            _products.Add(new Product(
                16,
                "Insulated Travel Bottle",
                "Accessories",
                18.99m,
                "Double-wall stainless steel vacuum insulated water bottle. Keeps drinks icy cold for 24h or piping hot for 12h.",
                "Images/products/bottle.svg",
                false
            ));
        }

        /// <summary>
        /// Retrieves all products in the catalog.
        /// </summary>
        public static List<Product> GetAllProducts()
        {
            return _products.ToList();
        }

        /// <summary>
        /// Retrieves only featured products for the Home page spotlight.
        /// </summary>
        public static List<Product> GetFeaturedProducts()
        {
            return _products.Where(p => p.IsFeatured).ToList();
        }

        /// <summary>
        /// Retrieves a single product by unique ID.
        /// </summary>
        public static Product GetProductById(int id)
        {
            return _products.FirstOrDefault(p => p.Id == id);
        }

        /// <summary>
        /// Retrieves products belonging to a specific category.
        /// </summary>
        public static List<Product> GetProductsByCategory(string category)
        {
            if (string.IsNullOrEmpty(category) || category.Equals("All", StringComparison.OrdinalIgnoreCase))
            {
                return GetAllProducts();
            }
            return _products.Where(p => p.Category.Equals(category, StringComparison.OrdinalIgnoreCase)).ToList();
        }

        /// <summary>
        /// Returns all distinct categories available in the store.
        /// </summary>
        public static List<string> GetCategories()
        {
            return _products.Select(p => p.Category).Distinct().ToList();
        }
    }
}
