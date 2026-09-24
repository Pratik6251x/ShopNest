-- =====================================================================
-- ShopNest – Online Shopping Website
-- Database Setup Script for Microsoft SQL Server / LocalDB
-- =====================================================================

-- Step 1: Create Database (Uncomment if creating fresh database)
-- CREATE DATABASE ShopNestDB;
-- GO
-- USE ShopNestDB;
-- GO

-- Step 2: Create Products Table
IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL
    DROP TABLE dbo.Products;
GO

CREATE TABLE dbo.Products
(
    Id          INT IDENTITY(1,1) PRIMARY KEY,
    Name        NVARCHAR(150)   NOT NULL,
    Category    NVARCHAR(50)    NOT NULL,
    Price       DECIMAL(10, 2)  NOT NULL,
    Description NVARCHAR(MAX)   NOT NULL,
    ImageUrl    NVARCHAR(250)   NOT NULL,
    IsFeatured  BIT             NOT NULL DEFAULT 0,
    StockStatus NVARCHAR(50)    NOT NULL DEFAULT 'In Stock'
);
GO

-- Step 3: Insert Sample Product Records (16 Products across 4 Categories)
INSERT INTO dbo.Products (Name, Category, Price, Description, ImageUrl, IsFeatured, StockStatus)
VALUES
-- Electronics
('Wireless Headphones', 'Electronics', 79.99, 'High-fidelity active noise-cancelling over-ear headphones with 30-hour battery life and Bluetooth 5.2.', 'Images/products/headphones.svg', 1, 'In Stock'),
('Smart Watch', 'Electronics', 149.99, 'Sleek fitness smartwatch featuring an AMOLED display, heart-rate tracking, GPS, and water resistance up to 50m.', 'Images/products/smartwatch.svg', 1, 'In Stock'),
('Bluetooth Speaker', 'Electronics', 49.99, 'Portable waterproof outdoor speaker delivering 360-degree punchy stereo sound with rich deep bass.', 'Images/products/speaker.svg', 0, 'In Stock'),
('Wireless Mouse', 'Electronics', 24.99, 'Ergonomic rechargeable optical wireless mouse with silent clicks, adjustable DPI, and multi-device pairing.', 'Images/products/mouse.svg', 0, 'In Stock'),

-- Clothing
('Classic Cotton T-Shirt', 'Clothing', 19.99, 'Premium 100% combed ringspun cotton crewneck t-shirt. Soft, breathable, and designed for daily casual comfort.', 'Images/products/tshirt.svg', 0, 'In Stock'),
('Fleece Pullover Hoodie', 'Clothing', 39.99, 'Cozy unisex brushed fleece pullover hoodie with front kangaroo pocket, ribbed cuffs, and drawstring hood.', 'Images/products/hoodie.svg', 1, 'In Stock'),
('Slim Fit Denim Jeans', 'Clothing', 49.99, 'Modern mid-rise slim stretch denim jeans with five pockets and durable double-stitched seams.', 'Images/products/jeans.svg', 0, 'In Stock'),
('Windproof Winter Jacket', 'Clothing', 89.99, 'Insulated weather-resistant all-season jacket with thermal inner lining and detachable faux-fur hood.', 'Images/products/jacket.svg', 0, 'In Stock'),

-- Books
('Python Programming Guide', 'Books', 29.99, 'Comprehensive hands-on guide covering Python 3 fundamentals, data structures, OOP, and real-world projects.', 'Images/products/python-book.svg', 0, 'In Stock'),
('Modern Web Development', 'Books', 34.99, 'Master modern frontend & backend principles: HTML5, CSS3, JavaScript, ASP.NET, and responsive web design.', 'Images/products/webdev-book.svg', 1, 'In Stock'),
('Database Management Systems', 'Books', 39.99, 'Authoritative textbook on relational database architecture, SQL queries, normalization, indexing, and transactions.', 'Images/products/dbms-book.svg', 0, 'In Stock'),
('Computer Networks Fundamentals', 'Books', 44.99, 'Clear, top-down exploration of TCP/IP, OSI layers, routing algorithms, wireless protocols, and network security.', 'Images/products/network-book.svg', 0, 'In Stock'),

-- Accessories
('Everyday Urban Backpack', 'Accessories', 54.99, 'Water-resistant laptop backpack with USB charging port, anti-theft hidden pockets, and padded shoulder straps.', 'Images/products/backpack.svg', 1, 'In Stock'),
('UV Polarized Sunglasses', 'Accessories', 24.99, 'Classic aviator-style sunglasses with UV400 polarized lenses that eliminate glare and protect your eyes.', 'Images/products/sunglasses.svg', 1, 'In Stock'),
('Slim Leather Wallet', 'Accessories', 29.99, 'Genuine top-grain minimalist bifold wallet with RFID-blocking technology and quick-access card slots.', 'Images/products/wallet.svg', 0, 'In Stock'),
('Insulated Travel Bottle', 'Accessories', 18.99, 'Double-wall stainless steel vacuum insulated water bottle. Keeps drinks icy cold for 24h or piping hot for 12h.', 'Images/products/bottle.svg', 0, 'In Stock');
GO

-- Verify Data
SELECT * FROM dbo.Products;
GO
