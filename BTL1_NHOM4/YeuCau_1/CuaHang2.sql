ALTER USER CH2 QUOTA UNLIMITED ON USERS;
ALTER SESSION SET NLS_DATE_FORMAT =' DD/MM/YYYY HH24:MI:SS ';

Drop TABLE CH2.DIENTHOAI;
Drop TABLE CH2.CUAHANG;
Drop TABLE CH2.KHOHANG_QLKHO;
Drop TABLE CH2.KHOHANG_NVBH;
Drop TABLE CH2.NHANVIEN;
Drop TABLE CH2.HOADON;
Drop TABLE CH2.CTHD;
Drop TABLE CH2.KHACHHANG;
--------------------------------
CREATE TABLE CH2.DIENTHOAI 
(
    MaDT VARCHAR(10) PRIMARY KEY,
    TenDT VARCHAR2(50),
    MauSac VARCHAR(50),
    DungLuong VARCHAR(50),
    GiaTien NUMBER,
    ThuongHieu VARCHAR(50)
    
);

CREATE TABLE CH2.CUAHANG
(
    MaCH VARCHAR(5) PRIMARY KEY,
    TenCH VARCHAR2(50),
    SoDT VARCHAR(11)
    
);

CREATE TABLE CH2.KHOHANG_QLKHO
(
    MaCH VARCHAR(5),
    MaDT VARCHAR(10),
    SoLuong NUMBER,
    NgayNhapKho DATE,
     CONSTRAINT PK_KHOHANG_QLKHO PRIMARY KEY(MaCH,MaDT), 
    CONSTRAINT FK_KHOHANG_QLKHO_CUAHANG FOREIGN KEY (MaCH)
    REFERENCES CH2.CUAHANG (MaCH),
      CONSTRAINT FK_KHOHANG_QLKHO_DIENTHOAI FOREIGN KEY (MaDT)
    REFERENCES CH2.DIENTHOAI(MaDT)
);

CREATE TABLE CH2.KHOHANG_NVBH
(
    MaCH VARCHAR(5),
    MaDT VARCHAR(10),
    TinhTrang  VARCHAR(10), 
     CONSTRAINT PK_KHOHANG_NVBH PRIMARY KEY(MaCH,MaDT), 
    CONSTRAINT FK_KHOHANG_NVBH_CUAHANG FOREIGN KEY (MaCH)
    REFERENCES CH2.CUAHANG (MaCH),
      CONSTRAINT FK_KHOHANG_NVBH_DIENTHOAI FOREIGN KEY (MaDT)
    REFERENCES CH2.DIENTHOAI(MaDT)
);

CREATE TABLE CH2.NHANVIEN 
(
    MaNV VARCHAR(5) PRIMARY KEY,
    TenNV VARCHAR(50),
    DiaChi  VARCHAR(50),
    SoDT VARCHAR(11),
    Luong NUMBER,
    MaCH VARCHAR(5),
    CONSTRAINT FK_NHANVIEN_CUAHANG FOREIGN KEY (MaCH)
    REFERENCES CH2.CUAHANG (MaCH)
);

CREATE TABLE CH2.KHACHHANG
(
    MaKH VARCHAR(5) PRIMARY KEY,
    TenKH VARCHAR(50),
    DiaChi  VARCHAR(50),
    SoDT VARCHAR(11)
);

CREATE TABLE CH2.HOADON 
(
    MaHD VARCHAR(5) PRIMARY KEY,
    MaNV VARCHAR(5),
    MaKH VARCHAR(5), 
    MaCH VARCHAR(5),
    NgayHD DATE,
    ThanhTien NUMBER,
    CONSTRAINT FK_HOADON_NHANVIEN FOREIGN KEY (MaNV)
        REFERENCES CH2.NHANVIEN (MaNV),
    CONSTRAINT FK_HOADON_KHACHHANG FOREIGN KEY (MaKH)
        REFERENCES CH2.KHACHHANG (MaKH),
    CONSTRAINT FK_HOADON_CUAHANG FOREIGN KEY (MaCH)
        REFERENCES CH2.CUAHANG (MaCH)
);

