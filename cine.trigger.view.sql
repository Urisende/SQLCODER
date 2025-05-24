USE CINE;

CREATE VIEW v_funciones_hoy AS
SELECT * FROM funciones 
WHERE DATE(fecha_hora) = CURDATE();

SELECT * FROM v_funciones_hoy;

CREATE VIEW v_funciones_sala1 AS
SELECT 
    f.id_funcion,
    f.fecha_hora,
    s.nombre_sala,
    p.titulo,
    p.genero,
    p.duracion
FROM funciones f
JOIN peliculas p ON f.id_movie = p.id_movie
JOIN salas s ON f.id_sala = s.id_sala
WHERE DATE(f.fecha_hora) = CURDATE()
  AND s.nombre_sala = 'Sala 1';

SELECT * FROM v_funciones_sala1;

CREATE VIEW v_peliculas_funciones AS
SELECT p.id_movie, p.titulo, f.id_funcion, f.fecha_hora
FROM peliculas p
INNER JOIN funciones f ON p.id_movie = f.id_movie
WHERE DATE(f.fecha_hora) = CURDATE();

SELECT * FROM v_peliculas_funciones;

-- TRIGGERS --------------------------------------------

-- Ejemplo 1 -- Que no se supere el máximo aforo de la sala

DELIMITER //

CREATE TRIGGER trg_validar_aforo_insert
BEFORE INSERT ON funciones
FOR EACH ROW
BEGIN
    DECLARE max_capacidad SMALLINT;

    SELECT capacidad INTO max_capacidad FROM salas WHERE id_sala = NEW.id_sala;

    IF NEW.aforo > max_capacidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Aforo supera la capacidad de la sala';
    END IF;
END //

DELIMITER // 

CREATE TRIGGER trg_validar_aforo_update
BEFORE UPDATE ON funciones
FOR EACH ROW
BEGIN
    DECLARE max_capacidad SMALLINT;

    SELECT capacidad INTO max_capacidad FROM salas WHERE id_sala = NEW.id_sala;

    IF NEW.aforo > max_capacidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Aforo supera la capacidad de la sala';
    END IF;
END //

DELIMITER ;

-- ejemplo 2 -- Que no se dupliquen asientos

DELIMITER //

CREATE TRIGGER trg_validar_asiento_duplicado
BEFORE INSERT ON boletos
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM boletos
        WHERE id_funcion = NEW.id_funcion
          AND id_sala = NEW.id_sala
          AND asiento = NEW.asiento
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Asiento ya ocupado para esta función y sala';
    END IF;
END //

DELIMITER ;

