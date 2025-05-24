USE cine;
   -- PROCEDURE 1 
    DELIMITER //

CREATE PROCEDURE obtener_clientes_funcion (IN id_func INT)
BEGIN
    SELECT c.*
    FROM clientes c
    INNER JOIN boletos b ON c.id_cliente = b.id_cliente
    WHERE b.id_funcion = id_func;
END //

DELIMITER ;

CALL obtener_clientes_funcion(2);

-- PROCEDURE 2

    DELIMITER //

CREATE PROCEDURE obtener_clientes_Segun_pago (IN b_medio_de_pago varchar(50))
BEGIN
	SELECT * FROM boletos
    WHERE medio_de_pago = b_medio_de_pago;
    END //
    
    DELIMITER ; 


CALL obtener_clientes_segun_pago('efectivo');


-- parte 2 actividad práctica clase 8

DELIMITER //

CREATE PROCEDURE listar_peliculas_ordenadas (
    IN campo_orden VARCHAR(50),
    IN sentido_orden VARCHAR(4))
BEGIN
    SET @query = CONCAT('SELECT id_movie, titulo, genero, director, estreno FROM peliculas ORDER BY ', campo_orden, ' ', sentido_orden);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //

DELIMITER ;

-- Este SP permite consultar todas las columnas de la tabla peliculas de manera ascendente o descendente
CALL listar_peliculas_ordenadas ('estreno','asc');

-- ejemplo 2

DELIMITER //

CREATE PROCEDURE InsertarPelicula(
    IN p_titulo VARCHAR(50),
    IN p_descripcion VARCHAR(500),
    IN p_genero VARCHAR(20),
    IN p_director VARCHAR(50),
    IN p_estreno DATE,
    IN p_duracion TIME,
    IN p_clasificacion TEXT
)
BEGIN
    INSERT INTO Peliculas (titulo, descripcion, genero, director, estreno, duracion, clasificacion)
    VALUES (p_titulo, p_descripcion, p_genero, p_director, p_estreno, p_duracion, p_clasificacion);
END //

DELIMITER ;

-- Este procedimiento permite incluir dentro de la tabla peliculas un nuevo título

CALL insertarpelicula ('Cars','Un ganador sobre ruedas','Animación','Juan Pablo','2007-07-14','01:30:00','R'); 
SELECT * FROM peliculas;




------------------------------------------------------------------------------------------------------
-- Funciones

-- Ejemplo 1 -- Nos permite saber cuantas funciones tenemos hoy y en base a eso organizar el día.

DELIMITER //

CREATE FUNCTION cantidad_funciones_hoy()
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total INT;

    SELECT COUNT(*) INTO total
    FROM funciones
    WHERE DATE(fecha_hora) = CURDATE();

    RETURN total;
END //

DELIMITER ;

SELECT cantidad_funciones_hoy();

-- Ejemplo 2 -- nos permite saber cuantos boletos se vendieron el día de hoy. Si quisieramos podríamos agregarle mas información necesaria

DELIMITER //

CREATE FUNCTION cantidad_boletos_hoy()
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total INT;

    SELECT COUNT(*) INTO total
    FROM boletos b
    INNER JOIN funciones f ON b.id_funcion = f.id_funcion
    WHERE DATE(f.fecha_hora) = CURDATE();

    RETURN total;
END //

DELIMITER ;

SELECT cantidad_boletos_hoy();

-- ejemplo 3 -- Nos permite conocer cuantos boletos sacó cada cliente y de esa manera crar estrategias de venta a futuro. 

DELIMITER //

CREATE FUNCTION cantidad_boletos_cliente(p_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM boletos
    WHERE id_cliente = p_id;
    RETURN total;
END //

DELIMITER ;

SELECT nombre, cantidad_boletos_cliente(id_cliente) AS entradas FROM clientes;