CREATE TABLE CH2.CTHD 
(
    MaHD VARCHAR(5),
    MaDT VARCHAR(10),
    SoLuong NUMBER, 
    CONSTRAINT PK_CTHD PRIMARY KEY(MaHD,MaDT), 
    CONSTRAINT FK_CTHD_HOADON FOREIGN KEY (MaHD)
        REFERENCES CH2.HOADON (MaHD),
    CONSTRAINT FK_CTHD_DIENTHOAI FOREIGN KEY (MaDT)
        REFERENCES CH2.DIENTHOAI (MaDT)
);

SELECT * FROM CN2.NHANVIEN;
-- DELETE --
DELETE FROM CH2.CTHD;
DELETE FROM CH2.HOADON;
DELETE FROM CH2.KHACHHANG;
DELETE FROM CH2.NHANVIEN;
DELETE FROM CH2.KHOHANG_NVBH;
DELETE FROM CH2.KHOHANG_QLKHO;
DELETE FROM CH2.CUAHANG;
DELETE FROM CH2.DIENTHOAI;
-----------------------------------------------
-- INSERT DU LIEU

-- 1/ DIENTHOAI
delete from CH2.DIENTHOAI;

INSERT INTO CH2.DIENTHOAI VALUES ('Phone01','Iphone 12','Black','64GB',18290000,'Apple');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone02','Iphone 12','Red','64GB',18290000,'Apple');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone03','Iphone 12','Blue','64GB',18290000,'Apple');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone04','Iphone 12','White','64GB',18290000,'Apple');

INSERT INTO CH2.DIENTHOAI VALUES ('Phone05','Iphone 12','Black','128GB',19590000,'Apple');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone06','Iphone 12','Red','128GB',19590000,'Apple');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone07','Iphone 12','Blue','128GB',19590000,'Apple');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone08','Iphone 12','White','128GB',19590000,'Apple');

INSERT INTO CH2.DIENTHOAI VALUES ('Phone09','Iphone 12','Black','256GB',22390000,'Apple');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone10','Iphone 12','Red','256GB',22390000,'Apple');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone11','Iphone 12','Blue','256GB',22390000,'Apple');

INSERT INTO CH2.DIENTHOAI VALUES ('Phone12','Iphone 13','Midnight','64GB',21590000,'Apple');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone13','Iphone 13','Red','64GB',21590000,'Apple');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone14','Iphone 13','Blue','64GB',21590000,'Apple');

INSERT INTO CH2.DIENTHOAI VALUES ('Phone15','Iphone 13','Midnight','128GB',24190000,'Apple');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone16','Iphone 13','Red','128GB',24190000,'Apple');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone17','Iphone 13','Blue','128GB',24190000,'Apple');

INSERT INTO CH2.DIENTHOAI VALUES ('Phone18','Iphone 13','Midnight','256GB',29490000,'Apple');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone19','Iphone 13','Red','256GB',29490000,'Apple');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone20','Iphone 13','Blue','256GB',29490000,'Apple');

INSERT INTO CH2.DIENTHOAI VALUES ('Phone21','Samsung Galaxy Z Fold3 5G','Black','256GB',41999000,'Samsung');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone22','Samsung Galaxy Z Fold3 5G','Grey','256GB',41999000,'Samsung');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone23','Samsung Galaxy Z Fold3 5G','Blue','256GB',41999000,'Samsung');

INSERT INTO CH2.DIENTHOAI VALUES ('Phone24','Samsung Galaxy Z Fold3 5G','Black','512GB',45000000,'Samsung');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone25','Samsung Galaxy Z Fold3 5G','Grey','512GB',45000000,'Samsung');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone26','Samsung Galaxy Z Fold3 5G','Blue','512GB',45000000,'Samsung');

INSERT INTO CH2.DIENTHOAI VALUES ('Phone27','Samsung Galaxy Z Flip3 5G','Black ','128GB',24990000,'Samsung');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone28','Samsung Galaxy Z Flip3 5G','Blue','128GB',24990000,'Samsung');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone29','Samsung Galaxy Z Flip3 5G','White','128GB',24990000,'Samsung');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone30','Samsung Galaxy Z Flip3 5G','Purple','128GB',24990000,'Samsung');

INSERT INTO CH2.DIENTHOAI VALUES ('Phone31','Samsung Galaxy Z Flip3 5G','Black','256GB',26990000,'Samsung');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone32','Samsung Galaxy Z Flip3 5G','Blue','256GB',26990000,'Samsung');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone33','Samsung Galaxy Z Flip3 5G','White','256GB',26990000,'Samsung');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone34','Samsung Galaxy Z Flip3 5G','Purple','256GB',26990000,'Samsung');

