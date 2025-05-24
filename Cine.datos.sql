USE cine;

INSERT INTO boletos (id_cliente, id_funcion, id_sala, asiento, precio, medio_de_pago)
VALUES
(1, 1, 1, 'A1', 200, 'Tarjeta de Crédito'),
(2, 2, 2, 'B3', 180, 'Efectivo'),
(3, 3, 3, 'C4', 250, 'Tarjeta de Débito'),
(4, 4, 4, 'D2', 150, 'Efectivo'),
(5, 5, 5, 'E5', 220, 'Tarjeta de Crédito'),
(6, 6, 1, 'A2', 210, 'Tarjeta de Débito'),
(7, 7, 2, 'B6', 200, 'Efectivo'),
(8, 8, 3, 'C8', 230, 'Tarjeta de Crédito'),
(9, 9, 4, 'D9', 170, 'Efectivo'),
(10, 10, 5, 'E3', 250, 'Efectivo'),
(11, 11, 1, 'A3', 200, 'Tarjeta de Crédito'),
(12, 12, 2, 'B2', 180, 'Efectivo'),
(13, 13, 3, 'C5', 210, 'Tarjeta de Débito'),
(14, 14, 4, 'D7', 220, 'Paypal'),
(15, 15, 5, 'E8', 240, 'Tarjeta de Crédito'),
(1, 6, 1, 'A4', 210, 'Tarjeta de Crédito'),
(2, 7, 2, 'B4', 190, 'Efectivo'),
(3, 8, 3, 'C1', 250, 'Tarjeta de Débito'),
(4, 9, 4, 'D6', 170, 'Efectivo'),
(5, 10, 5, 'E6', 220, 'Efectivo'),
(6, 11, 1, 'A5', 210, 'Tarjeta de Crédito'),
(7, 12, 2, 'B7', 200, 'Efectivo'),
(8, 13, 3, 'C9', 230, 'Tarjeta de Crédito'),
(9, 14, 4, 'D3', 180, 'Efectivo'),
(10, 15, 5, 'E4', 250, 'Efectivo'),
(11, 1, 1, 'A6', 210, 'Tarjeta de Crédito'),
(12, 2, 2, 'B5', 180, 'Efectivo'),
(13, 3, 3, 'C2', 250, 'Tarjeta de Débito'),
(14, 4, 4, 'D1', 170, 'Efectivo'),
(15, 5, 5, 'E7', 220, 'Efectivo');

SELECT * FROM boletos;

INSERT INTO clientes (id_cliente, nombre, telefono, mail, nacimiento) VALUES
(1, 'Juan Perez', 1123456789, 'juan.perez@mail.com', '1985-03-15'),
(2, 'Ana Garcia', 1187654321, 'ana.garcia@mail.com', '1990-07-22'),
(3, 'Carlos Lopez', 1112233445, 'carlos.lopez@mail.com', '1982-11-30'),
(4, 'Maria Fernandez', 1156677889, 'maria.fernandez@mail.com', '1995-06-12'),
(5, 'Luis Martinez', 1167788990, 'luis.martinez@mail.com', '1988-01-25'),
(6, 'Laura Torres', 1198877665, 'laura.torres@mail.com', '1992-09-10'),
(7, 'Pedro Sanchez', 1123987654, 'pedro.sanchez@mail.com', '1981-04-18'),
(8, 'Sofia Ruiz', 1134567890, 'sofia.ruiz@mail.com', '1993-12-02'),
(9, 'Ricardo Diaz', 1145678901, 'ricardo.diaz@mail.com', '1980-02-20'),
(10, 'Elena Garcia', 1156789012, 'elena.garcia@mail.com', '1987-05-17'),
(11, 'Jorge Hernandez', 1167890123, 'jorge.hernandez@mail.com', '1984-10-30'),
(12, 'Cristina Lopez', 1178901234, 'cristina.lopez@mail.com', '1991-08-19'),
(13, 'Miguel Morales', 1189012345, 'miguel.morales@mail.com', '1983-03-25'),
(14, 'Isabel Gonzalez', 1190123456, 'isabel.gonzalez@mail.com', '1996-11-07'),
(15, 'Andres Perez', 1101234567, 'andres.perez@mail.com', '1990-12-15');

SELECT * FROM clientes;

