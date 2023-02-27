
CREATE TABLE WFEMP.INFO_PROVEEDORES
(
  ID_PROVEEDOR NUMBER NOT NULL,
  NOMBRE       VARCHAR2(150) NOT NULL,
  APELLIDO       VARCHAR2(150) NOT NULL,
  DIRECCION    VARCHAR2(1000) NOT NULL,
  TELEFONO     VARCHAR2(15) NOT NULL
);
 COMMENT ON TABLE WFEMP.INFO_PROVEEDORES
  IS 'Tabla de Proveedores';
  --Claves Primarias
 ALTER TABLE WFEMP.INFO_PROVEEDORES
  ADD CONSTRAINT PK_ID_PROVEEDOR_01 PRIMARY KEY (ID_PROVEEDOR);

comment on column WFEMP.INFO_PROVEEDORES.ID_PROVEEDOR
  is 'ID del Proveedor';
comment on column WFEMP.INFO_PROVEEDORES.NOMBRE
  is 'Nombre del Proveedor'; 
comment on column WFEMP.INFO_PROVEEDORES.APELLIDO
  is 'Apellido del Proveedor'; 
comment on column WFEMP.INFO_PROVEEDORES.DIRECCION
  is 'Direccion del Proveedor';
comment on column WFEMP.INFO_PROVEEDORES.TELEFONO
  is 'Telefono del Proveedor';     
  
--CATEGORIAS
CREATE TABLE WFEMP.INFO_CATEGORIAS
(
  ID_CATEGORIA     NUMBER NOT NULL,
  DESCRIPCION      VARCHAR2(1000) NOT NULL 
);
 COMMENT ON TABLE WFEMP.INFO_CATEGORIAS
  IS 'Tabla de Categorias';
  --Claves Primarias
 ALTER TABLE WFEMP.INFO_CATEGORIAS
  ADD CONSTRAINT PK_ID_CATEGORIA_01 PRIMARY KEY (ID_CATEGORIA);

comment on column WFEMP.INFO_CATEGORIAS.ID_CATEGORIA
  is 'ID de la Categoria';
comment on column WFEMP.INFO_CATEGORIAS.DESCRIPCION
  is 'Descripcion de la Categoria';   
  
--PRODUCTOS
CREATE TABLE WFEMP.INFO_PRODUCTOS
(
  ID_PRODUCTO        NUMBER NOT NULL,
  DESCRIPCION        VARCHAR2(1000) NOT NULL,
  PRECIO             NUMBER(10,2) DEFAULT 0.00 NOT NULL ,
  CATEGORIA_ID       NUMBER NOT NULL,
  PROVEEDOR_ID       NUMBER  NOT NULL
  
);
 COMMENT ON TABLE WFEMP.INFO_PRODUCTOS
  IS 'Tabla de Productos';
  --Claves Primarias
 ALTER TABLE WFEMP.INFO_PRODUCTOS
  ADD CONSTRAINT PK_ID_PRODUCTO_01 PRIMARY KEY (ID_PRODUCTO);

  --Claves Foraneas
 ALTER TABLE WFEMP.INFO_PRODUCTOS
  ADD CONSTRAINT FK_ID_PRODUCTO_01 FOREIGN KEY (CATEGORIA_ID)
  REFERENCES WFEMP.INFO_CATEGORIAS (ID_CATEGORIA);
  
 ALTER TABLE WFEMP.INFO_PRODUCTOS
  ADD CONSTRAINT FK_ID_PRODUCTO_02 FOREIGN KEY (PROVEEDOR_ID)
  REFERENCES WFEMP.INFO_PROVEEDORES (ID_PROVEEDOR);

comment on column WFEMP.INFO_PRODUCTOS.ID_PRODUCTO
  is 'ID del Producto';
comment on column WFEMP.INFO_PRODUCTOS.DESCRIPCION
  is 'Descripcion del Producto';   
comment on column WFEMP.INFO_PRODUCTOS.PRECIO
  is 'Precio del Producto';
comment on column WFEMP.INFO_PRODUCTOS.CATEGORIA_ID
  is 'ID Categoria de Producto';   
comment on column WFEMP.INFO_PRODUCTOS.PROVEEDOR_ID
  is 'ID Proveedor de Producto';   
   