INSERT INTO CH2.DIENTHOAI VALUES ('Phone35','Samsung Galaxy A22','Purple','128GB',5390000,'Samsung');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone36','Samsung Galaxy A22','Black','128GB',5390000,'Samsung');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone37','Samsung Galaxy A22','Green','128GB',5390000,'Samsung');

INSERT INTO CH2.DIENTHOAI VALUES ('Phone38','Xiaomi 11T 5G','Blue','128GB',5390000,'Xiaomi');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone39','Xiaomi 11T 5G','White','128GB',5390000,'Xiaomi');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone40','Xiaomi 11T 5G','Grey','128GB',5390000,'Xiaomi');

INSERT INTO CH2.DIENTHOAI VALUES ('Phone41','Vsmart Aris','Blue','128GB',4490000,'Vsmart');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone42','Vsmart Aris','Grey','128GB',4490000,'Vsmart');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone43','Vsmart Aris','Green','128GB',4490000,'Vsmart');

INSERT INTO CH2.DIENTHOAI VALUES ('Phone44','Vsmart Aris Pro','Grey','128GB',5150000,'Vsmart');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone45','Vsmart Aris Pro','Green','128GB',5150000,'Vsmart');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone46','Vsmart Aris Pro','Copper','128GB',5150000,'Vsmart');

INSERT INTO CH2.DIENTHOAI VALUES ('Phone47','Vivo Y21s','Midnight','128GB',5480000,'Vivo');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone48','Vivo Y21s','White','128GB',5480000,'Vivo');

INSERT INTO CH2.DIENTHOAI VALUES ('Phone49','OPPO Reno6 5G','Black','128GB',12990000,'Oppo');
INSERT INTO CH2.DIENTHOAI VALUES ('Phone50','OPPO Reno6 5G','Grey','128GB',12990000,'Oppo');



-- 2/ CUA HANG
DELETE FROM CH2.CUAHANG;

INSERT INTO CH2.CUAHANG VALUES ('CH01','QUAN 1, TPHCM','09494499969');
INSERT INTO CH2.CUAHANG VALUES ('CH02','QUAN BA DINH, HA NOI','0995596624');

-- 3/ KHACH HANG --

DELETE FROM CH2.KHACHHANG;

