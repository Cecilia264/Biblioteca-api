CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE categorias(
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

CREATE TABLE autores(
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
);

CREATE TABLE usuarios(
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE libros(
id INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(150) NOT NULL,
autor_id INT NOT NULL,
categoria_id INT NOT NULL,
stock_total INT NOT NULL CHECK(stock_total >= 0),
stock_disponible INT NOT NULL CHECK(stock_disponible >=0),

FOREIGN KEY(autor_id) REFERENCES autores(id),
FOREIGN KEY(categoria_id) REFERENCES categorias(id)
);

CREATE TABLE prestamos(
id INT AUTO_INCREMENT PRIMARY KEY,
usuario_id INT NOT NULL,
libro_id INT NOT NULL,
fecha_prestamo DATE NOT NULL,
fecha_devolucion DATE,

FOREIGN KEY(usuario_id) REFERENCES usuarios(id),
FOREIGN KEY(libro_id) REFERENCES libros(id)
);