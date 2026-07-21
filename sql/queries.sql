-- LIBROS DISPONIBLES
SELECT * 
FROM libros
WHERE stock_disponible > 0;

-- LIBROS CON SU AUTOR Y CATEGORIA
SELECT 
    l.titulo,
    a.nombre AS autor,
    c.nombre AS categoria
    l.stock_disponible
FROM libros l
JOIN autores a ON l.autor_id = a.id
JOIN categorias c ON l.categoria_id = c.id;

-- PRESTAMOS ACTIVOS
SELECT
    u.nombre,
    l.titulo,
    p.fecha_prestamo
FROM prestamos p
JOIN usuarios u ON u.id = p.usuario_id
JOIN libros l ON l.id = p.libro_id
WHERE p.fecha_devolucion IS NULL

-- CANTIDAD DE PRESTAMOS POR USUARIO
SELECT
    u.nombre,
    COUNT(*) AS cantidad_prestamos
FROM prestamos p
JOIN usuarios u ON p.usuario_id = u.id
GROUP BY u.id, u.nombre;

-- Mostrar los libros ordenados alfabéticamente por título.
SELECT *
FROM libros 
ORDER BY titulo ASC;

-- Mostrar los préstamos desde el más reciente al más antiguo.
SELECT * 
FROM prestamos
ORDER BY fecha_prestamo DESC;

-- ¿Cuántos usuarios hay registrados?
SELECT COUNT(*) as cantidad_usuarios
FROM usuarios;

-- ¿Cuál es el stock total de todos los libros?
SELECT SUM(stock_total) as stock_total_biblioteca
FROM libros;

-- ¿Cuál es el mayor stock disponible?
SELECT MAX(stock_disponible) as mayor_stock
FROM libros;

-- Mostrar cuántos préstamos realizó cada usuario
SELECT 
    u.nombre,
    COUNT(*) AS cantidad_prestamos
FROM prestamos p
JOIN usuarios u on u.id = p.usuario_id
GROUP BY u.id, u.nombre;

-- Mostrar cuántos libros tiene cada categoría
SELECT
    c.nombre,
    COUNT(*) as cantidad_libros
FROM libros l   
JOIN categorias c on c.id = l.categoria_id                        # REVISAR MEJOR DESPUES
GROUP BY c.id, c.nombre;

-- Mostrar cuántos libros escribió cada autor
SELECT 
    a.nombre,
    COUNT(*) as cantidad_libros
FROM libros l
JOIN autores a on a.id = l.autor_id
GROUP BY a.id, a.nombre;

-- Mostrar el stock total por categoría.
SELECT 
    c.nombre,
    SUM(l.stock_total) as total_stock
FROM libros l
JOIN categorias c on c.id = l.categoria_id
GROUP BY c.id, c.nombre;

-- Mostrar únicamente los usuarios que tengan más de un préstamo.
SELECT 
    u.nombre,
    COUNT(*) AS cantidad_prestamos
FROM prestamos p
JOIN usuarios u on u.id = p.usuario_id                              # NO ME FUNCIONA
GROUP BY u.id, u.nombre
HAVING COUNT(*) > 1;

-- Mostrar únicamente las categorías que tengan más de un libro.
SELECT
    c.nombre,
    COUNT(*) AS cantidad_libros
FROM libro l
JOIN categorias c on c.id = l.categoria_id
GROUP BY c.id, c.nombre
HAVING COUNT(*) > 1;

-- Mostrar únicamente los autores que tengan dos o más libros registrados.
SELECT
    a.nombre,
    COUNT(*) AS cantidad_libros
FROM libros l
JOIN autores a on a.id = l.autor_id
GROUP BY a.id, a.nombre
HAVING COUNT(*) >= 2;

-- Mostrar las categorías cuyo stock total sea mayor a 10.
SELECT 
    c.nombre,
    SUM(l.stock_total) as stock_total
FROM libros l
JOIN categorias c on c.id = l.categoria_id
GROUP BY c.id, c.nombre
HAVING SUM(l.tock_total) > 10;

-- Mostrar los libros que nunca fueron prestados.
SELECT
    l.titulo
FROM libros l
LEFT JOIN prestamos p on p.libro_id = l.id
WHERE p.id is null;

-- Mostrar los usuarios que nunca pidieron un préstamo.
SELECT u.nombre
FROM usuarios u
LEFT JOIN prestamos p on p.usuario_id = u.id
WHERE p.id is null;