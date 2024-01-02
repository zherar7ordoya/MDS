CREATE TABLE Asesor_Comercial
(
  asesor_id INT NOT NULL,
  legajo INT NOT NULL,
  nombre VARCHAR(25) NOT NULL,
  email VARCHAR(25) NOT NULL,
  cant_ventas INT NOT NULL,
  PRIMARY KEY (asesor_id)
);

CREATE TABLE Ciente
(
  cliente_id INT NOT NULL,
  razon_social VARCHAR(25) NOT NULL,
  cuit VARCHAR(25) NOT NULL,
  fijo VARCHAR(25) NOT NULL,
  celular VARCHAR(25) NOT NULL,
  calle VARCHAR(25) NOT NULL,
  nro INT NOT NULL,
  cod_postal VARCHAR(25) NOT NULL,
  ciudad VARCHAR(25) NOT NULL,
  provincia VARCHAR(25) NOT NULL,
  fecha_registro DATE NOT NULL,
  asesor_id INT NOT NULL,
  PRIMARY KEY (cliente_id),
  FOREIGN KEY (asesor_id) REFERENCES Asesor_Comercial(asesor_id)
);

CREATE TABLE Encargado_Logistica
(
  encargado_id INT NOT NULL,
  nombre VARCHAR(25) NOT NULL,
  email VARCHAR(25) NOT NULL,
  PRIMARY KEY (encargado_id)
);

CREATE TABLE Factura
(
  factura_id INT NOT NULL,
  numero INT NOT NULL,
  cliente_id INT NOT NULL,
  asesor_id INT NOT NULL,
  PRIMARY KEY (factura_id),
  FOREIGN KEY (cliente_id) REFERENCES Ciente(cliente_id),
  FOREIGN KEY (asesor_id) REFERENCES Asesor_Comercial(asesor_id)
);

CREATE TABLE Chofer
(
  chofer_id INT NOT NULL,
  nombre VARCHAR(25) NOT NULL,
  cuit VARCHAR(25) NOT NULL,
  fecha_contrato DATE NOT NULL,
  licencia_nro INT NOT NULL,
  licencia_vence DATE NOT NULL,
  PRIMARY KEY (chofer_id)
);

CREATE TABLE Camion
(
  camion_id INT NOT NULL,
  patente VARCHAR(25) NOT NULL,
  modelo INT NOT NULL,
  tipo VARCHAR(25) NOT NULL,
  fabric_fecha DATE NOT NULL,
  toneladas_carga INT NOT NULL,
  PRIMARY KEY (camion_id)
);

CREATE TABLE Fletero
(
  fletero_id INT NOT NULL,
  nombre VARCHAR(25) NOT NULL,
  cuit VARCHAR(25) NOT NULL,
  camion_patente VARCHAR(25) NOT NULL,
  camion_modelo INT NOT NULL,
  empr_asociada VARCHAR(25) NOT NULL,
  contrato_fecha DATE NOT NULL,
  registro_fecha DATE NOT NULL,
  licencia_vence DATE NOT NULL,
  licencia_nro INT NOT NULL,
  PRIMARY KEY (fletero_id)
);

CREATE TABLE Ciente_Email
(
  email VARCHAR(25) NOT NULL,
  email_id INT NOT NULL,
  cliente_id INT NOT NULL,
  PRIMARY KEY (email_id),
  FOREIGN KEY (cliente_id) REFERENCES Ciente(cliente_id)
);

CREATE TABLE Chofer_Telefono
(
  telefono_id INT NOT NULL,
  telefono VARCHAR NOT NULL,
  chofer_id INT NOT NULL,
  PRIMARY KEY (telefono_id),
  FOREIGN KEY (chofer_id) REFERENCES Chofer(chofer_id)
);

CREATE TABLE Chofer_Email
(
  email_id INT NOT NULL,
  email VARCHAR(50) NOT NULL,
  cod_chofer INT NOT NULL,
  PRIMARY KEY (email_id),
  FOREIGN KEY (cod_chofer) REFERENCES Chofer(chofer_id)
);

CREATE TABLE Fletero_Telefono
(
  telefono_id INT NOT NULL,
  telefono VARCHAR(25) NOT NULL,
  fletero_id INT NOT NULL,
  PRIMARY KEY (telefono_id),
  FOREIGN KEY (fletero_id) REFERENCES Fletero(fletero_id)
);

CREATE TABLE Fletero_Email
(
  email_id INT NOT NULL,
  email VARCHAR(25) NOT NULL,
  fletero_id INT NOT NULL,
  PRIMARY KEY (email_id),
  FOREIGN KEY (fletero_id) REFERENCES Fletero(fletero_id)
);

CREATE TABLE Orden_Transporte
(
  orden_id INT NOT NULL,
  contenedor INT NOT NULL,
  terminal_carga VARCHAR(25) NOT NULL,
  term_entrega VARCHAR(25) NOT NULL,
  fecha_inicio DATE NOT NULL,
  factura_nro INT NOT NULL,
  peso INT NOT NULL,
  observaciones VARCHAR(50) NOT NULL,
  asesor_id INT NOT NULL,
  encargado_id INT NOT NULL,
  PRIMARY KEY (orden_id),
  FOREIGN KEY (asesor_id) REFERENCES Asesor_Comercial(asesor_id),
  FOREIGN KEY (encargado_id) REFERENCES Encargado_Logistica(encargado_id)
);

CREATE TABLE HojaRuta
(
  hojaRuta_id INT NOT NULL,
  contenedor INT NOT NULL,
  terminal VARCHAR(25) NOT NULL,
  fecha_inicio DATE NOT NULL,
  hora_inicio INT NOT NULL,
  despachante VARCHAR(25) NOT NULL,
  estado VARCHAR(25) NOT NULL,
  encargado_id INT NOT NULL,
  chofer_id INT NOT NULL,
  fletero_id INT NOT NULL,
  camion_id INT NOT NULL,
  PRIMARY KEY (hojaRuta_id),
  FOREIGN KEY (encargado_id) REFERENCES Encargado_Logistica(encargado_id),
  FOREIGN KEY (chofer_id) REFERENCES Chofer(chofer_id),
  FOREIGN KEY (fletero_id) REFERENCES Fletero(fletero_id),
  FOREIGN KEY (camion_id) REFERENCES Camion(camion_id)
);