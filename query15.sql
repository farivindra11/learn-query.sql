-- 1
SELECT *
FROM mahasiswa
INNER JOIN jurusan
ON mahasiswa.jurusan = jurusan.id_jurusan;

-- 2
ALTER TABLE mahasiswa
ADD tanggal_lahir date;

-- kode di bawah adalah untuk update data di kolom tanggal_lahir tabel mahasiswa pada university.db
-- karena di query sebelumnya kolom tanggal_lahir dan value nya belum di tambahakan
-- UPDATE mahasiswa set tanggal_lahir = '2001-03-11' WHERE nama = 'Fariv';
-- UPDATE mahasiswa set tanggal_lahir = '2002-06-21' WHERE nama = 'Azis';
-- UPDATE mahasiswa set tanggal_lahir = '1998-11-20' WHERE nama = 'Sakti';

SELECT mahasiswa.*, (strftime('%Y', 'now') - strftime('%Y', tanggal_lahir)) - (strftime('%m-%d', 'now') < strftime('%m-%d', tanggal_lahir)) AS umur
FROM mahasiswa 
WHERE (strftime('%Y', 'now') - strftime('%Y', tanggal_lahir)) - (strftime('%m-%d', 'now') < strftime('%m-%d', tanggal_lahir)) < 20;


-- 3
SELECT mahasiswa.*, kontrak.nilai
FROM mahasiswa
LEFT JOIN kontrak
ON mahasiswa.nim = kontrak.nim
WHERE kontrak.nilai = 'A' OR kontrak.nilai = 'B';


-- 4
SELECT mahasiswa.*,
SUM(matakuliah.sks) AS total_sks
FROM mahasiswa LEFT JOIN kontrak ON mahasiswa.nim = kontrak.nim
LEFT join matakuliah ON kontrak.id_matakuliah = matakuliah.id_matakuliah
GROUP BY mahasiswa.nim HAVING total_sks > 10;


-- 5
SELECT mahasiswa.*, matakuliah.nama AS kontrak_matkul
FROM mahasiswa LEFT JOIN kontrak ON mahasiswa.nim = kontrak.nim
LEFT JOIN matakuliah ON kontrak.id_matakuliah = matakuliah.id_matakuliah
WHERE matakuliah.nama = 'Data mining';


-- 6
SELECT dosen.*, COUNT(DISTINCT(mahasiswa.nim))
AS jumlah_mhs
FROM dosen LEFT JOIN kontrak ON dosen.id_dosen = kontrak.id_dosen 
LEFT JOIN mahasiswa ON mahasiswa.nim = kontrak.nim
GROUP BY dosen.id_dosen;


-- 7
SELECT *, (strftime('%Y', 'now') - strftime('%Y', tanggal_lahir)) - (strftime('%m-%d', 'now') < strftime('%m-%d', tanggal_lahir)) AS umur
FROM mahasiswa 
ORDER BY umur;


-- 8
SELECT * FROM mahasiswa
LEFT JOIN kontrak ON mahasiswa.nim = kontrak.nim
LEFT JOIN matakuliah ON kontrak.id_matakuliah = matakuliah.id_matakuliah
LEFT JOIN dosen ON dosen.id_dosen = kontrak.id_dosen
WHERE kontrak.nilai = 'D' OR kontrak.nilai = 'E';