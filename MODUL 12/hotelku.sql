-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jun 2020 pada 06.11
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotelku`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kamar`
--

CREATE TABLE `kamar` (
  `no_kamar` varchar(11) NOT NULL,
  `kelas_kamar` varchar(20) NOT NULL,
  `harga` int(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kamar`
--

INSERT INTO `kamar` (`no_kamar`, `kelas_kamar`, `harga`) VALUES
('A007', 'Reguler', 450000),
('A015', 'VIP', 1000000),
('B07', 'VIP', 20000),
('V09', 'Reguler', 450000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tamu`
--

CREATE TABLE `tamu` (
  `no_ktp` int(16) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tamu`
--

INSERT INTO `tamu` (`no_ktp`, `nama`, `alamat`, `no_hp`) VALUES
(1, 'danang', 'sukoharjo', '8222540'),
(3857464, 'aji', 'jetis', '085878222488'),
(200180015, 'AJI NUGROHO', 'SUKOHARJO', '0828282828'),
(2001800155, 'danang ', 'cangkol', '08122333');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tamu_has_kamar`
--

CREATE TABLE `tamu_has_kamar` (
  `no_ktpFK` int(11) NOT NULL,
  `no_kamarFK` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tamu_has_kamar`
--

INSERT INTO `tamu_has_kamar` (`no_ktpFK`, `no_kamarFK`) VALUES
(1, 'A15'),
(2, 'V09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `no_transaksi` bigint(20) UNSIGNED NOT NULL,
  `no_ktpFK` int(11) DEFAULT NULL,
  `no_kamarFK` varchar(20) DEFAULT NULL,
  `jumlah_kamar` int(11) NOT NULL,
  `jumlah_malam` int(11) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`no_transaksi`, `no_ktpFK`, `no_kamarFK`, `jumlah_kamar`, `jumlah_malam`, `tanggal`, `total`) VALUES
(2, 1, 'A15', 1, 2, '2019-06-14 14:01:48', 2000000),
(7, 1, 'A15', 1, 2, '2020-06-24 00:00:00', 2000000),
(88, 1, 'A15', 1, 2, '2020-06-24 00:00:00', 2000000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`no_kamar`);

--
-- Indeks untuk tabel `tamu`
--
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`no_ktp`);

--
-- Indeks untuk tabel `tamu_has_kamar`
--
ALTER TABLE `tamu_has_kamar`
  ADD PRIMARY KEY (`no_ktpFK`,`no_kamarFK`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`no_transaksi`),
  ADD UNIQUE KEY `no_transaksi` (`no_transaksi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `no_transaksi` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
