-- Create the role
CREATE ROLE usrprueba WITH LOGIN;

-- Grant privileges
DO $$
BEGIN
    GRANT CREATE ON DATABASE postgres TO usrprueba;
    GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO usrprueba;
END $$;


CREATE TABLE IF NOT EXISTS persona (
    persona_id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    genero VARCHAR(10),
    edad INT,
    identificacion VARCHAR(20) UNIQUE,
    direccion TEXT,
    telefono VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS cliente (
    cliente_id SERIAL PRIMARY KEY,
    persona_id INT UNIQUE,
    contrasena TEXT NOT NULL,
    estado BOOLEAN,
    FOREIGN KEY (persona_id) REFERENCES persona(persona_id)
);

CREATE TABLE IF NOT EXISTS cuenta (
    cuenta_id SERIAL PRIMARY KEY,
    cliente_id INT,
    numero_cuenta VARCHAR(20) UNIQUE,
    tipo_cuenta VARCHAR(20),
    saldo_inicial NUMERIC(18,2),
    saldo_actual NUMERIC(18,2),
    estado VARCHAR(20),
    FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id)
);


CREATE TABLE IF NOT EXISTS movimientos (
    movimiento_id SERIAL PRIMARY KEY,
    cuenta_id INT,
    fecha DATE,
    tipo_movimiento VARCHAR(20),
    valor NUMERIC(18,2),
    saldo NUMERIC(18,2),
FOREIGN KEY (cuenta_id) REFERENCES cuenta(cuenta_id)
);

CREATE TABLE IF NOT EXISTS historico (
    historico_id SERIAL PRIMARY KEY,
    movimiento_id INT,
    cuenta_id INT,
    fecha DATE,
    tipo_movimiento VARCHAR(20),
    valor NUMERIC(18,2),
    saldo NUMERIC(18,2)
);



