-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2017 at 02:16 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poliklinik`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_berobat`
--

CREATE TABLE `daftar_berobat` (
  `NO_ANTRIAN` int(3) NOT NULL,
  `ID_PASIEN` char(6) DEFAULT NULL,
  `ID_JADWAL` char(8) DEFAULT NULL,
  `TGL_BEROBAT` date DEFAULT NULL,
  `JAM_DAFTAR` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `daftar_berobat`
--

INSERT INTO `daftar_berobat` (`NO_ANTRIAN`, `ID_PASIEN`, `ID_JADWAL`, `TGL_BEROBAT`, `JAM_DAFTAR`) VALUES
(6, 'PAS002', 'MG002', '2017-04-14', '10:53:14');

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `ID_DOKTER` char(8) NOT NULL,
  `ID_POLIKLINIK` char(8) DEFAULT NULL,
  `NAMA_DOKTER` varchar(40) DEFAULT NULL,
  `NO_TELP` varchar(12) DEFAULT NULL,
  `BIDANG` varchar(50) DEFAULT NULL,
  `ALAMAT_DOKTER` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `ID_JADWAL` char(8) NOT NULL,
  `ID_POLIKLINIK` char(8) DEFAULT NULL,
  `JAM` time DEFAULT NULL,
  `HARI` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`ID_JADWAL`, `ID_POLIKLINIK`, `JAM`, `HARI`) VALUES
('MG002', 'P001', '16:34:45', 'Minggu');

-- --------------------------------------------------------

--
-- Table structure for table `kunjungan_berobat`
--

