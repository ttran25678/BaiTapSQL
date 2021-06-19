CREATE DATABASE QLBanSach;

use QLBanSach;

CREATE TABLE IF NOT EXISTS KhachHang(
	MaKH int,
    TaiKhoan varchar(100),
    MatKhau varchar(100),
    Email varchar(100),
    DiaChi varchar(255),
    HoTen varchar(100),
    NgaySinh datetime,
    GioiTinh varchar(100),
    DienThoai varchar(100)   
);

CREATE TABLE IF NOT EXISTS DonHang(
	MaDonHang int,
    DaThanhToan boolean,
    TinhTrangDonHang varchar(100),
    NgayDat datetime,
    NgayGiao datetime
);

CREATE TABLE IF NOT EXISTS ChuDe(
	MaChuDe int,
    TenChuDe varchar(100)
);

CREATE TABLE IF NOT EXISTS TacGia(
	MaTacGia varchar(100),
    TenTacGia varchar(100),
    DiaChi varchar(255),
    TieuSu varchar(255),
    DienThoai varchar(100)
);

CREATE TABLE IF NOT EXISTS Sach(
	MaSach int,
    TenSach varchar(100),
    GiaBan double,
    MoTa varchar(255),
    AnhBia blob,
    NgayCapNhat datetime,
    SoLuongTon int
);

CREATE TABLE IF NOT EXISTS NhaXuatBan(
	MaNXB int,
    TenNXB varchar(100),
    DiaChi varchar(255),
    DienThoai varchar(100)
);

CREATE TABLE IF NOT EXISTS Gom(
	SoLuong int,
    DonGia double
);

CREATE TABLE IF NOT EXISTS ThamGia(
	VaiTro varchar(100),
    ViTri varchar(100)
);

ALTER TABLE `QLBanSach`.`KhachHang` 
CHANGE COLUMN `MaKH` `MaKH` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`MaKH`);
;

ALTER TABLE `QLBanSach`.`DonHang` 
CHANGE COLUMN `MaDonHang` `MaDonHang` INT NOT NULL ,
ADD PRIMARY KEY (`MaDonHang`);
;

ALTER TABLE `QLBanSach`.`ChuDe` 
CHANGE COLUMN `MaChuDe` `MaChuDe` INT NOT NULL ,
ADD PRIMARY KEY (`MaChuDe`);
;

ALTER TABLE `QLBanSach`.`TacGia` 
CHANGE COLUMN `MaTacGia` `MaTacGia` VARCHAR(100) NOT NULL ,
ADD PRIMARY KEY (`MaTacGia`);
;

ALTER TABLE `QLBanSach`.`Sach` 
CHANGE COLUMN `MaSach` `MaSach` INT NOT NULL ,
ADD PRIMARY KEY (`MaSach`);
;

ALTER TABLE `QLBanSach`.`NhaXuatBan` 
CHANGE COLUMN `MaNXB` `MaNXB` INT NOT NULL ,
ADD PRIMARY KEY (`MaNXB`);
;

ALTER TABLE `QLBanSach`.`DonHang` 
ADD COLUMN `MaKH` INT NOT NULL AFTER `NgayGiao`;

ALTER TABLE `QLBanSach`.`DonHang` 
ADD INDEX `MaKH_idx` (`MaKH` ASC) VISIBLE;
;
ALTER TABLE `QLBanSach`.`DonHang` 
ADD CONSTRAINT `MaKH`
  FOREIGN KEY (`MaKH`)
  REFERENCES `QLBanSach`.`KhachHang` (`MaKH`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `QLBanSach`.`Sach` 
ADD COLUMN `MaChuDe` INT NOT NULL AFTER `SoLuongTon`;

ALTER TABLE `QLBanSach`.`Sach` 
ADD INDEX `MaChuDe_idx` (`MaChuDe` ASC) VISIBLE;
;
ALTER TABLE `QLBanSach`.`Sach` 
ADD CONSTRAINT `MaChuDe`
  FOREIGN KEY (`MaChuDe`)
  REFERENCES `QLBanSach`.`ChuDe` (`MaChuDe`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `QLBanSach`.`Gom` 
ADD COLUMN `MaSach` INT NOT NULL AFTER `DonGia`,
ADD COLUMN `MaDonHang` INT NOT NULL AFTER `MaSach`,
ADD PRIMARY KEY (`MaSach`, `MaDonHang`);
;

ALTER TABLE `QLBanSach`.`Gom` 
ADD INDEX `MaDonHang_idx` (`MaDonHang` ASC) VISIBLE;
;
ALTER TABLE `QLBanSach`.`Gom` 
ADD CONSTRAINT `MaSach`
  FOREIGN KEY (`MaSach`)
  REFERENCES `QLBanSach`.`Sach` (`MaSach`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `MaDonHang`
  FOREIGN KEY (`MaDonHang`)
  REFERENCES `QLBanSach`.`DonHang` (`MaDonHang`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  
ALTER TABLE `QLBanSach`.`ThamGia` 
ADD COLUMN `MaSach` INT NOT NULL AFTER `ViTri`,
ADD COLUMN `MaTacGia` INT NOT NULL AFTER `MaSach`,
ADD PRIMARY KEY (`MaSach`, `MaTacGia`);
;

ALTER TABLE `QLBanSach`.`TacGia` 
CHANGE COLUMN `MaTacGia` `MaTacGia` INT NOT NULL ;

ALTER TABLE `QLBanSach`.`ThamGia` 
ADD CONSTRAINT `MaTacGia`
  FOREIGN KEY (`MaTacGia`)
  REFERENCES `QLBanSach`.`TacGia` (`MaTacGia`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `QLBanSach`.`Sach` 
ADD COLUMN `MaNXB` INT NOT NULL AFTER `MaChuDe`;

ALTER TABLE `QLBanSach`.`Sach` 
ADD INDEX `MaNXB_idx` (`MaNXB` ASC) VISIBLE;
;
ALTER TABLE `QLBanSach`.`Sach` 
ADD CONSTRAINT `MaNXB`
  FOREIGN KEY (`MaNXB`)
  REFERENCES `QLBanSach`.`NhaXuatBan` (`MaNXB`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  
ALTER TABLE `QLBanSach`.`ThamGia` 
ADD CONSTRAINT `Ma_Sach`
  FOREIGN KEY (`MaSach`)
  REFERENCES `QLBanSach`.`Sach` (`MaSach`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

