CREATE TABLE Libro (
  ISBN INTEGER   NOT NULL,
  Titulo CHAR(50),
  Autor CHAR(50),
  Editorial CHAR(50),
  Año_Publicacion INTEGER,
  Estado BOOL,
  Categoria CHAR(50),
  Precio INTEGER,
PRIMARY KEY(ISBN));

INSERT INTO Libro (ISBN, Titulo, Autor, Editorial, Año_Publicacion, Estado, Categoria, Precio) 
VALUES (978963, 'Cien Años De Soledad', 'Gabriel Garcia Marquez', 'Prolibros', 1982, TRUE, 'Fantasia', 100000);


CREATE TABLE Empleado (
  ID_Empleado INTEGER   NOT NULL,
  Cedula INTEGER   NOT NULL ,
  Nombre CHAR(20)    ,
  Apellido CHAR(20)    ,
  Cargo CHAR(15)    ,
  Direccion CHAR(50)    ,
  Telefono INTEGER    ,
  Salario INTEGER    ,
  Correo CHAR(30)    ,
  Fecha_Contrato DATE      ,
PRIMARY KEY(ID_Empleado, Cedula));

INSERT INTO Empleado (ID_Empleado, Cedula, Nombre, Apellido, Cargo, Direccion, Telefono, Salario, Correo, Fecha_Contrato) 
VALUES (31337, 1112106363, 'Andres Felipe', 'Leal Villa', 'Vendedor', 'Carrera 3 #19-24', 2235070, 2500000, 'anfelevi@hotmail.com', '2018-05-01');

CREATE TABLE Cliente (
  ID_Cliente INTEGER   NOT NULL ,
  Cedula INTEGER   NOT NULL ,
  Nombre CHAR(20)    ,
  Apellido CHAR(20)    ,
  Direccion CHAR(30)    ,
  Telefono INTEGER    ,
  Pais CHAR(10)    ,
  Ciudad CHAR(10)    ,
  Correo CHAR(30)      ,
PRIMARY KEY(ID_Cliente, Cedula));

INSERT INTO Cliente (ID_Cliente, Cedula, Nombre, Apellido, Direccion, Telefono, Pais, Ciudad, Correo) 
VALUES (5384, 1112106445, 'Juan Manuel', 'Gomez Henao', 'Calle 12 #4-14', 2232174, 'Colombia', 'Andalucia' ,'juanmagohe@hotmail.com');

CREATE TABLE Venta (
  Num_Factura INTEGER   NOT NULL ,
  Libro_ISBN INTEGER   NOT NULL ,
  Empleado_Cedula INTEGER   NOT NULL ,
  Empleado_ID_Empleado INTEGER   NOT NULL ,
  Cliente_Cedula INTEGER   NOT NULL ,
  Cliente_ID_Cliente INTEGER   NOT NULL ,
  Fecha_Venta DATE      ,
PRIMARY KEY(Num_Factura)      ,
  FOREIGN KEY(Cliente_ID_Cliente, Cliente_Cedula)
    REFERENCES Cliente(ID_Cliente, Cedula),
  FOREIGN KEY(Empleado_ID_Empleado, Empleado_Cedula)
    REFERENCES Empleado(ID_Empleado, Cedula),
  FOREIGN KEY(Libro_ISBN)
    REFERENCES Libro(ISBN));

INSERT INTO Venta (Num_Factura, Libro_ISBN, Empleado_Cedula, Empleado_ID_Empleado, Cliente_Cedula, Cliente_ID_Cliente, Fecha_Venta) 
VALUES (002, 978963, 1112106363, 31337, 1112106445, 5384, '2018-05-02');

CREATE INDEX Venta_FKIndex1 ON Venta (Cliente_ID_Cliente, Cliente_Cedula);
CREATE INDEX Venta_FKIndex2 ON Venta (Empleado_ID_Empleado, Empleado_Cedula);
CREATE INDEX Venta_FKIndex3 ON Venta (Libro_ISBN);


CREATE INDEX IFK_Recibe ON Venta (Cliente_ID_Cliente, Cliente_Cedula);
CREATE INDEX IFK_Realiza ON Venta (Empleado_ID_Empleado, Empleado_Cedula);
CREATE INDEX IFK_Rel_03 ON Venta (Libro_ISBN);

