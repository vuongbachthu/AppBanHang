-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-02-05 01:25:25.603

-- tables
-- Table: BINHLUAN
CREATE TABLE BINHLUAN (
    MaBL int NOT NULL AUTO_INCREMENT,
    TieuDe char(200) NOT NULL,
    CONSTRAINT BINHLUAN_pk PRIMARY KEY (MaBL)
);

-- Table: CHITIETBINHLUAN
CREATE TABLE CHITIETBINHLUAN (
    BINHLUAN_MaBL int NOT NULL,
    USER_MaUser int NOT NULL,
    SANPHAM_MaSP int NOT NULL,
    NoiDung int NOT NULL,
    NgayBL int NOT NULL,
    CONSTRAINT CHITIETBINHLUAN_pk PRIMARY KEY (BINHLUAN_MaBL,USER_MaUser,SANPHAM_MaSP)
);

-- Table: CHITIETHOADON
CREATE TABLE CHITIETHOADON (
    HOADON_MaHD int NOT NULL,
    SANPHAM_MaSP int NOT NULL,
    SoLuongSP int NOT NULL,
    CONSTRAINT CHITIETHOADON_pk PRIMARY KEY (HOADON_MaHD,SANPHAM_MaSP)
);

-- Table: CHITIETKHUYENMAI
CREATE TABLE CHITIETKHUYENMAI (
    PhanTramKM int NOT NULL,
    KHUYENMAI_MaKM int NOT NULL,
    SANPHAM_MaSP int NOT NULL,
    CONSTRAINT CHITIETKHUYENMAI_pk PRIMARY KEY (KHUYENMAI_MaKM,SANPHAM_MaSP)
);

-- Table: CHITIETSANPHAM
CREATE TABLE CHITIETSANPHAM (
    SANPHAM_MaSP int NOT NULL,
    TenChiTiet char(200) NOT NULL,
    GiasTri text NOT NULL,
    CONSTRAINT CHITIETSANPHAM_pk PRIMARY KEY (SANPHAM_MaSP)
);

-- Table: CHITIETTHUONGHIEU
CREATE TABLE CHITIETTHUONGHIEU (
    THUONGHIEU_MaThuongHieu int NOT NULL,
    LOAISANPHAM_MaLoaiSP int NOT NULL,
    HinhThuongHieu text NOT NULL,
    CONSTRAINT CHITIETTHUONGHIEU_pk PRIMARY KEY (THUONGHIEU_MaThuongHieu,LOAISANPHAM_MaLoaiSP)
);

-- Table: DANHGIA
CREATE TABLE DANHGIA (
    MaDG int NOT NULL AUTO_INCREMENT,
    SANPHAM_MaSP int NOT NULL,
    TenThietBi text NOT NULL,
    TieuDe text NOT NULL,
    NoiDung text NOT NULL,
    SoSao int NOT NULL,
    NgayDanhGia char(50) NOT NULL,
    CONSTRAINT DANHGIA_pk PRIMARY KEY (MaDG)
);

-- Table: HOADON
CREATE TABLE HOADON (
    MaHD int NOT NULL AUTO_INCREMENT,
    NgayMua text NOT NULL,
    NgayGiao text NOT NULL,
    TrangThai char(20) NOT NULL,
    TenNguoiNhan char(100) NOT NULL,
    SoDienThoai char(20) NOT NULL,
    ChuyenKhoan bool NOT NULL,
    MaChuyenKoan text NOT NULL,
    CONSTRAINT HOADON_pk PRIMARY KEY (MaHD)
);

-- Table: KHUYENMAI
CREATE TABLE KHUYENMAI (
    MaKM int NOT NULL AUTO_INCREMENT,
    LOAISANPHAM_MaLoaiSP int NOT NULL,
    TenKM char(200) NOT NULL,
    NgayBatDau char(20) NOT NULL,
    NgayKetThuc char(20) NOT NULL,
    HinhKhuyenMai text NOT NULL,
    CONSTRAINT KHUYENMAI_pk PRIMARY KEY (MaKM)
);