INSERT INTO CH2.KHACHHANG VALUES ('KH01','Nguyen Minh Quan','QUAN 1, TPHCM','09494499969');
INSERT INTO CH2.KHACHHANG VALUES ('KH02','Le Minh Triet','QUAN 2, TPHCM','0995596624');
INSERT INTO CH2.KHACHHANG VALUES ('KH03','Hoang Minh Nam Phuong','QUAN 3, TPHCM','09822343455');
INSERT INTO CH2.KHACHHANG VALUES ('KH04','Dao Minh Duc','QUAN 4, TPHCM','0936934644');
INSERT INTO CH2.KHACHHANG VALUES ('KH05','Pham Thi Thao Nhi','QUAN 5, TPHCM','0944924928');
INSERT INTO CH2.KHACHHANG VALUES ('KH06','Vu My Ngoc','QUAN 6, TPHCM','09494499969');
INSERT INTO CH2.KHACHHANG VALUES ('KH07','Do Quang Vinh','QUAN 7, TPHCM','0949821299');
INSERT INTO CH2.KHACHHANG VALUES ('KH08','Nguyen Truong Hoang Nam','QUAN 8, TPHCM','09494499969');
INSERT INTO CH2.KHACHHANG VALUES ('KH09','Nguyen Phan Bao Chau','QUAN 9, TPHCM','0982999343');
INSERT INTO CH2.KHACHHANG VALUES ('KH10','Nguyen Le Nhat Vy','QUAN 10, TPHCM','0998555312');
INSERT INTO CH2.KHACHHANG VALUES ('KH11','Nguyen Thai Bao Ngoc','QUAN 11, TPHCM','09494499969');
INSERT INTO CH2.KHACHHANG VALUES ('KH12','Truong Gia Bao','QUAN 12, TPHCM','0938241489');
INSERT INTO CH2.KHACHHANG VALUES ('KH13','Ngo Manh Hung','QUAN TAN BINH, TPHCM','0982991868');
INSERT INTO CH2.KHACHHANG VALUES ('KH14','Bui Nguyen Trung Thanh','QUAN BINH TAN, TPHCM','09494499969');
INSERT INTO CH2.KHACHHANG VALUES ('KH15','Ngac Bao Vinh','QUAN BINH THANH, TPHCM','0949165339');
INSERT INTO CH2.KHACHHANG VALUES ('KH16','Phan Bao Chau','QUAN GO VAP, TPHCM','09494499969');
INSERT INTO CH2.KHACHHANG VALUES ('KH17','Tran Nguyen Phuoc Tai','QUAN PHU NHUAN, TPHCM','09528392386');
INSERT INTO CH2.KHACHHANG VALUES ('KH18','Tran An Nguyen','QUAN TAN PHU, TPHCM','0993394146');
INSERT INTO CH2.KHACHHANG VALUES ('KH19','Huynh Hoang Bao Ngoc','QUAN THU DUC, TPHCM','09528392386');
INSERT INTO CH2.KHACHHANG VALUES ('KH20','Nguyen Tran Yen Nhi','HUYEN BINH CHANH, TPHCM','09494499969');
INSERT INTO CH2.KHACHHANG VALUES ('KH21','Pham Hoang Vinh','HUYEN CAN GIO, TPHCM','09494499969');
INSERT INTO CH2.KHACHHANG VALUES ('KH22','Tran Ngoc Vu','HUYEN CU CHI, TPHCM','0994193243');
INSERT INTO CH2.KHACHHANG VALUES ('KH23','Tran Dang Khoa','HUYEN HOC MON, TPHCM','0942244615');
INSERT INTO CH2.KHACHHANG VALUES ('KH24','Nguyen Thien An','HUYEN NHA BE, TPHCM','0989968144');
INSERT INTO CH2.KHACHHANG VALUES ('KH25','Le Vo Ngoc Nhi','QUAN HOAN KIEM, HA NOI','0993362892');
INSERT INTO CH2.KHACHHANG VALUES ('KH26','Pham Quang Huy','QUAN DONG DA, HA NOI','09499594949');
INSERT INTO CH2.KHACHHANG VALUES ('KH27','Chu Minh Duc','QUAN BA DINH, HA NOI','0992426225');
INSERT INTO CH2.KHACHHANG VALUES ('KH28','Nguyen Thanh Dat','QUAN HAI BA TRUNG, HA NOI','09528392386');
INSERT INTO CH2.KHACHHANG VALUES ('KH29','Phung Duc Thien','QUAN HOANG MAI, HA NOI','09528392386');
INSERT INTO CH2.KHACHHANG VALUES ('KH30','Dang Ngoc Anh Thi','QUAN THANH XUAN, HA NOI','09494499969');
INSERT INTO CH2.KHACHHANG VALUES ('KH31','Lai Mai Thanh Thao','QUAN LONG BIEN, HA NOI','09834525696');
INSERT INTO CH2.KHACHHANG VALUES ('KH32','Tran Do Hoang Long','QUAN NAM TU LIEM, HA NOI','0944899489');
INSERT INTO CH2.KHACHHANG VALUES ('KH33','Banh Gia Linh','QUAN BAC TU LIEM, HA NOI','09494499969');
INSERT INTO CH2.KHACHHANG VALUES ('KH34','Bui Quang Huy','QUAN TAY HO, HA NOI','0946924915');
INSERT INTO CH2.KHACHHANG VALUES ('KH35','Nguyen Dac Hong Anh','QUAN CAU GIAY, HA NOI','0993916948');
INSERT INTO CH2.KHACHHANG VALUES ('KH36','Le Hana','QUAN HA DONG, HA NOI','09364632242');
INSERT INTO CH2.KHACHHANG VALUES ('KH37','Pham Thi Bao Tram','THI XA SON TAY, HA NOI','0931441445');
INSERT INTO CH2.KHACHHANG VALUES ('KH38','Nguyen Gia Huy','HUYEN BA VI, HA NOI','0935116895');
INSERT INTO CH2.KHACHHANG VALUES ('KH39','To Dinh Gia Bao','HUYEN CHUONG MY, HA NOI','09528392386');
INSERT INTO CH2.KHACHHANG VALUES ('KH40','Mai Hieu Minh','HUYEN PHUC THO, HA NOI','09494499969');
INSERT INTO CH2.KHACHHANG VALUES ('KH41','Tran Ninh Khang','HUYEN DAN PHUONG, HA NOI','09528392386');
INSERT INTO CH2.KHACHHANG VALUES ('KH42','Nguyen Van Thanh Binh','HUYEN DONG ANH, HA NOI','09494499969');
INSERT INTO CH2.KHACHHANG VALUES ('KH43','Huynh Vo Tri Nhan','HUYEN GIA LAM, HA NOI','0983154412');
INSERT INTO CH2.KHACHHANG VALUES ('KH44','Hoang Diep Anh','HUYEN HOAI DUC, HA NOI','0991958924');
INSERT INTO CH2.KHACHHANG VALUES ('KH45','Cao Ba Ngoc','HUYEN ME LINH, HA NOI','0933223832');
INSERT INTO CH2.KHACHHANG VALUES ('KH46','Phan Tam An','HUYEN MY DUC, HA NOI','0995949124');
INSERT INTO CH2.KHACHHANG VALUES ('KH47','Vo Minh Thanh','HUYEN PHU XUYEN, HA NOI','09898699925');
INSERT INTO CH2.KHACHHANG VALUES ('KH48','Huynh Thai Son','HUYEN QUOC OAI, HA NOI','0966486839');
INSERT INTO CH2.KHACHHANG VALUES ('KH49','Nguyen Khanh Trinh','HUYEN SOC SON, HA NOI','09528392386');
INSERT INTO CH2.KHACHHANG VALUES ('KH50','Pham Ngoc Hai','HUYEN THACH THAT,HA NOI','09528392386');

