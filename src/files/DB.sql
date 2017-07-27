create table alumnos (
	id_alumno INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(32) NOT NULL,
    apellidos VARCHAR(64) NOT NULL,
    fecha_nac DATE NOT NULL,
    UNIQUE KEY id_alumno_uq (id_alumno)
);

create table profesores (
	id_profesor INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(32) NOT NULL,
    apellidos VARCHAR(64) NOT NULL,
    UNIQUE KEY id_profesor_uq (id_profesor)
);

create table asignaturas (
	id_asignatura INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(32) NOT NULL,
    profesor INT NOT NULL,
    UNIQUE KEY id_asignatura_uq (id_asignatura),
    FOREIGN KEY profesor_asignatura(profesor) REFERENCES profesores(id_profesor)
);

CREATE TABLE matriculas (
	alumno INT NOT NULL,
    asignatura INT NOT NULL,
    fecha YEAR NOT NULL,
    nota INT,
    PRIMARY KEY (alumno, asignatura, fecha),
    CONSTRAINT FOREIGN KEY alumno_matriculado(alumno) REFERENCES alumnos(id_alumno) ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY asignatura_matriculada(asignatura) REFERENCES asignaturas(id_asignatura) ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO alumnos (nombre, apellidos, fecha_nac) VALUES ('Ricardo', 'Torre', '1992-08-07');
INSERT INTO alumnos (nombre, apellidos, fecha_nac) VALUES ('Arturo', 'Fernandez-Corredor', '1992-08-07');
INSERT INTO alumnos (nombre, apellidos, fecha_nac) VALUES ('Ignacio', 'Fernandez', '1992-08-07');
INSERT INTO alumnos (nombre, apellidos, fecha_nac) VALUES ('Alejandro', 'Torre', '1992-08-07');