-- Table: LOAISANPHAM
CREATE TABLE LOAISANPHAM (
    MaLoaiSP int NOT NULL AUTO_INCREMENT,
    TenLoaiSP char(200) NOT NULL,
    MaLoaiCha int NOT NULL,
    CONSTRAINT LOAISANPHAM_pk PRIMARY KEY (MaLoaiSP)
);

-- Table: LOAIUSER
CREATE TABLE LOAIUSER (
    MaLoaiUser int NOT NULL AUTO_INCREMENT,
    TenLoaiUser char(200) NOT NULL,
    CONSTRAINT LOAIUSER_pk PRIMARY KEY (MaLoaiUser)
);

-- Table: SANPHAM
CREATE TABLE SANPHAM (
    MaSP int NOT NULL AUTO_INCREMENT,
    TenSP char(200) NOT NULL,
    GiaSP double NOT NULL,
    AnhLon text NOT NULL,
    AnhNho text NOT NULL,
    ThongTin text NOT NULL,
    SoLuong int NOT NULL,
    LOAISANPHAM_MaLoaiSP int NOT NULL,
    THUONGHIEU_MaThuongHieu int NOT NULL,
    LuotMua int NOT NULL,
    CONSTRAINT SANPHAM_pk PRIMARY KEY (MaSP)
);

-- Table: THUONGHIEU
CREATE TABLE THUONGHIEU (
    MaThuongHieu int NOT NULL AUTO_INCREMENT,
    TenThuongHieu char(200) NOT NULL,
    HinhThuongHieu text NOT NULL,
    CONSTRAINT THUONGHIEU_pk PRIMARY KEY (MaThuongHieu)
);

-- Table: USER
CREATE TABLE USER (
    MaUser int NOT NULL AUTO_INCREMENT,
    TenUser char(100) NOT NULL,
    TenDangNhap char(100) NOT NULL,
    MatKhau char(50) NOT NULL,
    DiaChi char(255) NOT NULL,
    NgaySinh char(20) NOT NULL,
    SoDienThoai char(20) NOT NULL,
    GioiTinh char(20) NOT NULL,
    LOAIUSER_MaLoaiUser int NOT NULL,
    CONSTRAINT USER_pk PRIMARY KEY (MaUser)
);

-- foreign keys
-- Reference: CHITIETBINHLUAN_BINHLUAN (table: CHITIETBINHLUAN)
ALTER TABLE CHITIETBINHLUAN ADD CONSTRAINT CHITIETBINHLUAN_BINHLUAN FOREIGN KEY CHITIETBINHLUAN_BINHLUAN (BINHLUAN_MaBL)
    REFERENCES BINHLUAN (MaBL);

-- Reference: CHITIETBINHLUAN_SANPHAM (table: CHITIETBINHLUAN)
ALTER TABLE CHITIETBINHLUAN ADD CONSTRAINT CHITIETBINHLUAN_SANPHAM FOREIGN KEY CHITIETBINHLUAN_SANPHAM (SANPHAM_MaSP)
    REFERENCES SANPHAM (MaSP);

-- Reference: CHITIETBINHLUAN_USER (table: CHITIETBINHLUAN)
ALTER TABLE CHITIETBINHLUAN ADD CONSTRAINT CHITIETBINHLUAN_USER FOREIGN KEY CHITIETBINHLUAN_USER (USER_MaUser)
    REFERENCES USER (MaUser);

-- Reference: CHITIETHOADON_HOADON (table: CHITIETHOADON)
ALTER TABLE CHITIETHOADON ADD CONSTRAINT CHITIETHOADON_HOADON FOREIGN KEY CHITIETHOADON_HOADON (HOADON_MaHD)
    REFERENCES HOADON (MaHD);

-- Reference: CHITIETHOADON_SANPHAM (table: CHITIETHOADON)
ALTER TABLE CHITIETHOADON ADD CONSTRAINT CHITIETHOADON_SANPHAM FOREIGN KEY CHITIETHOADON_SANPHAM (SANPHAM_MaSP)
    REFERENCES SANPHAM (MaSP);

