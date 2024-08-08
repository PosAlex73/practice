-- Создание базы данных
CREATE DATABASE Tourism;
USE Tourism;

-- Создание таблицы услуг
CREATE TABLE services (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Создание таблицы клиентов
CREATE TABLE clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Создание таблицы туров
CREATE TABLE tours (
    tour_id INT AUTO_INCREMENT PRIMARY KEY,
    tour_name VARCHAR(100) NOT NULL,
    destination_id INT,
    start_date DATE,
    end_date DATE,
    price DECIMAL(10, 2),
    FOREIGN KEY (destination_id) REFERENCES destinations(destination_id)
);

-- Создание таблицы направлений
CREATE TABLE destinations (
    destination_id INT AUTO_INCREMENT PRIMARY KEY,
    destination_name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Создание таблицы размещений
CREATE TABLE accommodations (
    accommodation_id INT AUTO_INCREMENT PRIMARY KEY,
    accommodation_name VARCHAR(100) NOT NULL,
    destination_id INT,
    price_per_night DECIMAL(10, 2),
    FOREIGN KEY (destination_id) REFERENCES destinations(destination_id)
);

-- Создание таблицы транспорта
CREATE TABLE transport (
    transport_id INT AUTO_INCREMENT PRIMARY KEY,
    transport_type VARCHAR(50) NOT NULL,
    price_per_km DECIMAL(10, 2)
);

-- Создание таблицы заказов
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    tour_id INT,
    order_date DATE,
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (tour_id) REFERENCES tours(tour_id)
);

-- Создание таблицы услуг в туре
CREATE TABLE tour_services (
    tour_service_id INT AUTO_INCREMENT PRIMARY KEY,
    tour_id INT,
    service_id INT,
    FOREIGN KEY (tour_id) REFERENCES tours(tour_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);

-- Создание таблицы деталей заказа
CREATE TABLE order_details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    accommodation_id INT,
    transport_id INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (accommodation_id) REFERENCES accommodations(accommodation_id),
    FOREIGN KEY (transport_id) REFERENCES transport(transport_id)
);

-- Создание связей между таблицами
ALTER TABLE tours ADD CONSTRAINT fk_destination FOREIGN KEY (destination_id) REFERENCES destinations(destination_id);
ALTER TABLE accommodations ADD CONSTRAINT fk_accommodation_destination FOREIGN KEY (destination_id) REFERENCES destinations(destination_id);
ALTER TABLE orders ADD CONSTRAINT fk_order_client FOREIGN KEY (client_id) REFERENCES clients(client_id);
ALTER TABLE orders ADD CONSTRAINT fk_order_tour FOREIGN KEY (tour_id) REFERENCES tours(tour_id);
ALTER TABLE tour_services ADD CONSTRAINT fk_tour_service_tour FOREIGN KEY (tour_id) REFERENCES tours(tour_id);
ALTER TABLE tour_services ADD CONSTRAINT fk_tour_service_service FOREIGN KEY (service_id) REFERENCES services(service_id);
ALTER TABLE order_details ADD CONSTRAINT fk_order_detail_order FOREIGN KEY (order_id) REFERENCES orders(order_id);
ALTER TABLE order_details ADD CONSTRAINT fk_order_detail_accommodation FOREIGN KEY (accommodation_id) REFERENCES accommodations(accommodation_id);
ALTER TABLE order_details ADD CONSTRAINT fk_order_detail_transport FOREIGN KEY (transport_id) REFERENCES transport(transport_id);