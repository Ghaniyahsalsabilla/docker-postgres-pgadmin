--DATABASE
--Database SALAM dibuat melalui PGAdmin

--Table mahasiswa
CREATE TABLE mahasiswa (
	nim VARCHAR(10) primary key,
	nama VARCHAR(50) NOT NULL,
	jenis_kelamin VARCHAR(1) CHECK (jenis_kelamin IN ('L', 'P')),
	tanggal_lahir DATE,
	jurusan VARCHAR(50),
	kota VARCHAR(50),
	email VARCHAR(50) UNIQUE
);

--Data mahasiswa
INSERT INTO mahasiswa VALUES
('11201', 'Ghaniyah Salsabilla', 'P', '2006-07-16', 'Teknik Informatika', 'Kuningan', 'salsabilla@gmail.com'),
('11202', 'Lee Jeno', 'L', '2000-04-23', 'Global Business', 'Seoul', 'jenolee@gmail.com'),
('11203', 'Maeda Riku', 'L', '2003-06-28', 'Teknik Sipil', 'Tokyo', 'riku@gmail.com'),
('11204', 'Nafisah Nailal Khusna', 'P', '2014-09-27', 'Kedokteran', 'Kuningan', 'iyangg@gmail.com'),
('11205', 'Caca Inteng', 'P', '2006-07-07', 'Teknik Informatika', 'Kuningan', 'cacaaja@gmail.com');
--Backend dev
CREATE ROLE backend_dev
LOGIN
PASSWORD 'backend123';

GRANT CONNECT ON DATABASE "SALAM" TO backend_dev;

GRANT USAGE ON SCHEMA public TO backend_dev;

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO backend_dev;

--Bi dev
CREATE ROLE bi_dev
LOGIN
PASSWORD 'bi123';

GRANT CONNECT ON DATABASE "SALAM" TO bi_dev;

GRANT USAGE ON SCHEMA public TO bi_dev;

--Data_engineer
GRANT SELECT
ON ALL TABLES IN SCHEMA public
TO bi_dev;

CREATE ROLE data_engineer
LOGIN
PASSWORD 'data123';

GRANT CONNECT ON DATABASE "SALAM" TO data_engineer;

GRANT USAGE, CREATE
ON SCHEMA public 
TO data_engineer;

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO data_engineer;
