SET IDENTITY_INSERT [dbo].[Products] ON;

MERGE INTO [dbo].[Products] AS target
USING (VALUES
    (1, 'Football', 'Official size and weight football for professional games', 'Sports Equipment', 29.99),
    (2, 'Basketball', 'Indoor/outdoor basketball with superior grip', 'Sports Equipment', 24.99),
    (3, 'Tennis Racket', 'Lightweight graphite tennis racket for powerful shots', 'Sports Equipment', 89.99),
    (4, 'Baseball Glove', 'Leather baseball glove for infield and outfield play', 'Sports Equipment', 59.99),
    (5, 'Soccer Ball', 'FIFA-approved match-quality soccer ball', 'Sports Equipment', 34.99),
    (6, 'Golf Club Set', 'Complete set of golf clubs with carry bag', 'Sports Equipment', 299.99),
    (7, 'Yoga Mat', 'Eco-friendly non-slip yoga mat with carrying strap', 'Fitness', 24.99),
    (8, 'Dumbbell Set', 'Adjustable dumbbell set with 5-25 lbs range', 'Fitness', 79.99),
    (9, 'Treadmill', 'Foldable home treadmill with incline and LCD display', 'Fitness', 499.99),
    (10, 'Punching Bag', 'Heavy-duty punching bag with hanging chains', 'Boxing', 149.99),
    (11, 'Boxing Gloves', '12oz premium boxing gloves for training', 'Boxing', 49.99),
    (12, 'Table Tennis Set', 'Ping pong paddles and balls set for competitive play', 'Sports Equipment', 39.99),
    (13, 'Resistance Bands', 'Set of 5 resistance bands for strength training', 'Fitness', 29.99),
    (14, 'Kayak', 'Inflatable one-person kayak with paddles', 'Water Sports', 199.99),
    (15, 'Fishing Rod', 'Carbon fiber fishing rod with reel and line', 'Fishing', 79.99),
    (16, 'Hiking Backpack', '50L waterproof hiking backpack with compartments', 'Outdoor Gear', 99.99),
    (17, 'Skateboard', '7-ply maple skateboard for tricks and cruising', 'Extreme Sports', 69.99),
    (18, 'Snowboard', 'All-mountain snowboard for intermediate riders', 'Winter Sports', 249.99),
    (19, 'Ski Goggles', 'Anti-fog ski goggles with UV protection', 'Winter Sports', 39.99),
    (20, 'Swimming Goggles', 'Anti-fog, UV-protected swimming goggles', 'Water Sports', 19.99),
    (21, 'Cycling Helmet', 'Lightweight aerodynamic cycling helmet', 'Cycling', 59.99),
    (22, 'Mountain Bike', '21-speed mountain bike with shock absorption', 'Cycling', 499.99),
    (23, 'Camping Tent', '2-person waterproof camping tent with easy setup', 'Outdoor Gear', 89.99),
    (24, 'Climbing Rope', '50ft dynamic climbing rope with high durability', 'Climbing', 109.99),
    (25, 'Archery Set', 'Recurve bow with arrows and arm guard', 'Archery', 149.99),
    (26, 'Baseball Bat', 'Aluminum baseball bat for training and games', 'Sports Equipment', 49.99),
    (27, 'Volleyball', 'Official size volleyball with soft-touch technology', 'Sports Equipment', 29.99),
    (28, 'Tennis Ball Pack', 'Set of 12 high-quality pressurized tennis balls', 'Sports Equipment', 25.99),
    (29, 'Foam Roller', 'High-density foam roller for muscle recovery', 'Fitness', 34.99),
    (30, 'Weightlifting Belt', 'Adjustable leather weightlifting belt for support', 'Fitness', 44.99),
    (31, 'Rowing Machine', 'Magnetic resistance rowing machine for home workouts', 'Fitness', 349.99),
    (32, 'Jump Rope', 'Speed jump rope with adjustable length', 'Fitness', 14.99),
    (33, 'Soccer Cleats', 'Firm ground soccer cleats for improved traction', 'Sportswear', 59.99),
    (34, 'Wetsuit', 'Full-body wetsuit for surfing and diving', 'Water Sports', 129.99),
    (35, 'Surfboard', 'Longboard surfboard for beginners and intermediates', 'Water Sports', 299.99),
    (36, 'Lacrosse Stick', 'Complete lacrosse stick for midfield and attack', 'Sports Equipment', 79.99),
    (37, 'Gymnastic Rings', 'Wooden gymnastic rings with adjustable straps', 'Fitness', 49.99),
    (38, 'Bicycle Pump', 'High-pressure bicycle pump with gauge', 'Cycling', 24.99),
    (39, 'Kettlebell', 'Cast iron kettlebell with ergonomic grip', 'Fitness', 54.99),
    (40, 'Roller Skates', 'Adjustable roller skates for indoor and outdoor use', 'Skating', 79.99)
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