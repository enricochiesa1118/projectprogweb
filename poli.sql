-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2017 at 07:59 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poli`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_berobat`
--

CREATE TABLE `daftar_berobat` (
  `NO_ANTRIAN` char(8) NOT NULL,
  `ID_JADWAL` char(8) DEFAULT NULL,
  `ID_PASIEN` char(6) DEFAULT NULL,
  `TGL_BEROBAT` date DEFAULT NULL,
  `JAM_DAFTAR` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `daftar_berobat`
--

INSERT INTO `daftar_berobat` (`NO_ANTRIAN`, `ID_JADWAL`, `ID_PASIEN`, `TGL_BEROBAT`, `JAM_DAFTAR`) VALUES
('1', 'J001', 'PAS001', '2017-04-21', '08:05:30');

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `ID_DOKTER` char(8) NOT NULL,
  `NAMA_DOKTER` varchar(40) DEFAULT NULL,
  `NO_TELP` varchar(12) DEFAULT NULL,
  `ALAMAT_DOKTER` varchar(50) DEFAULT NULL,
  `SPESIALIS` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`ID_DOKTER`, `NAMA_DOKTER`, `NO_TELP`, `ALAMAT_DOKTER`, `SPESIALIS`) VALUES
('D001', 'dr. Budi', '089238237', 'Buahbatu', 'Umum');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `ID_JADWAL` char(8) NOT NULL,
  `ID_DOKTER` char(8) DEFAULT NULL,
  `JAM` time DEFAULT NULL,
  `HARI` varchar(10) DEFAULT NULL,
  `RUANGAN` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`ID_JADWAL`, `ID_DOKTER`, `JAM`, `HARI`, `RUANGAN`) VALUES
('J001', 'D001', '20:15:00', 'Selasa', 'Anggrek');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `ID_PASIEN` char(6) NOT NULL,
  `NAMA_PASIEN` varchar(40) DEFAULT NULL,
  `JENIS_KELAMIN` varchar(10) DEFAULT NULL,
  `TEMPAT_LAHIR` varchar(40) DEFAULT NULL,
  `TGL_LAHIR` date DEFAULT NULL,
  `AGAMA` varchar(10) DEFAULT NULL,
  `ALAMAT_PASIEN` varchar(50) DEFAULT NULL,
  `NO_TELP` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`ID_PASIEN`, `NAMA_PASIEN`, `JENIS_KELAMIN`, `TEMPAT_LAHIR`, `TGL_LAHIR`, `AGAMA`, `ALAMAT_PASIEN`, `NO_TELP`) VALUES
('PAS001', 'Enrico Chiesa', 'Laki-laki', 'Samarinda', '1997-09-01', 'Islam', 'Mangga Dua, Sukapura', '081354082799');

-- --------------------------------------------------------

--
-- Table structure for table `rekam_medik`
--

CREATE TABLE `rekam_medik` (
  `NO_REKAM_MEDIK` char(6) NOT NULL,
  `ID_JADWAL` char(8) DEFAULT NULL,
  `NO_ANTRIAN` char(8) DEFAULT NULL,
  `TGL_BEROBAT` date DEFAULT NULL,
  `KELUHAN` varchar(256) DEFAULT NULL,
  `PENGOBATAN` varchar(256) DEFAULT NULL,
  `TAGIHAN` decimal(8,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(25) NOT NULL,
  `password` varchar(15) NOT NULL,
  `tipe` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `tipe`) VALUES
('enrchiesa', '123456', 'petugas');

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
  ADD PRIMARY KEY (`ID_DOKTER`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`ID_JADWAL`),
  ADD KEY `FK_RELATIONSHIP_12` (`ID_DOKTER`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`ID_PASIEN`);

--
-- Indexes for table `rekam_medik`
--
ALTER TABLE `rekam_medik`
  ADD PRIMARY KEY (`NO_REKAM_MEDIK`),
  ADD KEY `FK_MEMILIKI_REKAM_MEDIK` (`NO_ANTRIAN`),
  ADD KEY `FK_RELATIONSHIP_5` (`ID_JADWAL`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

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
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `FK_RELATIONSHIP_12` FOREIGN KEY (`ID_DOKTER`) REFERENCES `dokter` (`ID_DOKTER`);

--
-- Constraints for table `rekam_medik`
--
ALTER TABLE `rekam_medik`
  ADD CONSTRAINT `FK_MEMILIKI_REKAM_MEDIK` FOREIGN KEY (`NO_ANTRIAN`) REFERENCES `daftar_berobat` (`NO_ANTRIAN`),
  ADD CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`ID_JADWAL`) REFERENCES `jadwal` (`ID_JADWAL`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
