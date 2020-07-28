-- TABLE JURUSAN AKAN JADI PRIMARY KEY DARI JURUSAN DI TABLE MAHASISWA
CREATE TABLE jurusan (
    id_jurusan TEXT PRIMARY KEY NOT NULL,
    nama_jurusan TEXT NOT NULL
);
INSERT INTO jurusan (id_jurusan, nama_jurusan)
VALUES ('A001', 'Informatika'),
    ('B002', 'Ekonomi'),
    ('C003', 'Sastra Inggris');
    
CREATE TABLE mahasiswa (
    nim TEXT PRIMARY KEY NOT NULL,
    nama VARCHAR(50) NOT NULL,
    alamat TEXT NOT NULL,
    jurusan TEXT NOT NULL,
    FOREIGN KEY (jurusan) REFERENCES jurusan(id_jurusan)
);
INSERT INTO mahasiswa (nim, nama, alamat, jurusan)
VALUES ('0080601', 'Fariv', 'Magetan', 'A001'),
    ('0080602', 'Azis', 'Madura', 'B002'),
    ('0080603', 'Sakti', 'Bandung', 'C003');

CREATE TABLE dosen (
    id_dosen TEXT PRIMARY KEY NOT NULL,
    nama VARCHAR(50) NOT NULL
);
INSERT INTO dosen (id_dosen, nama)
VALUES ('09001', 'Shandika'),
    ('09002', 'Angga'),
    ('09003', 'Galih');

CREATE TABLE matakuliah (
    id_matakuliah TEXT PRIMARY KEY NOT NULL,
    nama TEXT NOT NULL,
    sks INT NOT NULL
);
INSERT INTO matakuliah (id_matakuliah, nama, sks)
VALUES ('IFM101', 'Algoritma dan Pemrograman', 4),
    ('IFM201', 'Sistem Informasi', 3),
    ('IFM301', 'Sistem Operasi', 3),
    ('IFM401', 'Struktur Data', 3),
    ('IFM501', 'Data mining', 2),
    ('ECM102', 'Ekonomi Mikro', 2),
    ('ECM202', 'Ekonomi Makro', 3),
    ('ECM302', 'Akuntansi', 3),
    ('ECM402', 'Manajemen Pemasaran', 3),
    ('SIG103', 'Basic Grammar', 2),
    ('SIG203', 'Sematics', 5);
    
CREATE TABLE kontrak (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nim TEXT NOT NULL,
    id_dosen TEXT NOT NULL,
    id_matakuliah TEXT NOT NULL,
    nilai TEXT, 
    FOREIGN KEY (nim) REFERENCES mahasiswa(nim),
    FOREIGN KEY (id_dosen) REFERENCES dosen(id_dosen),
    FOREIGN KEY (id_matakuliah) REFERENCES matakuliah(id_matakuliah)
);
INSERT INTO kontrak (nim, id_dosen, id_matakuliah, nilai)
VALUES ('0080601', '09001', 'IFM101', 'A'),
    ('0080601', '09001', 'IFM201', 'A'),
    ('0080601', '09001', 'IFM301', 'B'),
    ('0080601', '09001', 'IFM401', 'C'),
    ('0080601', '09001', 'IFM501', 'B'),
    ('0080602', '09002', 'ECM102', 'B'),
    ('0080602', '09002', 'ECM202', 'C'),
    ('0080602', '09002', 'ECM302', 'B'),
    ('0080602', '09002', 'ECM402', 'E'),
    ('0080603', '09003', 'SIG103', 'D'),
    ('0080603', '09003', 'SIG203', 'A');
    

    