CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE user_roles (
    user_id UUID REFERENCES users(id),
    role_id INT REFERENCES roles(id),
    PRIMARY KEY (user_id, role_id)
);

CREATE TABLE parcours (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    address TEXT,
    zip_code VARCHAR(10),
    city VARCHAR(255),
    longitude FLOAT,
    latitude FLOAT,
    rate NUMBER,
    comment TEXT,
    nbr_doned NUMBER,
    creator_id UUID REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE points_interet (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    parcours_id UUID REFERENCES parcours(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    longitude FLOAT,
    latitude FLOAT,
    rate NUMBER,
    comment TEXT,
    nbr_doned NUMBER,
);

CREATE TABLE objectifs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    parcours_id UUID REFERENCES parcours(id) ON DELETE CASCADE,
    type VARCHAR(50) NOT NULL,
    description TEXT
);
