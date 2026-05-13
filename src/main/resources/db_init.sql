CREATE DATABASE IF NOT EXISTS foodapp;
USE foodapp;

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(20) DEFAULT 'user'
);

-- Food items table
CREATE TABLE IF NOT EXISTS food_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    image_url VARCHAR(255)
);

-- Orders table
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    food_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (food_id) REFERENCES food_items(id)
);

-- Sample users
INSERT INTO users (name, email, password, role) VALUES
('Admin', 'admin@citybite.com', 'admin123', 'admin'),
('John Doe', 'john@example.com', 'john123', 'user');

-- Sample food items
INSERT INTO food_items (name, price, image_url) VALUES
('Margherita Pizza', 9.99, 'https://via.placeholder.com/150?text=Pizza'),
('Cheeseburger', 7.49, 'https://via.placeholder.com/150?text=Burger'),
('Chicken Tikka', 12.99, 'https://via.placeholder.com/150?text=Tikka'),
('Veggie Wrap', 6.99, 'https://via.placeholder.com/150?text=Wrap'),
('Pasta Alfredo', 10.49, 'https://via.placeholder.com/150?text=Pasta');