
CREATE TABLE Alumnos(
    Legajo INT PRIMARY KEY,
    NombreCompleto VARCHAR(50),
    Apellido VARCHAR(50),
    EmailContacto VARCHAR(100)
);

INSERT INTO Alumnos (Legajo, NombreCompleto, Apellido, EmailContacto)
VALUES
    (201, 'Luisa', 'Martínez', 'luisa@gmail.com'),
    (202, 'Juan', 'González', 'juan@gmail.com'),
    (203, 'Ana', 'Pérez', 'ana@example.com');


CREATE TABLE SellosEditoriales (
    CódigoSello INT PRIMARY KEY,
    NombreSello VARCHAR(100)
);


INSERT INTO SellosEditoriales (CódigoSello, NombreSello)
VALUES
    (301, 'Sello X'),
    (302, 'Sello Y'),
    (303, 'Sello Z');

CREATE TABLE BibliotecaLibros (
    ISBNLibro VARCHAR(13) PRIMARY KEY,
    TítuloLibro VARCHAR(100),
    SelloEditorial INT,
    FOREIGN KEY (SelloEditorial) REFERENCES SellosEditoriales(CódigoSello)
);


INSERT INTO BibliotecaLibros (ISBNLibro, TítuloLibro, SelloEditorial)
VALUES
    ('9787777777777', 'Libro G', 301),
    ('9788888888888', 'Libro H', 302),
    ('9789999999999', 'Libro I', 303);

-- Creo la tabla RegistroLectura (Tabla intermedia para la relación entre Alumnado y BibliotecaLibros)
CREATE TABLE RegistroLectura (
    IDRegistroLectura INT PRIMARY KEY,
    LegajoEstudiante INT,
    ISBNLibroLectura VARCHAR(13),
    FOREIGN KEY (LegajoEstudiante) REFERENCES Alumnos(Legajo),
    FOREIGN KEY (ISBNLibroLectura) REFERENCES BibliotecaLibros(ISBNLibro)
);

-- Insertar datos de ejemplo en la tabla RegistroLectura
INSERT INTO RegistroLectura (IDRegistroLectura, LegajoEstudiante, ISBNLibroLectura)
VALUES
    (4, 201, '9787777777777'),
    (5, 202, '9788888888888'),
    (6, 203, '9789999999999');