INSERT INTO funciones (id_funcion, id_movie, id_sala, fecha_hora, aforo) VALUES
(1, 1, 1, '2025-05-15 18:30:00', 100.00),
(2, 2, 2, '2025-05-15 20:45:00', 120.00),
(3, 3, 3, '2025-05-16 17:00:00', 150.00),
(4, 4, 4, '2025-05-16 19:30:00', 80.00),
(5, 5, 5, '2025-05-17 16:00:00', 90.00),
(6, 6, 1, '2025-05-17 18:30:00', 110.00),
(7, 7, 2, '2025-05-18 19:00:00', 95.00),
(8, 8, 3, '2025-05-18 21:15:00', 130.00),
(9, 9, 4, '2025-05-19 15:30:00', 70.00),
(10, 10, 5, '2025-05-19 17:45:00', 100.00),
(11, 11, 1, '2025-05-20 19:00:00', 120.00),
(12, 12, 2, '2025-05-20 21:00:00', 100.00),
(13, 13, 3, '2025-05-21 16:15:00', 130.00),
(14, 14, 4, '2025-05-21 18:45:00', 80.00),
(15, 15, 5, '2025-05-22 17:00:00', 90.00);

SELECT * FROM funciones;

INSERT INTO peliculas (id_movie, titulo, descripcion, genero, director, estreno, duracion, clasificacion) VALUES
(1, 'Inception', 'Un ladrón que roba secretos del subconsciente', 'Ciencia Ficcion', 'Christopher Nolan', '2010-07-16', '02:28:00', 'P'),
(2, 'Titanic', 'Historia de amor en el trágico viaje del Titanic', 'Romance', 'James Cameron', '1997-12-19', '03:15:00', 'P'),
(3, 'The Godfather', 'Saga criminal de la familia Corleone', 'Drama', 'Francis Ford Coppola', '1972-03-24', '02:55:00', 'R'),
(4, 'The Dark Knight', 'Batman enfrenta al Joker', 'Accion', 'Christopher Nolan', '2008-07-18', '02:32:00', 'P'),
(5, 'Pulp Fiction', 'Historias entrelazadas de crimen', 'Crimen', 'Quentin Tarantino', '1994-10-14', '02:34:00', 'R'),
(6, 'Avatar', 'Humano se integra a cultura alienígena', 'Fantasia', 'James Cameron', '2009-12-18', '02:42:00', 'P'),
(7, 'Interstellar', 'Viaje espacial para salvar a la humanidad', 'Ciencia ficcion', 'Christopher Nolan', '2014-11-07', '02:49:00', 'P'),
(8, 'Coco', 'Nico descubre secretos familiares en el Más allá', 'Animacion', 'Lee Unkrich', '2017-10-02', '01:30:00', 'P'),
(9, 'La La Land', 'Dos artistas persiguen sus sueños en L.A.', 'Musical', 'Damien Chazelle', '2016-12-09', '02:08:00', 'P'),
(10, 'Gladiator', 'General romano busca venganza', 'Accion', 'Ridley Scott', '2000-05-05', '02:35:00', 'P'),
(11, 'Toy Story', 'Juguetes cobran vida cuando no los ves', 'Animacion', 'John Lasseter', '1995-11-22', '01:21:00', 'P'),
(12, 'El secreto de sus ojos', 'Investigador revive un crimen sin resolver', 'Drama', 'Juan Jose Campanella', '2009-08-13', '02:09:00', 'P'),
(13, 'El laberinto del fauno', 'Nica se refugia en un mundo fantástico', 'Fantasma', 'Guillermo del Toro', '2006-10-03', '01:30:00', 'P'),
(14, 'Parasite', 'Familia pobre se infiltra en casa de ricos', 'Suspenso', 'Bong Joon-ho', '2019-05-30', '02:12:00', 'R'),
(15, 'Perdida', 'Una mujer parece ser asesinada por su marido', 'Suspenso', 'Ben Affleck', '2014-10-14', '01:30:00', 'R'),
(16, 'Cars', 'Un ganador sobre ruedas', 'Animación', 'Juan Pablo', '2007-07-14', '01:30:00', 'R');

SELECT * FROM peliculas;

INSERT INTO salas (id_sala, nombre_sala, capacidad, categoria) VALUES
(1, 'Sala 1', 150, 'A'),
(2, 'Sala 2', 120, 'B'),
(3, 'Sala 3', 200, 'A'),
(4, 'Sala 4', 80, 'C'),
(5, 'Sala 5', 100, 'B');


SELECT * FROM salas;