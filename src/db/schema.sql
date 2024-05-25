
-- Create table for users
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    role TEXT NOT NULL,
    address TEXT NOT NULL,
    status TEXT NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Create table for properties
CREATE TABLE properties (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    price INTEGER NOT NULL,
    deposit INTEGER NOT NULL,
    property_type TEXT NOT NULL,
    room INTEGER,
    furnishing_status TEXT NOT NULL,
    address TEXT NOT NULL,
    city TEXT NOT NULL,
    state TEXT NOT NULL,
    zip_code INTEGER NOT NULL,
    status TEXT NOT NULL,
    description TEXT NOT NULL,
    agreement_start_date DATE,
    agreement_end_date DATE,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Create table for features
CREATE TABLE features (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    property_id INTEGER,
    feature TEXT NOT NULL,
    bed_room INTEGER NOT NULL,
    bath_room INTEGER NOT NULL,
    sq_feet INTEGER NOT NULL,
    location_url TEXT NOT NULL,
    parking BOOLEAN NOT NULL,
    basement BOOLEAN NOT NULL,
    floor INTEGER,
    floor_direction TEXT,
    number_floors INTEGER,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (property_id) REFERENCES properties(id)
);

-- Create table for images
CREATE TABLE images (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    property_id INTEGER,
    image_url TEXT NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (property_id) REFERENCES properties(id)
);

-- Create table for likes and dislikes 
CREATE TABLE likes_dislikes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    property_id INTEGER NOT NULL,
    like_dislike BOOLEAN NOT NULL, -- true for like, false for dislike
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (property_id) REFERENCES properties(id)
);

-- -- Insert sample property
-- INSERT INTO properties (title, price, property_type, furnishing_status, area, description) VALUES
-- ('1307 Torero Mansions, London, E20 1DW', '£2,280 pcm', 'One bed', 'Furnished', '72 sqm', 'Located on the 4th floor of Torero Mansions, this light and bright, one bedroom, one bathroom home is available immediately to rent fully-furnished.');

-- -- Get the last inserted property ID
-- SELECT last_insert_rowid();

-- -- Assuming the last inserted ID is 1
-- -- Insert sample features
-- INSERT INTO features (property_id, feature) VALUES
-- (1, 'Wifi'),
-- (1, 'Pets allowed'),
-- (1, 'Bike storage');

-- -- Insert sample images
-- INSERT INTO images (property_id, image_url) VALUES
-- (1, 'https://example.com/image1.jpg'),
-- (1, 'https://example.com/image2.jpg');

