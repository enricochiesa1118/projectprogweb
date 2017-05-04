-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2017 at 03:46 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_poliklinik`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_berobat`
--

CREATE TABLE `daftar_berobat` (
  `NO_PENDAFTARAN` char(8) NOT NULL,
  `ID_PASIEN` char(6) DEFAULT NULL,
  `ID_JADWAL` char(8) DEFAULT NULL,
  `TGL_BEROBAT` date DEFAULT NULL,
  `JAM_DAFTAR` time DEFAULT NULL,
  `NO_ANTRIAN` decimal(8,0) DEFAULT NULL,
  `STATUS` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `daftar_berobat`
--

INSERT INTO `daftar_berobat` (`NO_PENDAFTARAN`, `ID_PASIEN`, `ID_JADWAL`, `TGL_BEROBAT`, `JAM_DAFTAR`, `NO_ANTRIAN`, `STATUS`) VALUES
('DFT002', 'PSN001', 'JDW001', '2017-04-05', '00:13:00', '2', 'Selesai'),
('DFT003', 'PSN001', 'JDW001', '2017-04-06', '06:15:31', '4', 'Selesai'),
('DFT004', 'PSN001', 'JDW001', '2017-04-28', '06:13:32', '1', 'Selesai'),
('DFT005', 'PSN001', 'JDW001', '2017-04-06', '06:15:31', '2', 'Selesai'),
('DFT007', 'PSN004', 'JDW006', '0000-00-00', '10:36:56', '1', 'Selesai'),
('DFT008', 'PSN004', 'JDW009', '0000-00-00', '10:38:35', '1', 'Menunggu'),
('DFT009', 'PSN005', 'JDW006', '0000-00-00', '01:36:53', '1', 'Selesai'),
('DFT010', 'PSN002', 'JDW005', '0000-00-00', '01:40:05', '1', 'Selesai'),
('DFT011', 'PSN004', 'JDW005', '0000-00-00', '03:03:52', '1', 'Selesai');

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `ID_DOKTER` char(8) NOT NULL,
  `ID_POLI` char(8) DEFAULT NULL,
  `NAMA` varchar(35) DEFAULT NULL,
  `ALAMAT` varchar(35) DEFAULT NULL,
  `NO_TELP` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`ID_DOKTER`, `ID_POLI`, `NAMA`, `ALAMAT`, `NO_TELP`) VALUES
('DOK002', 'POL001', 'Dwi Sartika', 'jl. pangandaran', '0811002200'),
('DOK003', 'POL005', 'Dwi Sartika', 'jl. pangelang', '0811002200'),
('DOK004', 'POL004', 'Mahendra Syahputra', 'jl.', '0811002200');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `ID_JADWAL` char(8) NOT NULL,
  `ID_DOKTER` char(8) DEFAULT NULL,
  `HARI` varchar(10) DEFAULT NULL,
  `RUANGAN` varchar(10) DEFAULT NULL,
  `JAM_AWAL` time DEFAULT NULL,
  `JAM_AKHIR` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`ID_JADWAL`, `ID_DOKTER`, `HARI`, `RUANGAN`, `JAM_AWAL`, `JAM_AKHIR`) VALUES
