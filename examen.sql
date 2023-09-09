CREATE TABLE IF NOT EXISTS Modificaciones (
    Modificaciones_id INTEGER AUTO_INCREMENT,
    Altas VARCHAR(40) NOT NULL,
    Modificaciones VARCHAR(40) NOT NULL,
    Eliminaciones VARCHAR(40) NOT NULL,
    PRIMARY KEY (Modificaciones_id)
);

CREATE TABLE IF NOT EXISTS Administrador (
    admin_id INTEGER AUTO_INCREMENT,
    login VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL,
    nickname VARCHAR(30) NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE,
    Modificaciones_id INTEGER,
    PRIMARY KEY (admin_id),
    FOREIGN KEY (Modificaciones_id) REFERENCES Modificaciones(Modificaciones_id)
);

CREATE TABLE IF NOT EXISTS Clientes (
    Clientes_id INTEGER AUTO_INCREMENT,
    Nombre TEXT NOT NULL,
    membresia INTEGER NOT NULL,
    CHECK (membresia = 1),
    dia INTEGER NOT NULL,
    Modificaciones_id INTEGER,
    PRIMARY KEY (Clientes_id),
    FOREIGN KEY (Modificaciones_id) REFERENCES Modificaciones(Modificaciones_id)
);

CREATE TABLE IF NOT EXISTS Nutriologo (
    Nutriologo_id INTEGER AUTO_INCREMENT,
    Nombre TEXT(30) NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    telefono INTEGER NOT NULL,
    membresia INTEGER NOT NULL,
    CHECK (membresia = 1),
    Modificaciones_id INTEGER,
    PRIMARY KEY (Nutriologo_id),
    FOREIGN KEY (Modificaciones_id) REFERENCES Modificaciones(Modificaciones_id)
);

CREATE TABLE IF NOT EXISTS Instructor (
    Instructor_id INTEGER AUTO_INCREMENT,
    Nombre TEXT(30) NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    telefono INTEGER NOT NULL,
    Modificaciones_id INTEGER,
    PRIMARY KEY (Instructor_id),
    FOREIGN KEY (Modificaciones_id) REFERENCES Modificaciones(Modificaciones_id)
);