CREATE TABLE `kunjungan_berobat` (
  `ID_KUNJUNGAN` char(8) NOT NULL,
  `NO_REKAM_MEDIK` varchar(8) DEFAULT NULL,
  `ID_RINGKASAN_MASUK` char(8) DEFAULT NULL,
  `ID_RINGAKASAN_KELUAR` varchar(8) DEFAULT NULL,
  `TAGIHAN` decimal(8,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `ID_PASIEN` char(6) NOT NULL,
  `NAMA_PASIEN` varchar(40) DEFAULT NULL,
  `NAMA_IBU_KANDUNG` varchar(40) DEFAULT NULL,
  `JENIS_KELAMIN` varchar(10) DEFAULT NULL,
  `TEMPAT_LAHIR` varchar(40) DEFAULT NULL,
  `TGL_LAHIR` date DEFAULT NULL,
  `KEWARGANEGARAAN` varchar(10) DEFAULT NULL,
  `AGAMA` varchar(10) DEFAULT NULL,
  `ALAMAT_PASIEN` varchar(50) DEFAULT NULL,
  `NO_TELP` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`ID_PASIEN`, `NAMA_PASIEN`, `NAMA_IBU_KANDUNG`, `JENIS_KELAMIN`, `TEMPAT_LAHIR`, `TGL_LAHIR`, `KEWARGANEGARAAN`, `AGAMA`, `ALAMAT_PASIEN`, `NO_TELP`) VALUES
('PAS001', 'Enrico Chiesa', 'Rosita Siswanti', 'Laki-laki', 'Samarinda', '2017-04-13', 'Indonesia', 'Islam', 'Banjarbaru Kota Idaman', '85392263414'),
('PAS002', 'Markonah', 'Marlonaaaa', 'Perempuan', 'Bandung', '0000-00-00', 'Indonesia', 'Islam', 'Bandung', '0232389283'),
('PAS003', 'AAN', 'IIN', 'Laki-laki', 'Jakarta', '0000-00-00', 'Indonesia', 'Islam', 'jakarta', '038493483');

-- --------------------------------------------------------

--
-- Table structure for table `perawat`
--

CREATE TABLE `perawat` (
  `ID_PERAWAT` char(8) NOT NULL,
  `NAMA` varchar(40) DEFAULT NULL,
  `ALAMAT_PERAWAT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `poliklinik`
--

CREATE TABLE `poliklinik` (
  `ID_POLIKLINIK` char(8) NOT NULL,
  `NAMA_POLIKLINIK` varchar(40) DEFAULT NULL,
  `RUANGAN` varchar(10) DEFAULT NULL,
  `SPESIALIS` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `poliklinik`
--

INSERT INTO `poliklinik` (`ID_POLIKLINIK`, `NAMA_POLIKLINIK`, `RUANGAN`, `SPESIALIS`) VALUES
('P001', 'Poli Anak', 'Kids1', 'Anak');

-- --------------------------------------------------------

--
-- Table structure for table `rekam_medik`
--

CREATE TABLE `rekam_medik` (
  `NO_REKAM_MEDIK` varchar(8) NOT NULL,
  `ID_PASIEN` char(6) DEFAULT NULL,
  `TGL_DAFTAR` date DEFAULT NULL,
  `JUMLAH_KUNJUNGAN` decimal(8,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ringkasan_keluar`
--

CREATE TABLE `ringkasan_keluar` (
  `ID_RINGAKASAN_KELUAR` varchar(8) NOT NULL,
  `ID_DOKTER` char(8) DEFAULT NULL,
  `DIAGNOSIS_AKHIR` varchar(256) DEFAULT NULL,
  `TERAPI_TINDAKAN` varchar(256) DEFAULT NULL,
  `KEADAAN_WAKTU_PULANG` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ringkasan_masuk`
--

CREATE TABLE `ringkasan_masuk` (
  `ID_RINGKASAN_MASUK` char(8) NOT NULL,
  `ID_PERAWAT` char(8) DEFAULT NULL,
  `KELUHAN_UTAMA` varchar(256) DEFAULT NULL,
  `RIWAYAT_PENYAKIT` varchar(256) DEFAULT NULL,
  `PEMERIKSAAN_FISIK` varchar(256) DEFAULT NULL,
  `PEMERIKSAAN_LAB` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(8) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `tipe` varchar(10) NOT NULL,
  `id_poli` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `username`, `password`, `tipe`, `id_poli`) VALUES
('admin1', 'admin satu', 'admin', 'admin', 'admin', ''),
('PET001', 'Enrico', 'enrchiesa', '123456', 'petugas', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_berobat`
--
ALTER TABLE `daftar_berobat`
  ADD PRIMARY KEY (`NO_ANTRIAN`),
  ADD KEY `FK_RELATIONSHIP_10` (`ID_JADWAL`),
  ADD KEY `FK_RELATIONSHIP_8` (`ID_PASIEN`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`ID_DOKTER`),
  ADD KEY `FK_RELATIONSHIP_2` (`ID_POLIKLINIK`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`ID_JADWAL`),
  ADD KEY `FK_RELATIONSHIP_12` (`ID_POLIKLINIK`);

--
-- Indexes for table `kunjungan_berobat`
--
ALTER TABLE `kunjungan_berobat`
  ADD PRIMARY KEY (`ID_KUNJUNGAN`),
  ADD KEY `FK_BAGIAN_DARI` (`ID_RINGKASAN_MASUK`),
  ADD KEY `FK_MEMILIKI_KUNJUNGAN` (`NO_REKAM_MEDIK`),
  ADD KEY `FK_RELATIONSHIP_6` (`ID_RINGAKASAN_KELUAR`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`ID_PASIEN`);

--
-- Indexes for table `perawat`
--
ALTER TABLE `perawat`
  ADD PRIMARY KEY (`ID_PERAWAT`);

--
-- Indexes for table `poliklinik`
--
ALTER TABLE `poliklinik`
  ADD PRIMARY KEY (`ID_POLIKLINIK`);

--
-- Indexes for table `rekam_medik`
--
ALTER TABLE `rekam_medik`
  ADD PRIMARY KEY (`NO_REKAM_MEDIK`),
  ADD KEY `FK_MEMILIKI_REKAM_MEDIK` (`ID_PASIEN`);

--
-- Indexes for table `ringkasan_keluar`
--
ALTER TABLE `ringkasan_keluar`
  ADD PRIMARY KEY (`ID_RINGAKASAN_KELUAR`),
  ADD KEY `FK_RELATIONSHIP_11` (`ID_DOKTER`);

--
-- Indexes for table `ringkasan_masuk`
--
ALTER TABLE `ringkasan_masuk`
  ADD PRIMARY KEY (`ID_RINGKASAN_MASUK`),
  ADD KEY `FK_DIBUAT_OLEH` (`ID_PERAWAT`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_poli` (`id_poli`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_berobat`
--
ALTER TABLE `daftar_berobat`
  MODIFY `NO_ANTRIAN` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar_berobat`
--
ALTER TABLE `daftar_berobat`
  ADD CONSTRAINT `FK_RELATIONSHIP_10` FOREIGN KEY (`ID_JADWAL`) REFERENCES `jadwal` (`ID_JADWAL`),
  ADD CONSTRAINT `FK_RELATIONSHIP_8` FOREIGN KEY (`ID_PASIEN`) REFERENCES `pasien` (`ID_PASIEN`);

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`ID_POLIKLINIK`) REFERENCES `poliklinik` (`ID_POLIKLINIK`);

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `FK_RELATIONSHIP_12` FOREIGN KEY (`ID_POLIKLINIK`) REFERENCES `poliklinik` (`ID_POLIKLINIK`);

--
-- Constraints for table `kunjungan_berobat`
--
ALTER TABLE `kunjungan_berobat`
  ADD CONSTRAINT `FK_BAGIAN_DARI` FOREIGN KEY (`ID_RINGKASAN_MASUK`) REFERENCES `ringkasan_masuk` (`ID_RINGKASAN_MASUK`),
  ADD CONSTRAINT `FK_MEMILIKI_KUNJUNGAN` FOREIGN KEY (`NO_REKAM_MEDIK`) REFERENCES `rekam_medik` (`NO_REKAM_MEDIK`),
  ADD CONSTRAINT `FK_RELATIONSHIP_6` FOREIGN KEY (`ID_RINGAKASAN_KELUAR`) REFERENCES `ringkasan_keluar` (`ID_RINGAKASAN_KELUAR`);

--
-- Constraints for table `rekam_medik`
--
ALTER TABLE `rekam_medik`
  ADD CONSTRAINT `FK_MEMILIKI_REKAM_MEDIK` FOREIGN KEY (`ID_PASIEN`) REFERENCES `pasien` (`ID_PASIEN`);

--
-- Constraints for table `ringkasan_keluar`
--
ALTER TABLE `ringkasan_keluar`
  ADD CONSTRAINT `FK_RELATIONSHIP_11` FOREIGN KEY (`ID_DOKTER`) REFERENCES `dokter` (`ID_DOKTER`);

--
-- Constraints for table `ringkasan_masuk`
--
ALTER TABLE `ringkasan_masuk`
  ADD CONSTRAINT `FK_DIBUAT_OLEH` FOREIGN KEY (`ID_PERAWAT`) REFERENCES `perawat` (`ID_PERAWAT`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