--- 4/ Nhan Vien
INSERT INTO CH2.NHANVIEN VALUES ('NV26','Ngo Le Khoi Nguyen','QUAN DONG DA, HA NOI','09499594949',6100000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV27','Huynh My Yen','QUAN BA DINH, HA NOI','0992426225',6100000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV28','Truong Tuyet Anh','QUAN HAI BA TRUNG, HA NOI','09528392386',6100000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV28','Nguyen Minh Nhat','QUAN HOANG MAI, HA NOI','09528392386',6100000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV30','Doan Dac Phuc','QUAN THANH XUAN, HA NOI','09494499969',7000000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV31','Nguyen Nguyen Bao Ngoc','QUAN LONG BIEN, HA NOI','09834525696',7000000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV32','Pham Ngoc Quynh Huong','QUAN NAM TU LIEM, HA NOI','0944899489',7000000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV33','Thai Ha Linh','QUAN BAC TU LIEM, HA NOI','09494499969',7000000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV34','Pham Ngoc Minh','QUAN TAY HO, HA NOI','0946924915',7000000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV35','Nguyen Hong Minh','QUAN CAU GIAY, HA NOI','0993916948',6000000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV36','Le Duong','QUAN HA DONG, HA NOI','09364632242',6000000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV37','Phan Bao Tram','THI XA SON TAY, HA NOI','0931441445',6000000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV38','Phan Gia Huy','HUYEN BA VI, HA NOI','0935116895',6000000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV39','Gia Bao','QUAN GO VAP, TPHCM','09528392386',6000000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV40','Ha Minh Phat','QUAN GO VAP, TPHCM','09494499969',6000000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV41','Tran Minh Phat','QUAN GO VAP, TPHCM','09528392386',6000000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV42','Nguyen Van Binh','QUAN GO VAP, TPHCM','09494499969',6000000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV43','Vo Thi Tra My','QUAN GO VAP, TPHCM','0983154412',6000000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV44','Nguyen Le Kim Khanh','QUAN GO VAP, TPHCM','0991958924',6000000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV45','Phan Minh Huy','QUAN GO VAP, TPHCM','0933223832',6000000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV46','Truong Thanh Tai','QUAN 12, TPHCM','0995949124',6000000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV47','Vo Minh Quan','QUAN 12, TPHCM','09898699925',6000000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV48','Dang Thai Son','QUAN 12, TPHCM','0966486839',6000000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV49','Cao Pham Khanh Mai','QUAN 12, TPHCM','09528392386',6000000,'CH02');
INSERT INTO CH2.NHANVIEN VALUES ('NV50','Ho Khanh Thi','QUAN 12, TPHCM','09528392386',6000000,'CH02');


-- 5/ KHOHANG_QLKHO --

INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone01',50,'29/10/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone02',50,'29/10/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone04',200,'29/10/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone05',200,'29/10/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone07',100,'29/10/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone08',150,'29/10/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone09',150,'29/10/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone10',150,'29/10/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone12',150,'29/10/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone14',150,'29/10/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone15',100,'30/10/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone17',100,'30/10/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone19',125,'30/10/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone20',125,'30/10/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone21',125,'30/10/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone23',125,'30/10/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone24',175,'30/10/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone25',175,'30/10/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone30',175,'30/10/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone31',175,'30/10/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone32',250,'01/11/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone33',250,'01/11/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone35',250,'01/11/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone37',250,'05/11/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone38',275,'05/11/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone40',275,'05/11/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone41',275,'05/11/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone42',275,'05/11/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone44',300,'07/11/2021');
INSERT INTO CH2.KHOHANG_QLKHO VALUES ('CH02','Phone49',300,'07/11/2021');



-- 6/ KHOHANG_NVBH -- 

INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone01','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone02','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone04','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone05','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone07','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone08','Het hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone09','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone10','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone12','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone14','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone15','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone17','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone19','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone20','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone21','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone23','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone24','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone25','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone30','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone31','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone32','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone33','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone35','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone37','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone38','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone40','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone41','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone42','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone44','Con hang');
INSERT INTO CH2.KHOHANG_NVBH VALUES ('CH02','Phone49','Het hang');


-- 7/ HOADON -- 
DELETE FROM CH2.HOADON;


INSERT INTO CH2.HOADON VALUES ('HD26','NV27','KH04','CH02','30/10/2021',18290000) ;
INSERT INTO CH2.HOADON VALUES ('HD27','NV27','KH05','CH02','30/10/2021',36580000);
INSERT INTO CH2.HOADON VALUES ('HD28','NV32','KH06','CH02','30/10/2021',18290000);
INSERT INTO CH2.HOADON VALUES ('HD29','NV35','KH08','CH02','30/10/2021',58770000);
INSERT INTO CH2.HOADON VALUES ('HD30','NV42','KH08','CH02','30/10/2021',19590000);
INSERT INTO CH2.HOADON VALUES ('HD31','NV44','KH09','CH02','30/10/2021',19590000);
INSERT INTO CH2.HOADON VALUES ('HD32','NV29','KH09','CH02','30/10/2021',22390000);
INSERT INTO CH2.HOADON VALUES ('HD33','NV30','KH10','CH02','30/10/2021',21590000);
INSERT INTO CH2.HOADON VALUES ('HD34','NV30','KH12','CH02','30/10/2021',43180000);
INSERT INTO CH2.HOADON VALUES ('HD35','NV30','KH12','CH02','30/10/2021',36580000);
INSERT INTO CH2.HOADON VALUES ('HD36','NV32','KH14','CH02','31/10/2021',36580000);
INSERT INTO CH2.HOADON VALUES ('HD37','NV46','KH17','CH02','31/10/2021',54870000);
INSERT INTO CH2.HOADON VALUES ('HD38','NV43','KH20','CH02','31/10/2021',72570000);
INSERT INTO CH2.HOADON VALUES ('HD39','NV50','KH21','CH02','31/10/2021',24190000);
INSERT INTO CH2.HOADON VALUES ('HD40','NV26','KH24','CH02','31/10/2021',24190000);
INSERT INTO CH2.HOADON VALUES ('HD41','NV26','KH24','CH02','01/11/2021',24190000);
INSERT INTO CH2.HOADON VALUES ('HD42','NV29','KH25','CH02','01/11/2021',24190000);
INSERT INTO CH2.HOADON VALUES ('HD43','NV38','KH31','CH02','01/11/2021',29490000);
INSERT INTO CH2.HOADON VALUES ('HD44','NV39','KH34','CH02','01/11/2021',41999000);
INSERT INTO CH2.HOADON VALUES ('HD45','NV40','KH35','CH02','07/11/2021',41999000);
INSERT INTO CH2.HOADON VALUES ('HD46','NV44','KH40','CH02','07/11/2021',26990000);
INSERT INTO CH2.HOADON VALUES ('HD47','NV33','KH41','CH02','07/11/2021',26990000);
INSERT INTO CH2.HOADON VALUES ('HD48','NV35','KH42','CH02','07/11/2021',5390000);
INSERT INTO CH2.HOADON VALUES ('HD49','NV35','KH43','CH02','07/11/2021',5390000);
INSERT INTO CH2.HOADON VALUES ('HD50','NV37','KH44','CH02','07/11/2021',5390000);


-- 8/ CTHD 


INSERT INTO CH2.CTHD VALUES ('HD26','Phone01',01);
INSERT INTO CH2.CTHD VALUES ('HD27','Phone02',02);
INSERT INTO CH2.CTHD VALUES ('HD28','Phone04',01);
INSERT INTO CH2.CTHD VALUES ('HD29','Phone05',03);
INSERT INTO CH2.CTHD VALUES ('HD30','Phone07',01);
INSERT INTO CH2.CTHD VALUES ('HD31','Phone08',01);
INSERT INTO CH2.CTHD VALUES ('HD32','Phone09',01);
INSERT INTO CH2.CTHD VALUES ('HD33','Phone12',01);
INSERT INTO CH2.CTHD VALUES ('HD34','Phone14',02);
INSERT INTO CH2.CTHD VALUES ('HD35','Phone01',02);
INSERT INTO CH2.CTHD VALUES ('HD36','Phone01',02);
INSERT INTO CH2.CTHD VALUES ('HD37','Phone02',03);
INSERT INTO CH2.CTHD VALUES ('HD38','Phone15',03);
INSERT INTO CH2.CTHD VALUES ('HD39','Phone15',01);
INSERT INTO CH2.CTHD VALUES ('HD40','Phone15',01);
INSERT INTO CH2.CTHD VALUES ('HD41','Phone17',01);
INSERT INTO CH2.CTHD VALUES ('HD42','Phone17',01);
INSERT INTO CH2.CTHD VALUES ('HD43','Phone20',01);
INSERT INTO CH2.CTHD VALUES ('HD44','Phone21',01);
INSERT INTO CH2.CTHD VALUES ('HD45','Phone23',01);
INSERT INTO CH2.CTHD VALUES ('HD46','Phone32',01);
INSERT INTO CH2.CTHD VALUES ('HD47','Phone33',01);
INSERT INTO CH2.CTHD VALUES ('HD48','Phone35',01);
INSERT INTO CH2.CTHD VALUES ('HD49','Phone35',01);
INSERT INTO CH2.CTHD VALUES ('HD50','Phone35',01);
COMMIT;



-- ==========================  Yeu Cau 1 ===================================---

--// Cau 9 \\ --

-- Tài khoản nhân viên: Đưa ra thông tin gồm mã điện thoại,
-- tên điện thoại, tổng số cửa hàng còn hàng của những điện thoại 
-- có giá tiền dưới 20 triệu.
SELECT A.MADT, TENDT, COUNT(MACH)
FROM (  SELECT MACH, DT2.MADT, TENDT
        FROM CH2.DIENTHOAI DT2, CH2.KHOHANG_NVBH NVBH2
        WHERE DT2.MADT = NVBH2.MADT AND TINHTRANG ='Con hang' AND GIATIEN < 20000000
        UNION
        SELECT MACH, DT1.MADT, TENDT
        FROM CH1.DIENTHOAI@nv2_dblink DT1, CH1.KHOHANG_NVBH@nv2_dblink NVBH1
        WHERE DT1.MADT = NVBH1.MADT AND TINHTRANG ='Con hang' AND GIATIEN < 20000000) A 
GROUP BY A.MADT, TENDT;

--// Cau 10 \\ --

-- Tài khoản trưởng cửa hàng: Tìm thông tin điện thoại gồm mã điện thoại, 
-- tên điện thoại, tổng số lượng bán được của điện thoại bán chạy nhất 
-- tại cửa hàng mình quản lý

SELECT CT.MADT, TENDT, SUM(SOLUONG)  
FROM CH2.DIENTHOAI DT, CH2.CTHD CT 
WHERE CT.MADT = DT.MADT 
GROUP BY CT.MADT, TENDT 
HAVING SUM(SOLUONG) >= ALL (SELECT SUM(SOLUONG) FROM CH2.CTHD GROUP BY MADT);




























