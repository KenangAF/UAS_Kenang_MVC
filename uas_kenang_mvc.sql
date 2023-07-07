-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Jul 2023 pada 16.17
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uas_kenang_mvc`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_kenang`
--

CREATE TABLE `barang_kenang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(25) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_kenang`
--

CREATE TABLE `login_kenang` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `login_kenang`
--

INSERT INTO `login_kenang` (`username`, `password`, `id`) VALUES
('kenang', 'admin', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran_kenang`
--

CREATE TABLE `pembayaran_kenang` (
  `id_pembayaran` int(11) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembeli_kenang`
--

CREATE TABLE `pembeli_kenang` (
  `id_pembeli` int(11) NOT NULL,
  `nama_pembeli` varchar(30) NOT NULL,
  `jk` varchar(20) NOT NULL,
  `no_telp` int(14) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier_kenang`
--

CREATE TABLE `supplier_kenang` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(30) NOT NULL,
  `no_tlp` char(13) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_kenang`
--

CREATE TABLE `transaksi_kenang` (
  `id_transaksi` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_pembeli` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang_kenang`
--
ALTER TABLE `barang_kenang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indeks untuk tabel `login_kenang`
--
ALTER TABLE `login_kenang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pembayaran_kenang`
--
ALTER TABLE `pembayaran_kenang`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_transaksi` (`id_transaksi`);

--
-- Indeks untuk tabel `pembeli_kenang`
--
ALTER TABLE `pembeli_kenang`
  ADD PRIMARY KEY (`id_pembeli`);

--
-- Indeks untuk tabel `supplier_kenang`
--
ALTER TABLE `supplier_kenang`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indeks untuk tabel `transaksi_kenang`
--
ALTER TABLE `transaksi_kenang`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_pembeli` (`id_pembeli`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `login_kenang`
--
ALTER TABLE `login_kenang`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang_kenang`
--
ALTER TABLE `barang_kenang`
  ADD CONSTRAINT `barang_kenang_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `supplier_kenang` (`id_supplier`);

--
-- Ketidakleluasaan untuk tabel `pembayaran_kenang`
--
ALTER TABLE `pembayaran_kenang`
  ADD CONSTRAINT `pembayaran_kenang_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi_kenang` (`id_transaksi`);

--
-- Ketidakleluasaan untuk tabel `transaksi_kenang`
--
ALTER TABLE `transaksi_kenang`
  ADD CONSTRAINT `transaksi_kenang_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang_kenang` (`id_barang`),
  ADD CONSTRAINT `transaksi_kenang_ibfk_2` FOREIGN KEY (`id_pembeli`) REFERENCES `pembeli_kenang` (`id_pembeli`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