('JDW001', 'DOK003', 'Senin', 'B4', '12:30:00', '18:30:00'),
('JDW0010', 'DOK004', 'Rabu', 'A4', '12:30:00', '14:30:00'),
('JDW002', 'DOK002', 'Selasa', 'A1', '09:30:00', '12:30:00'),
('JDW003', 'DOK002', 'Kamis', 'A3', '10:30:00', '13:30:00'),
('JDW004', 'DOK002', 'Rabu', 'A2', '12:30:00', '14:30:00'),
('JDW005', 'DOK003', 'Selasa', 'A3', '09:30:00', '12:30:00'),
('JDW006', 'DOK003', 'Selasa', 'A3', '10:30:00', '13:30:00'),
('JDW007', 'DOK003', 'Rabu', 'A3', '12:30:00', '14:30:00'),
('JDW008', 'DOK004', 'Senin', 'A4', '09:30:00', '12:30:00'),
('JDW009', 'DOK004', 'Selasa', 'A4', '10:30:00', '13:30:00'),
('JDW010', 'DOK004', 'Senin', 'A3', '12:30:00', '13:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `jam`
--

CREATE TABLE `jam` (
  `ID_JAM` char(3) NOT NULL,
  `JAM_MULAI` time DEFAULT NULL,
  `JAM_SELESAI` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
('PSN001', 'Assad Bin Abbas', 'Laki-laki', 'Banjarmasin', '2017-03-15', 'Islam', 'JL. magelang', '0822112211'),
('PSN002', 'Ageng Prasetyo', 'Laki-laki', 'Balik Papan', '1996-02-11', 'Islam', 'JL. ', '08112211'),
('PSN004', 'Indita Nurhafiza', 'Perempuan', 'Banjarmasin', '0000-00-00', 'Islam', 'jl. pangan', '0811221122'),
('PSN005', 'Annies Baswedan', 'Laki-laki', 'Jakarta', '1986-02-11', 'Islam', 'Jl.ala', '08110011'),
('PSN006', 'Andrian', 'Laki-laki', 'Banjarmasin', '1986-02-11', 'Islam', 'lasd', '081121121');

-- --------------------------------------------------------

--
-- Table structure for table `perawat`
--

CREATE TABLE `perawat` (
  `ID_PERAWAT` char(8) NOT NULL,
  `NAMA` varchar(35) DEFAULT NULL,
  `ALAMAT` varchar(50) DEFAULT NULL,
  `NO_TELP` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perawat`
--

INSERT INTO `perawat` (`ID_PERAWAT`, `NAMA`, `ALAMAT`, `NO_TELP`) VALUES
('PRW001', 'Siti Nur Aisyah', 'jl. segodadi', '0811002211'),
('PRW002', 'asd', 'asd', 'asd'),
('PRW003', 'Perawat', 'jl.aa', '01212121'),
('PRW004', 'perawat', 'asd', '0811002200');

-- --------------------------------------------------------

--
-- Table structure for table `poliklinik`
--

CREATE TABLE `poliklinik` (
  `ID_POLI` char(8) NOT NULL,
  `NAMA_POLI` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `poliklinik`
--

INSERT INTO `poliklinik` (`ID_POLI`, `NAMA_POLI`) VALUES
('POL001', 'Poli Anak'),
('POL002', 'Poli Gigi'),
('POL003', 'Poli Kandungan'),
('POL004', 'Poliklinik Umum'),
('POL005', 'Poli Gizi');

-- --------------------------------------------------------

--
-- Table structure for table `rekam_medik`
--

CREATE TABLE `rekam_medik` (
  `NO_REKAM_MEDIK` char(6) NOT NULL,
  `ID_PASIEN` char(6) DEFAULT NULL,
  `TGL_BEROBAT` date DEFAULT NULL,
  `KELUHAN` varchar(256) DEFAULT NULL,
  `PENGOBATAN` varchar(256) DEFAULT NULL,
  `RESEP` varchar(256) DEFAULT NULL,
  `TAGIHAN` decimal(8,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rekam_medik`
--

INSERT INTO `rekam_medik` (`NO_REKAM_MEDIK`, `ID_PASIEN`, `TGL_BEROBAT`, `KELUHAN`, `PENGOBATAN`, `RESEP`, `TAGIHAN`) VALUES
('RKM001', 'PSN001', '0000-00-00', 'asd', 'asd', 'asd', '0'),
('RKM002', 'PSN001', '0000-00-00', 'asd', 'asd', 'asd', '0'),
('RKM003', 'PSN001', '2017-04-06', 'asd', 'asd', 'asd', '0'),
('RKM004', 'PSN001', '2017-04-06', 'asd', 'asd', 'asd', '0'),
('RKM005', 'PSN001', '2017-04-06', 'asd', 'asd', 'asd', '0'),
('RKM006', 'PSN004', '1970-01-01', 'asd', 'asd', 'asd', '0'),
('RKM7', 'PSN002', '1970-01-01', 'mag', 'obat', 'promag', '12200'),
('RKM8', 'PSN005', '1970-01-01', 'cacingan', 'obat', 'obat cacing', '1222'),
('RKM9', 'PSN004', '1970-01-01', 'diare, muntaber, cacing', 'diberi obat', 'Promag', '1002120');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID_USER` char(8) NOT NULL,
  `USERNAME` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(20) DEFAULT NULL,
  `TIPE` varchar(10) DEFAULT NULL,
  `ID_POLIKLINIK` char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID_USER`, `USERNAME`, `PASSWORD`, `TIPE`, `ID_POLIKLINIK`) VALUES
('pet001', 'pet001', 'pet001', 'petugas', 'PRW001'),
('USR001', 'ADMIN', 'ADMIN', 'admin', NULL),
('USR003', 'DOK002', 'DOK002', 'dokter', 'DOK002'),
('USR004', 'PRW001', 'PRW001', 'petugas', 'PRW001'),
('USR006', 'DOK003', 'DOK003', 'dokter', 'DOK003'),
('USR007', 'DOK001', 'DOK001', 'dokter', 'DOK004'),
('USR008', 'ad', 'asd', 'petugas', 'PRW002'),
('USR009', 'prw004', 'prw004', 'petugas', 'PRW003'),
('USR010', 'prw005', 'prw005', 'petugas', 'PRW004');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_berobat`
--
ALTER TABLE `daftar_berobat`
  ADD PRIMARY KEY (`NO_PENDAFTARAN`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`ID_DOKTER`),
  ADD KEY `ID_POLI` (`ID_POLI`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`ID_JADWAL`);

--
-- Indexes for table `jam`
--
ALTER TABLE `jam`
  ADD PRIMARY KEY (`ID_JAM`);

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
  ADD PRIMARY KEY (`ID_POLI`);

--
-- Indexes for table `rekam_medik`
--
ALTER TABLE `rekam_medik`
  ADD PRIMARY KEY (`NO_REKAM_MEDIK`),
  ADD KEY `FK_MEMILIKI_REKAM_MEDIK` (`ID_PASIEN`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID_USER`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`ID_POLI`) REFERENCES `poliklinik` (`ID_POLI`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rekam_medik`
--
ALTER TABLE `rekam_medik`
  ADD CONSTRAINT `FK_MEMILIKI_REKAM_MEDIK` FOREIGN KEY (`ID_PASIEN`) REFERENCES `pasien` (`ID_PASIEN`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
