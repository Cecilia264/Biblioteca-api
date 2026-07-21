insert into usuarios
values 
    (null, "Cecilia", "Cometto", "cecicometto@gmail.com"),
    (null, "Juan", "Perez", "juanperez@gmail.com")

insert into categorias
values
    (null, "Novela"),
    (null, "Tecnologia")

insert into autores
values
    (null, "Gabriel Garcia Marquez"),
    (null, "Edgar Allan Poe")

insert into libros 
values 
    (null, "Cien años de soledad", 1, 1, 5, 5), 
    (null, "Las aventuras de Arthur Gordon Pym", 2, 1, 3, 3); 

insert into prestamos(usuario_id, libro_id, fecha_prestamo) 
values 
    (1, 1, CURDATE()), 
    (2, 2, CURDATE());