CREATE DATABASE  IF NOT EXISTS `QLBanSach` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `QLBanSach`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: QLBanSach
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ChuDe`
--

DROP TABLE IF EXISTS `ChuDe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ChuDe` (
  `MaChuDe` int NOT NULL,
  `TenChuDe` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MaChuDe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChuDe`
--

LOCK TABLES `ChuDe` WRITE;
/*!40000 ALTER TABLE `ChuDe` DISABLE KEYS */;
/*!40000 ALTER TABLE `ChuDe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DonHang`
--

DROP TABLE IF EXISTS `DonHang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DonHang` (
  `MaDonHang` int NOT NULL,
  `DaThanhToan` tinyint(1) DEFAULT NULL,
  `TinhTrangDonHang` varchar(100) DEFAULT NULL,
  `NgayDat` datetime DEFAULT NULL,
  `NgayGiao` datetime DEFAULT NULL,
  `MaKH` int NOT NULL,
  PRIMARY KEY (`MaDonHang`),
  KEY `MaKH_idx` (`MaKH`),
  CONSTRAINT `MaKH` FOREIGN KEY (`MaKH`) REFERENCES `KhachHang` (`MaKH`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DonHang`
--

LOCK TABLES `DonHang` WRITE;
/*!40000 ALTER TABLE `DonHang` DISABLE KEYS */;
/*!40000 ALTER TABLE `DonHang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gom`
--

DROP TABLE IF EXISTS `Gom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gom` (
  `SoLuong` int DEFAULT NULL,
  `DonGia` double DEFAULT NULL,
  `MaSach` int NOT NULL,
  `MaDonHang` int NOT NULL,
  PRIMARY KEY (`MaSach`,`MaDonHang`),
  KEY `MaDonHang_idx` (`MaDonHang`),
  CONSTRAINT `MaDonHang` FOREIGN KEY (`MaDonHang`) REFERENCES `DonHang` (`MaDonHang`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `MaSach` FOREIGN KEY (`MaSach`) REFERENCES `Sach` (`MaSach`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gom`
--

LOCK TABLES `Gom` WRITE;
/*!40000 ALTER TABLE `Gom` DISABLE KEYS */;
/*!40000 ALTER TABLE `Gom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KhachHang`
--

DROP TABLE IF EXISTS `KhachHang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KhachHang` (
  `MaKH` int NOT NULL AUTO_INCREMENT,
  `TaiKhoan` varchar(100) DEFAULT NULL,
  `MatKhau` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  `HoTen` varchar(100) DEFAULT NULL,
  `NgaySinh` datetime DEFAULT NULL,
  `GioiTinh` varchar(100) DEFAULT NULL,
  `DienThoai` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MaKH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KhachHang`
--

LOCK TABLES `KhachHang` WRITE;
/*!40000 ALTER TABLE `KhachHang` DISABLE KEYS */;
/*!40000 ALTER TABLE `KhachHang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NhaXuatBan`
--

DROP TABLE IF EXISTS `NhaXuatBan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NhaXuatBan` (
  `MaNXB` int NOT NULL,
  `TenNXB` varchar(100) DEFAULT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  `DienThoai` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MaNXB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NhaXuatBan`
--

LOCK TABLES `NhaXuatBan` WRITE;
/*!40000 ALTER TABLE `NhaXuatBan` DISABLE KEYS */;
/*!40000 ALTER TABLE `NhaXuatBan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sach`
--

DROP TABLE IF EXISTS `Sach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sach` (
  `MaSach` int NOT NULL,
  `TenSach` varchar(100) DEFAULT NULL,
  `GiaBan` double DEFAULT NULL,
  `MoTa` varchar(255) DEFAULT NULL,
  `AnhBia` blob,
  `NgayCapNhat` datetime DEFAULT NULL,
  `SoLuongTon` int DEFAULT NULL,
  `MaChuDe` int NOT NULL,
  `MaNXB` int NOT NULL,
  PRIMARY KEY (`MaSach`),
  KEY `MaChuDe_idx` (`MaChuDe`),
  KEY `MaNXB_idx` (`MaNXB`),
  CONSTRAINT `MaChuDe` FOREIGN KEY (`MaChuDe`) REFERENCES `ChuDe` (`MaChuDe`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `MaNXB` FOREIGN KEY (`MaNXB`) REFERENCES `NhaXuatBan` (`MaNXB`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sach`
--

LOCK TABLES `Sach` WRITE;
/*!40000 ALTER TABLE `Sach` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TacGia`
--

DROP TABLE IF EXISTS `TacGia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TacGia` (
  `MaTacGia` int NOT NULL,
  `TenTacGia` varchar(100) DEFAULT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  `TieuSu` varchar(255) DEFAULT NULL,
  `DienThoai` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MaTacGia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TacGia`
--

LOCK TABLES `TacGia` WRITE;
/*!40000 ALTER TABLE `TacGia` DISABLE KEYS */;
/*!40000 ALTER TABLE `TacGia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ThamGia`
--

DROP TABLE IF EXISTS `ThamGia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ThamGia` (
  `VaiTro` varchar(100) DEFAULT NULL,
  `ViTri` varchar(100) DEFAULT NULL,
  `MaSach` int NOT NULL,
  `MaTacGia` int NOT NULL,
  PRIMARY KEY (`MaSach`,`MaTacGia`),
  KEY `MaTacGia_idx` (`MaTacGia`),
  CONSTRAINT `Ma_Sach` FOREIGN KEY (`MaSach`) REFERENCES `Sach` (`MaSach`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `MaTacGia` FOREIGN KEY (`MaTacGia`) REFERENCES `TacGia` (`MaTacGia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ThamGia`
--

LOCK TABLES `ThamGia` WRITE;
/*!40000 ALTER TABLE `ThamGia` DISABLE KEYS */;
/*!40000 ALTER TABLE `ThamGia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-20 11:36:55
