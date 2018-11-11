create DATABASE SistemaContable DEFAULT CHARACTER SET utf8 ;

use SistemaContable;

create table Usuario(
id_usuario  integer not null auto_increment,
nombre varchar(25) not null,
contraseña varchar(30),
PRIMARY KEY (id_usuario)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

create table CatalogoCuentas(
noCuenta varchar(40) not null,
nombre varchar(40) not null,
tipo varchar(25) default 'acredora',
descripcion varchar(250),
PRIMARY KEY (NoCuenta)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;