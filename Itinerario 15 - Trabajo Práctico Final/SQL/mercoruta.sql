-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-07-21 15:35:25.977

-- tables
-- Table: asesores_comerciales
CREATE TABLE "asesores_comerciales" (
    "id" int  NOT NULL,
    "legajo" int  NOT NULL,
    "nombre" varchar(25)  NOT NULL,
    "apellido" varchar(25)  NOT NULL,
    "telefono" varchar(25)  NOT NULL,
    "email" varchar(25)  NOT NULL,
    "ventas_realizadas" int  NOT NULL,
    CONSTRAINT "asesor_comercial_pk" PRIMARY KEY  ("id")
);

-- Table: camiones
CREATE TABLE "camiones" (
    "id" int  NOT NULL,
    "patente" varchar(25)  NOT NULL,
    "modelo" int  NOT NULL,
    "tipo" varchar(25)  NOT NULL,
    "fecha_fabricacion" date  NOT NULL,
    "toneladas_carga" int  NOT NULL,
    CONSTRAINT "camion_pk" PRIMARY KEY  ("id")
);

-- Table: choferes
CREATE TABLE "choferes" (
    "id" int  NOT NULL,
    "legajo" varchar(25)  NOT NULL,
    "fecha_alta" date  NOT NULL,
    "nombre" varchar(25)  NOT NULL,
    "apellido" varchar(25)  NOT NULL,
    "telefono" varchar(25)  NOT NULL,
    "email" varchar(25)  NOT NULL,
    "licencia_numero" int  NOT NULL,
    "licencia_vencimiento" date  NOT NULL,
    CONSTRAINT "chofer_pk" PRIMARY KEY  ("id")
);

-- Table: clientes
CREATE TABLE "clientes" (
    "id" int  NOT NULL,
    "razon_social" varchar(25)  NOT NULL,
    "cuit" varchar(25)  NOT NULL,
    "calle" varchar(25)  NOT NULL,
    "numero" int  NOT NULL,
    "codigo_postal" varchar(25)  NOT NULL,
    "ciudad" varchar(25)  NOT NULL,
    "provincia" varchar(25)  NOT NULL,
    "telefono" varchar(25)  NOT NULL,
    "email" varchar(25)  NOT NULL,
    "fecha_registro" date  NOT NULL,
    "asesor_comercial_id" int  NOT NULL,
    CONSTRAINT "cliente_pk" PRIMARY KEY  ("id")
);

-- Table: encargados_logistica
CREATE TABLE "encargados_logistica" (
    "id" int  NOT NULL,
    "nombre" varchar(25)  NOT NULL,
    "apellido" varchar(25)  NOT NULL,
    "telefono" varchar(25)  NOT NULL,
    "email" varchar(25)  NOT NULL,
    CONSTRAINT "encargado_de_logistica_pk" PRIMARY KEY  ("id")
);

-- Table: facturas
CREATE TABLE "facturas" (
    "id" int  NOT NULL,
    "numero" int  NOT NULL,
    "cliente_id" int  NOT NULL,
    "asesor_comercial_id" int  NOT NULL,
    CONSTRAINT "factura_pk" PRIMARY KEY  ("id")
);

-- Table: fleteros
CREATE TABLE "fleteros" (
    "id" int  NOT NULL,
    "cuit" varchar(25)  NOT NULL,
    "razon_social" varchar(25)  NOT NULL,
    "telefono" varchar(25)  NOT NULL,
    "email" varchar(25)  NOT NULL,
    "camion_patente" varchar(25)  NOT NULL,
    "camion_modelo" int  NOT NULL,
    "licencia_numero" int  NOT NULL,
    "licencia_vencimiento" date  NOT NULL,
    "fecha_contrato" date  NOT NULL,
    CONSTRAINT "fletero_pk" PRIMARY KEY  ("id")
);

-- Table: hojas_ruta
CREATE TABLE "hojas_ruta" (
    "id" int  NOT NULL,
    "contenedor" int  NOT NULL,
    "terminal" varchar(25)  NOT NULL,
    "fecha_inicio" date  NOT NULL,
    "hora_inicio" int  NOT NULL,
    "estado" varchar(25)  NOT NULL,
    "encargado_logistica_id" int  NOT NULL,
    "chofer_id" int  NOT NULL,
    "fletero_id" int  NOT NULL,
    "camion_id" int  NOT NULL,
    CONSTRAINT "hoja_de_ruta_pk" PRIMARY KEY  ("id")
);

-- Table: ordenes_transporte
CREATE TABLE "ordenes_transporte" (
    "id" int  NOT NULL,
    "factura_numero" int  NOT NULL,
    "terminal_carga" varchar(25)  NOT NULL,
    "terminal_entrega" varchar(25)  NOT NULL,
    "fecha_carga" date  NOT NULL,
    "fecha_entrega" date  NOT NULL,
    "contenedor" int  NOT NULL,
    "peso" int  NOT NULL,
    "observaciones" varchar(50)  NOT NULL,
    "asesor_comercial_id" int  NOT NULL,
    "encargado_logistica_id" int  NOT NULL,
    CONSTRAINT "orden_de_transporte_pk" PRIMARY KEY  ("id")
);

-- foreign keys
-- Reference: FK_0 (table: clientes)
ALTER TABLE "clientes" ADD CONSTRAINT "FK_0"
    FOREIGN KEY ("asesor_comercial_id")
    REFERENCES "asesores_comerciales" ("id");

-- Reference: FK_1 (table: facturas)
ALTER TABLE "facturas" ADD CONSTRAINT "FK_1"
    FOREIGN KEY ("cliente_id")
    REFERENCES "clientes" ("id");

-- Reference: FK_10 (table: hojas_ruta)
ALTER TABLE "hojas_ruta" ADD CONSTRAINT "FK_10"
    FOREIGN KEY ("encargado_logistica_id")
    REFERENCES "encargados_logistica" ("id");

-- Reference: FK_11 (table: hojas_ruta)
ALTER TABLE "hojas_ruta" ADD CONSTRAINT "FK_11"
    FOREIGN KEY ("chofer_id")
    REFERENCES "choferes" ("id");

-- Reference: FK_12 (table: hojas_ruta)
ALTER TABLE "hojas_ruta" ADD CONSTRAINT "FK_12"
    FOREIGN KEY ("fletero_id")
    REFERENCES "fleteros" ("id")
    ON DELETE  CASCADE 
    ON UPDATE  CASCADE;

-- Reference: FK_13 (table: hojas_ruta)
ALTER TABLE "hojas_ruta" ADD CONSTRAINT "FK_13"
    FOREIGN KEY ("camion_id")
    REFERENCES "camiones" ("id");

-- Reference: FK_2 (table: facturas)
ALTER TABLE "facturas" ADD CONSTRAINT "FK_2"
    FOREIGN KEY ("asesor_comercial_id")
    REFERENCES "asesores_comerciales" ("id");

-- Reference: FK_8 (table: ordenes_transporte)
ALTER TABLE "ordenes_transporte" ADD CONSTRAINT "FK_8"
    FOREIGN KEY ("asesor_comercial_id")
    REFERENCES "asesores_comerciales" ("id");

-- Reference: FK_9 (table: ordenes_transporte)
ALTER TABLE "ordenes_transporte" ADD CONSTRAINT "FK_9"
    FOREIGN KEY ("encargado_logistica_id")
    REFERENCES "encargados_logistica" ("id");

-- End of file.

