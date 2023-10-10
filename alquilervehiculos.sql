/*inicio del script*/

CREATE DATABASE alquilervehiculos;
USE alquilervehiculos;

CREATE TABLE estadoatencion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estado INT,
    nombre VARCHAR(20)
);

CREATE TABLE marca (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50)
);

CREATE TABLE tipocombustible (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipocombustible VARCHAR(50)
);

CREATE TABLE tipomanejo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipomanejo VARCHAR(50)
);

CREATE TABLE tipocarro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipocarro VARCHAR(50)
);

CREATE TABLE tapizadoasientos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tapizadoasientos VARCHAR(50)
);

CREATE TABLE vehiculo (
    id INT AUTO_INCREMENT PRIMARY KEY,    
	idmarca INT NOT NULL,
    idcombustible INT NOT NULL,
    idtipomanejo INT NOT NULL,
    idtipocarro INT NOT NULL,
    idtapizadoasientos INT NOT NULL,
    placa VARCHAR(50) UNIQUE,
    asientos INT,
    modelo VARCHAR(50),
    anio INT,
    precio DECIMAL(10,2),
    estado INT,
    foto LONGTEXT,
    descripcion LONGTEXT,
	CONSTRAINT fk_idmarca FOREIGN KEY (idmarca) REFERENCES marca (id),
    CONSTRAINT fk_idcombustible FOREIGN KEY (idcombustible) REFERENCES tipocombustible (id),
    CONSTRAINT fk_idtipomanejo FOREIGN KEY (idtipomanejo) REFERENCES tipomanejo (id),
    CONSTRAINT fk_idtipocarro FOREIGN KEY (idtipocarro) REFERENCES tipocarro (id),
    CONSTRAINT fk_idtapizadoasientos FOREIGN KEY (idtapizadoasientos) REFERENCES tapizadoasientos (id)
);

CREATE TABLE alquiler (
	id INT AUTO_INCREMENT PRIMARY KEY,   
    idvehiculo INT NOT NULL,
	idestadoatencion INT NOT NULL,
    codigoalquiler INT,
	nombres VARCHAR(50),
	apellidos VARCHAR(50),
    dni INT,
	email VARCHAR(50),
	pais VARCHAR(50),
    departamento VARCHAR(50),
    distrito VARCHAR(50),
	direccion VARCHAR(50),	
	telefono1 VARCHAR(50),
	telefono2 VARCHAR(50),
    fechasolicitud date,
	fechainicio date,
	fechafin date,
    diasalquiler int,
	lugarrecojo VARCHAR(50),
	lugardevolucion VARCHAR(50),
    comentarios longtext,
    preciofinal double,
   	CONSTRAINT fk_idvehiculo FOREIGN KEY (idvehiculo) REFERENCES vehiculo (id),
	CONSTRAINT fk_idestadoatencion FOREIGN KEY (idestadoatencion) REFERENCES estadoatencion (id)
);

CREATE TABLE contacto (
	id INT AUTO_INCREMENT PRIMARY KEY,
	idestadoatencion INT NOT NULL,
	nombres VARCHAR(50),
	apellidos VARCHAR(50),
	email VARCHAR(50),
	celular VARCHAR(50),
	comentarios LONGTEXT,
	CONSTRAINT fk_idestadoatencioncontacto FOREIGN KEY (idestadoatencion) REFERENCES estadoatencion (id)
);

CREATE TABLE cuponesdescuento (
  id INT AUTO_INCREMENT PRIMARY KEY,
  idvehiculo INT NOT NULL unique,
  porcentajedescuento double,
  codigodescuento varchar(50),
  CONSTRAINT fk_cuponesdescuento_idvehiculo FOREIGN KEY (idvehiculo) REFERENCES vehiculo (id)
);

/*fin del script*/