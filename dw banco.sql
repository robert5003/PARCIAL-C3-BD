CREATE TABLE `Usuarios` (
  `usuario_id` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre_usuario` VARCHAR,
  `contraseña` VARCHAR,
  `rol` VARCHAR,
  `cliente_id` INT
);

CREATE TABLE `Clientes` (
  `cliente_id` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR,
  `direccion` VARCHAR,
  `telefono` VARCHAR,
  `email` VARCHAR,
  `fecha_registro` VARCHAR
);

CREATE TABLE `Cuentas` (
  `cuenta_id` INT PRIMARY KEY AUTO_INCREMENT,
  `cliente_id` INT,
  `tipo_cuenta` VARCHAR,
  `saldo` VARCHAR,
  `fecha_apertura` VARCHAR
);

CREATE TABLE `Tarjetas_Credito` (
  `tarjeta_credito_id` INT PRIMARY KEY AUTO_INCREMENT,
  `cliente_id` INT,
  `numero_tarjeta` VARCHAR,
  `limite_credito` VARCHAR,
  `fecha_vencimiento` VARCHAR,
  `tasa_interes` VARCHAR,
  `deuda_actual` VARCHAR
);

CREATE TABLE `Tarjetas_Debito` (
  `tarjeta_debito_id` INT PRIMARY KEY AUTO_INCREMENT,
  `cliente_id` INT,
  `numero_tarjeta` VARCHAR,
  `saldo_disponible` VARCHAR,
  `fecha_vencimiento` VARCHAR
);

CREATE TABLE `Transacciones_Depositos` (
  `deposito_id` INT PRIMARY KEY AUTO_INCREMENT,
  `cuenta_id` INT,
  `monto` VARCHAR,
  `fecha_transaccion` VARCHAR,
  `descripcion` VARCHAR
);

CREATE TABLE `Transacciones_Retiros` (
  `retiro_id` INT PRIMARY KEY AUTO_INCREMENT,
  `cuenta_id` INT,
  `monto` VARCHAR,
  `fecha_transaccion` VARCHAR,
  `descripcion` VARCHAR
);

CREATE TABLE `Transferencias` (
  `transferencia_id` INT PRIMARY KEY AUTO_INCREMENT,
  `cuenta_origen` INT,
  `cuenta_destino` INT,
  `monto_transferencia` VARCHAR,
  `fecha_transferencia` VARCHAR,
  `descripcion` VARCHAR
);

CREATE TABLE `Prestamos` (
  `prestamo_id` INT PRIMARY KEY AUTO_INCREMENT,
  `cliente_id` INT,
  `monto_prestamo` VARCHAR,
  `interes` VARCHAR,
  `plazo_meses` VARCHAR,
  `saldo_restante` VARCHAR,
  `fecha_inicio` VARCHAR,
  `estado` VARCHAR
);

CREATE TABLE `Pagos` (
  `pago_id` INT PRIMARY KEY AUTO_INCREMENT,
  `prestamo_id` INT,
  `monto_pago` VARCHAR,
  `fecha_pago` VARCHAR,
  `estado_pago` VARCHAR
);

CREATE TABLE `Empleados` (
  `empleado_id` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR,
  `puesto` VARCHAR,
  `sucursal_id` INT,
  `telefono` VARCHAR
);

CREATE TABLE `Sucursales` (
  `sucursal_id` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR,
  `direccion` VARCHAR,
  `telefono` VARCHAR
);

CREATE TABLE `ATMs` (
  `atm_id` INT PRIMARY KEY AUTO_INCREMENT,
  `ubicacion` VARCHAR,
  `limite_retiro_diario` VARCHAR,
  `saldo_disponible` VARCHAR,
  `estado` VARCHAR,
  `ultima_recarga` VARCHAR
);

CREATE TABLE `Seguros` (
  `seguro_id` INT PRIMARY KEY AUTO_INCREMENT,
  `cliente_id` INT,
  `tipo_seguro` VARCHAR,
  `monto_cobertura` VARCHAR,
  `costo_mensual` VARCHAR,
  `fecha_inicio` VARCHAR,
  `fecha_vencimiento` VARCHAR,
  `estado` VARCHAR
);

CREATE TABLE `Beneficiarios` (
  `beneficiario_id` INT PRIMARY KEY AUTO_INCREMENT,
  `cliente_id` INT,
  `nombre_beneficiario` VARCHAR,
  `relacion` VARCHAR,
  `porcentaje_beneficio` VARCHAR
);

CREATE TABLE `Servicios` (
  `servicio_id` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre_servicio` VARCHAR,
  `descripcion` VARCHAR,
  `costo` VARCHAR
);

CREATE TABLE `Historial_Credito` (
  `historial_id` INT PRIMARY KEY AUTO_INCREMENT,
  `cliente_id` INT,
  `puntaje_credito` VARCHAR,
  `monto_total_prestamos` VARCHAR,
  `prestamos_pagados` VARCHAR,
  `prestamos_en_mora` VARCHAR
);

CREATE TABLE `Pagos_Servicios` (
  `pago_servicio_id` INT PRIMARY KEY AUTO_INCREMENT,
  `cliente_id` INT,
  `servicio_id` INT,
  `monto` VARCHAR,
  `fecha_pago` VARCHAR
);

CREATE TABLE `Quejas` (
  `Quejas_id` INT PRIMARY KEY AUTO_INCREMENT,
  `cliente_id` INT,
  `descripcion` TEXT,
  `fecha_queja` VARCHAR,
  `estado` VARCHAR
);

ALTER TABLE `Usuarios` ADD FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`cliente_id`);

ALTER TABLE `Cuentas` ADD FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`cliente_id`);

ALTER TABLE `Tarjetas_Credito` ADD FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`cliente_id`);

ALTER TABLE `Tarjetas_Debito` ADD FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`cliente_id`);

ALTER TABLE `Transacciones_Depositos` ADD FOREIGN KEY (`cuenta_id`) REFERENCES `Cuentas` (`cuenta_id`);

ALTER TABLE `Transacciones_Retiros` ADD FOREIGN KEY (`cuenta_id`) REFERENCES `Cuentas` (`cuenta_id`);

ALTER TABLE `Transferencias` ADD FOREIGN KEY (`cuenta_origen`) REFERENCES `Cuentas` (`cuenta_id`);

ALTER TABLE `Transferencias` ADD FOREIGN KEY (`cuenta_destino`) REFERENCES `Cuentas` (`cuenta_id`);

ALTER TABLE `Prestamos` ADD FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`cliente_id`);

ALTER TABLE `Pagos` ADD FOREIGN KEY (`prestamo_id`) REFERENCES `Prestamos` (`prestamo_id`);

ALTER TABLE `Empleados` ADD FOREIGN KEY (`sucursal_id`) REFERENCES `Sucursales` (`sucursal_id`);

ALTER TABLE `Seguros` ADD FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`cliente_id`);

ALTER TABLE `Beneficiarios` ADD FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`cliente_id`);

ALTER TABLE `Historial_Credito` ADD FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`cliente_id`);

ALTER TABLE `Pagos_Servicios` ADD FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`cliente_id`);

ALTER TABLE `Pagos_Servicios` ADD FOREIGN KEY (`servicio_id`) REFERENCES `Servicios` (`servicio_id`);

ALTER TABLE `Quejas` ADD FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`cliente_id`);
