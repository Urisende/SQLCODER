DROP DATABASE IF EXISTS cine;
CREATE DATABASE cine ;
USE cine;

DROP TABLE IF EXISTS peliculas
CREATE TABLE peliculas (
id_movie INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
titulo VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
genero VARCHAR(20) NOT NULL, 
director VARCHAR(50) NOT NULL,
estreno DATE NOT NULL,
duracion TIME NOT NULL,
clasificacion TEXT NOT NULL
);

DROP TABLE IF EXISTS clientes
CREATE TABLE clientes (
id_cliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nombre VARCHAR(50) NOT NULL,
telefono INT NOT NULL,
mail VARCHAR(50) NOT NULL,
nacimiento DATE NOT NULL
);

DROP TABLE IF EXISTS salas
CREATE TABLE salas (
id_sala INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nombre_sala VARCHAR(15) NOT NULL,
capacidad SMALLINT NOT NULL,
categoria VARCHAR(2) NOT NULL
);

DROP TABLE IF EXISTS funciones
CREATE TABLE funciones (
id_funcion INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_movie INT NOT NULL,
id_sala INT NOT NULL,
fecha_hora DATETIME NOT NULL,
aforo DECIMAL(5,2) NOT NULL,
FOREIGN KEY (id_movie) REFERENCES peliculas(id_movie),
FOREIGN KEY (id_sala) REFERENCES salas(id_sala));

DROP TABLE IF EXISTS boletos
CREATE TABLE boletos (
id_boletos INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_cliente INT NOT NULL,
id_funcion INT NOT NULL,
id_sala INT NOT NULL,
asiento VARCHAR(4) NOT NULL,
precio INT NOT NULL,
medio_de_pago VARCHAR(25),
FOREIGN KEY (id_cliente) REFERENCES clientes(id_Cliente),
FOREIGN KEY (id_funcion) REFERENCES funciones(id_funcion),
FOREIGN KEY (id_sala) REFERENCES salas(id_sala)
);