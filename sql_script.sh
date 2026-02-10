-- Инициализация Шарда 1 (A1.1) - пользователи 1-500000
CREATE TABLE users (
    user_id BIGINT PRIMARY KEY CHECK (user_id >= 1 AND user_id <= 500000),
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    region VARCHAR(20) DEFAULT 'Filial 1-3'
);
INSERT INTO users (user_id, username, email) VALUES (1, 'alex_w', 'alex@example.com');

-- Инициализация Шарда 2 (A1.2) - пользователи 500001-1000000
CREATE TABLE users (
    user_id BIGINT PRIMARY KEY CHECK (user_id >= 500001 AND user_id <= 1000000),
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    region VARCHAR(20) DEFAULT 'Filial 4-7'
);
INSERT INTO users (user_id, username, email) VALUES (500001, 'ivan_e', 'ivan@example.com');

-- Инициализация Шарда B (книги) - вертикальный шард
CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    price DECIMAL(10,2)
);
INSERT INTO books (title, price) VALUES ('Война и мир', 1500.00);

-- Инициализация Шарда C (магазины и филиалы) - вертикальный шард
CREATE TABLE filials (
    filial_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
INSERT INTO filials (name) VALUES ('Filials 1-3'), ('Filials 4-7');

CREATE TABLE stores (
    store_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    filial_id INT REFERENCES filials(filial_id)
);
INSERT INTO stores (name, filial_id) VALUES ('Central Store', 1), ('Western Filial', 2);