--CLIENTES
CREATE TABLE WFEMP.INFO_CLIENTES
(
  ID_CLIENTE   NUMBER NOT NULL,
  NOMBRE       VARCHAR2(150) NOT NULL,
  APELLIDO     VARCHAR2(150)
  DIRECCION    VARCHAR2(1000) NULL,
  TELEFONO     VARCHAR2(15) NOT NULL
);
 COMMENT ON TABLE WFEMP.INFO_CLIENTES
  IS 'Tabla de Clientes';
  --Claves Primarias
 ALTER TABLE WFEMP.INFO_CLIENTES
  ADD CONSTRAINT PK_ID_CLIENTE_01 PRIMARY KEY (ID_CLIENTE);

comment on column WFEMP.INFO_CLIENTES.ID_CLIENTE
  is 'ID del Cliente';
comment on column WFEMP.INFO_CLIENTES.NOMBRE
  is 'Nombre del Cliente'; 
  comment on column WFEMP.INFO_CLIENTES.APELLIDO
  is 'Apellido del Cliente'; 
comment on column WFEMP.INFO_CLIENTES.DIRECCION
  is 'Direccion del Cliente';
comment on column WFEMP.INFO_CLIENTES.TELEFONO
  is 'Telefono del Cliente';     
      
--FACTURAS
CREATE TABLE WFEMP.INFO_FACTURAS
(
  ID_FACTURA        NUMBER NOT NULL,
  FECHA             DATE NOT NULL,
  CLIENTE_ID        NUMBER NOT NULL 
  
);
 COMMENT ON TABLE WFEMP.INFO_FACTURAS
  IS 'Tabla de Facturas';
  --Claves Primarias
 ALTER TABLE WFEMP.INFO_FACTURAS
  ADD CONSTRAINT PK_ID_FACTURA_01 PRIMARY KEY (ID_FACTURA);

  --Claves Foraneas
 ALTER TABLE WFEMP.INFO_FACTURAS
  ADD CONSTRAINT FK_ID_FACTURA_01 FOREIGN KEY (CLIENTE_ID)
  REFERENCES WFEMP.INFO_CLIENTES (ID_CLIENTE); 

comment on column WFEMP.INFO_FACTURAS.ID_FACTURA
  is 'ID de la Factura';
comment on column WFEMP.INFO_FACTURAS.FECHA
  is 'Fecha de la Factura';   
comment on column WFEMP.INFO_FACTURAS.CLIENTE_ID 
  is 'Id Cliente de la Factura';   


--VENTAS
CREATE TABLE WFEMP.INFO_VENTAS
(
  ID_VENTA          NUMBER NOT NULL,
  FACTURA_ID        NUMBER NOT NULL,
  PRODUCTO_ID       NUMBER NOT NULL,
  CANTIDAD         NUMBER DEFAULT 0 NOT NULL
  
);
 COMMENT ON TABLE WFEMP.INFO_VENTAS
  IS 'Tabla de Ventas';
  --Claves Primarias
 ALTER TABLE WFEMP.INFO_VENTAS
  ADD CONSTRAINT PK_ID_VENTA_01 PRIMARY KEY (ID_VENTA);

  --Claves Foraneas
 ALTER TABLE WFEMP.INFO_VENTAS
  ADD CONSTRAINT FK_ID_VENTA_01 FOREIGN KEY (FACTURA_ID)
  REFERENCES WFEMP.INFO_FACTURAS (ID_FACTURA); 
  
 ALTER TABLE WFEMP.INFO_VENTAS
  ADD CONSTRAINT FK_ID_VENTA_02 FOREIGN KEY (PRODUCTO_ID)
  REFERENCES WFEMP.INFO_PRODUCTOS (ID_PRODUCTO); 

comment on column WFEMP.INFO_VENTAS.ID_VENTA
  is 'ID de la Venta';
comment on column WFEMP.INFO_VENTAS.FACTURA_ID
  is 'ID Factura de la Venta';   
comment on column WFEMP.INFO_VENTAS.PRODUCTO_ID 
  is 'Id Producto de la Venta';   
comment on column WFEMP.INFO_VENTAS.CANTIDAD 
  is 'Cantidad de la Venta';   

  
  