-- Reference: CHITIETKHUYENMAI_KHUYENMAI (table: CHITIETKHUYENMAI)
ALTER TABLE CHITIETKHUYENMAI ADD CONSTRAINT CHITIETKHUYENMAI_KHUYENMAI FOREIGN KEY CHITIETKHUYENMAI_KHUYENMAI (KHUYENMAI_MaKM)
    REFERENCES KHUYENMAI (MaKM);

-- Reference: CHITIETKHUYENMAI_SANPHAM (table: CHITIETKHUYENMAI)
ALTER TABLE CHITIETKHUYENMAI ADD CONSTRAINT CHITIETKHUYENMAI_SANPHAM FOREIGN KEY CHITIETKHUYENMAI_SANPHAM (SANPHAM_MaSP)
    REFERENCES SANPHAM (MaSP);

-- Reference: CHITIETSANPHAM_SANPHAM (table: CHITIETSANPHAM)
ALTER TABLE CHITIETSANPHAM ADD CONSTRAINT CHITIETSANPHAM_SANPHAM FOREIGN KEY CHITIETSANPHAM_SANPHAM (SANPHAM_MaSP)
    REFERENCES SANPHAM (MaSP);

-- Reference: CHITIETTHUONGHIEU_LOAISANPHAM (table: CHITIETTHUONGHIEU)
ALTER TABLE CHITIETTHUONGHIEU ADD CONSTRAINT CHITIETTHUONGHIEU_LOAISANPHAM FOREIGN KEY CHITIETTHUONGHIEU_LOAISANPHAM (LOAISANPHAM_MaLoaiSP)
    REFERENCES LOAISANPHAM (MaLoaiSP);

-- Reference: CHITIETTHUONGHIEU_THUONGHIEU (table: CHITIETTHUONGHIEU)
ALTER TABLE CHITIETTHUONGHIEU ADD CONSTRAINT CHITIETTHUONGHIEU_THUONGHIEU FOREIGN KEY CHITIETTHUONGHIEU_THUONGHIEU (THUONGHIEU_MaThuongHieu)
    REFERENCES THUONGHIEU (MaThuongHieu);

-- Reference: DANHGIA_SANPHAM (table: DANHGIA)
ALTER TABLE DANHGIA ADD CONSTRAINT DANHGIA_SANPHAM FOREIGN KEY DANHGIA_SANPHAM (SANPHAM_MaSP)
    REFERENCES SANPHAM (MaSP);

-- Reference: KHUYENMAI_LOAISANPHAM (table: KHUYENMAI)
ALTER TABLE KHUYENMAI ADD CONSTRAINT KHUYENMAI_LOAISANPHAM FOREIGN KEY KHUYENMAI_LOAISANPHAM (LOAISANPHAM_MaLoaiSP)
    REFERENCES LOAISANPHAM (MaLoaiSP);

-- Reference: SANPHAM_LOAISANPHAM (table: SANPHAM)
ALTER TABLE SANPHAM ADD CONSTRAINT SANPHAM_LOAISANPHAM FOREIGN KEY SANPHAM_LOAISANPHAM (LOAISANPHAM_MaLoaiSP)
    REFERENCES LOAISANPHAM (MaLoaiSP);

-- Reference: SANPHAM_THUONGHIEU (table: SANPHAM)
ALTER TABLE SANPHAM ADD CONSTRAINT SANPHAM_THUONGHIEU FOREIGN KEY SANPHAM_THUONGHIEU (THUONGHIEU_MaThuongHieu)
    REFERENCES THUONGHIEU (MaThuongHieu);

-- Reference: USER_LOAIUSER (table: USER)
ALTER TABLE USER ADD CONSTRAINT USER_LOAIUSER FOREIGN KEY USER_LOAIUSER (LOAIUSER_MaLoaiUser)
    REFERENCES LOAIUSER (MaLoaiUser);

-- End of file.

