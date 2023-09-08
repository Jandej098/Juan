/*para accder a la base de datos */ 
mysql -h localhost -u root -p
/*para crear la base de datos*/
CREATE DATABASE blog;
/*desiganar que base de datos vas a utilizar*/
USE blog;
/*crear la tabla de la base de datos*/ 
CREATE TABLE IF NOT EXISTS usuarios (
    usuarios_id INTEGER UNSIGNED AUTO_INCREMENT,
    login VARCHAR(30) NOT NULL,
    password  VARCHAR(30) NOT NULL,
    nickname VARCHAR(30) NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE,
    PRIMARY KEY (usuarios_id)
);


CREATE TABLE IF NOT EXISTS categorias (
    categorias_id INTEGER UNSIGNED AUTO_INCREMENT,
    categoria VARCHAR(30),
    PRIMARY KEY (categorias_id)
);



CREATE TABLE IF NOT EXISTS etiquetas (
    etiquetas_id INTEGER UNSIGNED AUTO_INCREMENT,
    nombre_etiqueta VARCHAR(30),
    PRIMARY KEY (etiquetas_id)
);
ALTER TABLE posts ADD FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id);
 
 CREATE TABLE IF NOT EXISTS posts_etiquetas (
    id INTEGER UNSIGNED AUTO_INCREMENT,
    etiquetas_id INTEGER ,
    posts_id INTEGER,
        PRIMARY KEY (id)

  );
CREATE TABLE IF NOT EXISTS comentarios (
    comentarios_id INTEGER UNSIGNED AUTO_INCREMENT,
    comentario TEXT ,
    usuario_id INTEGER,
    posts_id INTEGER,
        PRIMARY KEY (comentarios_id)

  );

ALTER TABLE posts ADD categorias_id INTEGER;
 
ALTER TABLE posts ADD FOREIGN KEY (categorias_id) REFERENCES categorias(categoria_id);

ALTER TABLE comentarios ADD FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id); 
ALTER TABLE comentarios ADD FOREIGN KEY (posts_id) REFERENCES posts(posts_id); 

ALTER TABLE posts_etiquetas ADD FOREIGN KEY (etiquetas_id) REFERENCES etiquetas(etiqueta_id); 
ALTER TABLE posts_etiquetas ADD FOREIGN KEY (posts_id) REFERENCES posts(posts_id); 