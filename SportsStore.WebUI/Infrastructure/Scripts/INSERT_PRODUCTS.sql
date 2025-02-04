SET IDENTITY_INSERT [dbo].[Products] ON;

MERGE INTO [dbo].[Products] AS target
USING (VALUES
    (1, 'Wireless Mouse', 'Ergonomic wireless mouse with 2.4GHz connectivity', 'Electronics', 29.99),
    (2, 'Mechanical Keyboard', 'RGB backlit mechanical keyboard with blue switches', 'Electronics', 89.99),
    (3, 'Bluetooth Headphones', 'Noise-cancelling over-ear Bluetooth headphones', 'Electronics', 149.99),
    (4, 'Smartwatch', 'Fitness tracker with heart rate monitor and GPS', 'Wearables', 199.99),
    (5, 'Electric Kettle', '1.7L stainless steel electric kettle with auto-shutoff', 'Home Appliances', 39.99),
    (6, 'Air Purifier', 'HEPA air purifier for rooms up to 500 sq. ft.', 'Home Appliances', 129.99),
    (7, 'Yoga Mat', 'Eco-friendly non-slip yoga mat with carrying strap', 'Fitness', 24.99),
    (8, 'Dumbbell Set', 'Adjustable dumbbell set with 5-25 lbs range', 'Fitness', 79.99),
    (9, 'Coffee Maker', '12-cup programmable coffee maker with thermal carafe', 'Home Appliances', 59.99),
    (10, 'Desk Lamp', 'LED desk lamp with adjustable brightness and color temperature', 'Home Office', 49.99),
    (11, 'External Hard Drive', '1TB portable external hard drive with USB 3.0', 'Electronics', 59.99),
    (12, 'Gaming Mouse Pad', 'Large RGB gaming mouse pad with non-slip base', 'Accessories', 19.99),
    (13, 'Wireless Charger', 'Qi-enabled wireless charging pad for smartphones', 'Electronics', 34.99),
    (14, 'Laptop Stand', 'Adjustable aluminum laptop stand for ergonomic typing', 'Home Office', 29.99),
    (15, 'Power Bank', '20000mAh portable power bank with dual USB ports', 'Electronics', 45.99),
    (16, 'Smart Bulb', 'Wi-Fi enabled smart bulb with color-changing features', 'Home Automation', 22.99),
    (17, 'Electric Toothbrush', 'Rechargeable electric toothbrush with 3 cleaning modes', 'Personal Care', 49.99),
    (18, 'Bluetooth Speaker', 'Waterproof portable Bluetooth speaker with 12-hour battery', 'Electronics', 69.99),
    (19, 'Fitness Band', 'Slim fitness band with step counter and sleep tracker', 'Wearables', 59.99),
    (20, 'Desk Organizer', 'Wooden desk organizer with compartments for stationery', 'Home Office', 39.99),
    (21, 'Electric Grill', 'Indoor electric grill with adjustable temperature control', 'Home Appliances', 89.99),
    (22, 'Rice Cooker', '5-cup rice cooker with non-stick inner pot', 'Home Appliances', 49.99),
    (23, 'Running Shoes', 'Lightweight running shoes with breathable mesh', 'Fitness', 79.99),
    (24, 'Resistance Bands', 'Set of 5 resistance bands for strength training', 'Fitness', 29.99),
    (25, 'Sleep Mask', 'Soft sleep mask with adjustable strap for comfort', 'Personal Care', 14.99),
    (26, 'Backpack', 'Water-resistant backpack with USB charging port', 'Accessories', 54.99),
    (27, 'Wireless Earbuds', 'True wireless earbuds with 20-hour battery life', 'Electronics', 99.99),
    (28, 'Smart Thermostat', 'Wi-Fi smart thermostat with energy-saving features', 'Home Automation', 129.99),
    (29, 'Electric Fan', 'Tower fan with 3 speed settings and remote control', 'Home Appliances', 69.99),
    (30, 'Protein Shaker', 'BPA-free protein shaker bottle with mixing ball', 'Fitness', 9.99),
    (31, 'LED Strip Lights', '16.4ft RGB LED strip lights with remote control', 'Home Automation', 24.99),
    (32, 'Hair Dryer', 'Ionic hair dryer with 3 heat and speed settings', 'Personal Care', 39.99),
    (33, 'Gaming Chair', 'Ergonomic gaming chair with lumbar support', 'Furniture', 199.99),
    (34, 'Printer', 'All-in-one wireless inkjet printer with scanning', 'Electronics', 129.99),
    (35, 'Electric Blanket', 'Queen-size electric blanket with 10 heat settings', 'Home Appliances', 79.99),
    (36, 'Water Bottle', 'Insulated stainless steel water bottle with lid', 'Accessories', 19.99),
    (37, 'Smart Doorbell', 'Wi-Fi video doorbell with motion detection', 'Home Automation', 149.99),
    (38, 'Massage Gun', 'Deep tissue massage gun with 5 speed settings', 'Fitness', 129.99),
    (39, 'Air Fryer', '5.8-quart air fryer with digital touchscreen', 'Home Appliances', 99.99),
    (40, 'Wireless Keyboard', 'Slim wireless keyboard with quiet-touch keys', 'Electronics', 49.99)
) AS source ([Id], [Name], [Description], [Category], [Price])
ON target.[Id] = source.[Id]
WHEN MATCHED THEN
    UPDATE SET
        target.[Name] = source.[Name],
        target.[Description] = source.[Description],
        target.[Category] = source.[Category],
        target.[Price] = source.[Price]
WHEN NOT MATCHED THEN
    INSERT ([Id], [Name], [Description], [Category], [Price])
    VALUES (source.[Id], source.[Name], source.[Description], source.[Category], source.[Price]);

SET IDENTITY_INSERT [dbo].[Products] OFF;
