CREATE TABLE public.users (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE public.heat_pumps (
  pump_id SERIAL PRIMARY KEY,
  model VARCHAR(100) NOT NULL,
  brand VARCHAR(50) NOT NULL,
  price NUMERIC(10, 2) NOT NULL,
  cooling_capacity NUMERIC(10, 2) NOT NULL,
  heating_capacity NUMERIC(10, 2) NOT NULL,
  energy_rating VARCHAR(10) NOT NULL,
  image_url VARCHAR(500) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE public.contractors (
  contractor_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  email VARCHAR(100) NOT NULL,
  location VARCHAR(200) NOT NULL,
  website_url VARCHAR(500),
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE public.quotes (
  quote_id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  pump_id INTEGER NOT NULL,
  contractor_id INTEGER NOT NULL,
  total_cost NUMERIC(10, 2) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (pump_id) REFERENCES heat_pumps(pump_id),
  FOREIGN KEY (contractor_id) REFERENCES contractors(contractor_id)
);

CREATE TABLE public.financing_options (
  financing_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  link VARCHAR(500),
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE public.maintenance (
  maintenance_id SERIAL PRIMARY KEY,
  pump_id INTEGER NOT NULL,
  description TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  FOREIGN KEY (pump_id) REFERENCES heat_pumps(pump_id)
);

CREATE TABLE public.troubleshooting (
  troubleshooting_id SERIAL PRIMARY KEY,
  pump_id INTEGER NOT NULL,
  problem TEXT NOT NULL,
  solution TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  FOREIGN KEY (pump_id) REFERENCES heat_pumps(pump_id)
);

CREATE TABLE public.reviews (
  review_id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  pump_id INTEGER NOT NULL,
  contractor_id INTEGER NOT NULL,
  rating INTEGER NOT NULL,
  comment TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (pump_id) REFERENCES heat_pumps(pump_id),
  FOREIGN KEY (contractor_id) REFERENCES contractors(contractor_id)
);
