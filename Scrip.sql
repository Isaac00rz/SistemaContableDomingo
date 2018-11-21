CREATE DATABASE SistemaContable DEFAULT CHARACTER SET utf8 ;

USE SistemaContable;

CREATE TABLE Usuario(
id_usuario  integer NOT NULL auto_increment,
nombre varchar(25) NOT NULL,
contraseña varchar(30),
PRIMARY KEY (id_usuario)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE CatalogoCuentas(
noCuenta varchar(40) NOT NULL,
nombre varchar(40) NOT NULL,
tipo varchar(25) DEFAULT 'acredora',
descripcion varchar(250),
PRIMARY KEY (NoCuenta)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE Polizas(
id_Poliza int auto_increment,
tipo varchar (15) NOT NULL,
fecha date ,
periodo int  NOT NULL,
debe double,
haber double,
concepto varchar(200),
noCuenta varchar(40) not null,
PRIMARY KEY (id_Poliza),
CONSTRAINT polizas_f
FOREIGN KEY (noCuenta)
REFERENCES SistemaContable.CatalogoCuentas (noCuenta)
ON DELETE NO ACTION 
ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



