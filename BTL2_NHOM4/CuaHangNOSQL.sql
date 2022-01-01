Drop TABLE  DIENTHOAI;
Drop TABLE  CUAHANG;
Drop TABLE  KHOHANG_QLKHO;
Drop TABLE  KHOHANG_NVBH;
Drop TABLE  NHANVIEN ;
Drop TABLE  HOADON ;
Drop TABLE  CTHD ;
Drop TABLE  KHACHHANG ;
---------------------
CREATE TABLE DIENTHOAI 
(
    MaDT text ,
    TenDT text,
    MauSac text,
    DungLuong text,
    GiaTien int,
    ThuongHieu text,
    PRIMARY KEY(ThuongHieu,MaDT,TenDT)
);

CREATE TABLE CUAHANG
(
    MaCH text ,
    TenCH text,
    SoDT text,
 PRIMARY KEY(MaCH)
    
);

CREATE TABLE NHANVIEN 
(
    MaNV text,
    TenNV text,
    DiaChi  text,
    SoDT text,
    Luong INT,
    MaCH text,
   PRIMARY KEY(TenNV,Luong,MaNV)
);

CREATE TABLE KHACHHANG
(
    MaKH text,
    TenKH text,
    DiaChi text,
    SoDT text,
    PRIMARY KEY(TenNV,Luong,MaNV)
);

CREATE TABLE HOADON 
(
    MaHD text,
    MaNV text,
    MaKH text, 
    MaCH text,
    NgayHD TEXT,
    ThanhTien INT,
    PRIMARY KEY(NgayHD,MaHD)
    
);

CREATE TABLE CTHD 
(
    MaHD text,
    MaDT text,
    SoLuong Int, 
    PRIMARY KEY(MaHD,MaDT)
);

---------------------------------------------

INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone01','Iphone 12','Black','64GB',18290000,'Apple');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone02','Iphone 12','Red','64GB',18290000,'Apple');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone03','Iphone 12','Blue','64GB',18290000,'Apple');
INSERT INTO   DIENTHOAI(madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone04','Iphone 12','White','64GB',18290000,'Apple');

INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone05','Iphone 12','Black','128GB',19590000,'Apple');
INSERT INTO   DIENTHOAI(madt,tendt, mausac,DungLuong,giatien,thuonghieu) VALUES ('Phone06','Iphone 12','Red','128GB',19590000,'Apple');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone07','Iphone 12','Blue','128GB',19590000,'Apple');
INSERT INTO   DIENTHOAI(madt,tendt, mausac,DungLuong,giatien,thuonghieu) VALUES ('Phone08','Iphone 12','White','128GB',19590000,'Apple');

INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone09','Iphone 12','Black','256GB',22390000,'Apple');
INSERT INTO   DIENTHOAI(madt,tendt, mausac,DungLuong,giatien,thuonghieu) VALUES ('Phone10','Iphone 12','Red','256GB',22390000,'Apple');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone11','Iphone 12','Blue','256GB',22390000,'Apple');

INSERT INTO   DIENTHOAI(madt,tendt, mausac,DungLuong,giatien,thuonghieu) VALUES ('Phone12','Iphone 13','Midnight','64GB',21590000,'Apple');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone13','Iphone 13','Red','64GB',21590000,'Apple');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone14','Iphone 13','Blue','64GB',21590000,'Apple');

INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone15','Iphone 13','Midnight','128GB',24190000,'Apple');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone16','Iphone 13','Red','128GB',24190000,'Apple');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone17','Iphone 13','Blue','128GB',24190000,'Apple');

INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone18','Iphone 13','Midnight','256GB',29490000,'Apple');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone19','Iphone 13','Red','256GB',29490000,'Apple');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone20','Iphone 13','Blue','256GB',29490000,'Apple');

INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone21','Samsung Galaxy Z Fold3 5G','Black','256GB',41999000,'Samsung');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone22','Samsung Galaxy Z Fold3 5G','Grey','256GB',41999000,'Samsung');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone23','Samsung Galaxy Z Fold3 5G','Blue','256GB',41999000,'Samsung');

INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone24','Samsung Galaxy Z Fold3 5G','Black','512GB',45000000,'Samsung');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone25','Samsung Galaxy Z Fold3 5G','Grey','512GB',45000000,'Samsung');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone26','Samsung Galaxy Z Fold3 5G','Blue','512GB',45000000,'Samsung');

INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone27','Samsung Galaxy Z Flip3 5G','Black ','128GB',24990000,'Samsung');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone28','Samsung Galaxy Z Flip3 5G','Blue','128GB',24990000,'Samsung');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone29','Samsung Galaxy Z Flip3 5G','White','128GB',24990000,'Samsung');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone30','Samsung Galaxy Z Flip3 5G','Purple','128GB',24990000,'Samsung');

INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone31','Samsung Galaxy Z Flip3 5G','Black','256GB',26990000,'Samsung');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone32','Samsung Galaxy Z Flip3 5G','Blue','256GB',26990000,'Samsung');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone33','Samsung Galaxy Z Flip3 5G','White','256GB',26990000,'Samsung');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone34','Samsung Galaxy Z Flip3 5G','Purple','256GB',26990000,'Samsung');

INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone35','Samsung Galaxy A22','Purple','128GB',5390000,'Samsung');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone36','Samsung Galaxy A22','Black','128GB',5390000,'Samsung');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone37','Samsung Galaxy A22','Green','128GB',5390000,'Samsung');

INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone38','Xiaomi 11T 5G','Blue','128GB',5390000,'Xiaomi');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone39','Xiaomi 11T 5G','White','128GB',5390000,'Xiaomi');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone40','Xiaomi 11T 5G','Grey','128GB',5390000,'Xiaomi');

INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone41','Vsmart Aris','Blue','128GB',4490000,'Vsmart');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone42','Vsmart Aris','Grey','128GB',4490000,'Vsmart');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone43','Vsmart Aris','Green','128GB',4490000,'Vsmart');

INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone44','Vsmart Aris Pro','Grey','128GB',5150000,'Vsmart');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone45','Vsmart Aris Pro','Green','128GB',5150000,'Vsmart');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone46','Vsmart Aris Pro','Copper','128GB',5150000,'Vsmart');

INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone47','Vivo Y21s','Midnight','128GB',5480000,'Vivo');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone48','Vivo Y21s','White','128GB',5480000,'Vivo');

INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone49','OPPO Reno6 5G','Black','128GB',12990000,'Oppo');
INSERT INTO   DIENTHOAI (madt,tendt, mausac,DungLuong,giatien,thuonghieu)VALUES ('Phone50','OPPO Reno6 5G','Grey','128GB',12990000,'Oppo');



-- 2/ CUA HANG
DELETE FROM   CUAHANG;

INSERT INTO   CUAHANG (mach,tench,sodt)VALUES ('CH01','QUAN 1, TPHCM','09494499969');
INSERT INTO   CUAHANG (mach,tench,sodt)VALUES ('CH02','QUAN BA DINH, HA NOI','0995596624');

-- 2/ KHACH HANG
DELETE FROM   KHACHHANG;

INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH01','Nguyen Minh Quan','QUAN 1, TPHCM','09494499969');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH02','Le Minh Triet','QUAN 2, TPHCM','0995596624');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH03','Hoang Minh Nam Phuong','QUAN 3, TPHCM','09822343455');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH04','Dao Minh Duc','QUAN 4, TPHCM','0936934644');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH05','Pham Thi Thao Nhi','QUAN 5, TPHCM','0944924928');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH06','Vu My Ngoc','QUAN 6, TPHCM','09494499969');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH07','Do Quang Vinh','QUAN 7, TPHCM','0949821299');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH08','Nguyen Truong Hoang Nam','QUAN 8, TPHCM','09494499969');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH09','Nguyen Phan Bao Chau','QUAN 9, TPHCM','0982999343');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH10','Nguyen Le Nhat Vy','QUAN 10, TPHCM','0998555312');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH11','Nguyen Thai Bao Ngoc','QUAN 11, TPHCM','09494499969');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH12','Truong Gia Bao','QUAN 12, TPHCM','0938241489');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH13','Ngo Manh Hung','QUAN TAN BINH, TPHCM','0982991868');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH14','Bui Nguyen Trung Thanh','QUAN BINH TAN, TPHCM','09494499969');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH15','Ngac Bao Vinh','QUAN BINH THANH, TPHCM','0949165339');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH16','Phan Bao Chau','QUAN GO VAP, TPHCM','09494499969');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH17','Tran Nguyen Phuoc Tai','QUAN PHU NHUAN, TPHCM','09528392386');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH18','Tran An Nguyen','QUAN TAN PHU, TPHCM','0993394146');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH19','Huynh Hoang Bao Ngoc','QUAN THU DUC, TPHCM','09528392386');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH20','Nguyen Tran Yen Nhi','HUYEN BINH CHANH, TPHCM','09494499969');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH21','Pham Hoang Vinh','HUYEN CAN GIO, TPHCM','09494499969');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH22','Tran Ngoc Vu','HUYEN CU CHI, TPHCM','0994193243');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH23','Tran Dang Khoa','HUYEN HOC MON, TPHCM','0942244615');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH24','Nguyen Thien An','HUYEN NHA BE, TPHCM','0989968144');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH25','Le Vo Ngoc Nhi','QUAN HOAN KIEM, HA NOI','0993362892');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH26','Pham Quang Huy','QUAN DONG DA, HA NOI','09499594949');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH27','Chu Minh Duc','QUAN BA DINH, HA NOI','0992426225');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH28','Nguyen Thanh Dat','QUAN HAI BA TRUNG, HA NOI','09528392386');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH29','Phung Duc Thien','QUAN HOANG MAI, HA NOI','09528392386');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH30','Dang Ngoc Anh Thi','QUAN THANH XUAN, HA NOI','09494499969');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH31','Lai Mai Thanh Thao','QUAN LONG BIEN, HA NOI','09834525696');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH32','Tran Do Hoang Long','QUAN NAM TU LIEM, HA NOI','0944899489');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH33','Banh Gia Linh','QUAN BAC TU LIEM, HA NOI','09494499969');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH34','Bui Quang Huy','QUAN TAY HO, HA NOI','0946924915');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH35','Nguyen Dac Hong Anh','QUAN CAU GIAY, HA NOI','0993916948');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH36','Le Hana','QUAN HA DONG, HA NOI','09364632242');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH37','Pham Thi Bao Tram','THI XA SON TAY, HA NOI','0931441445');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH38','Nguyen Gia Huy','HUYEN BA VI, HA NOI','0935116895');

INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH39','To Dinh Gia Bao','HUYEN CHUONG MY, HA NOI','09528392386');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH40','Mai Hieu Minh','HUYEN PHUC THO, HA NOI','09494499969');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH41','Tran Ninh Khang','HUYEN DAN PHUONG, HA NOI','09528392386');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH42','Nguyen Van Thanh Binh','HUYEN DONG ANH, HA NOI','09494499969');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH43','Huynh Vo Tri Nhan','HUYEN GIA LAM, HA NOI','0983154412');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH44','Hoang Diep Anh','HUYEN HOAI DUC, HA NOI','0991958924');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH45','Cao Ba Ngoc','HUYEN ME LINH, HA NOI','0933223832');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH46','Phan Tam An','HUYEN MY DUC, HA NOI','0995949124');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH47','Vo Minh Thanh','HUYEN PHU XUYEN, HA NOI','09898699925');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH48','Huynh Thai Son','HUYEN QUOC OAI, HA NOI','0966486839');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH49','Nguyen Khanh Trinh','HUYEN SOC SON, HA NOI','09528392386');
INSERT INTO   KHACHHANG (makh,tenkh,diachi,sodt)VALUES ('KH50','Pham Ngoc Hai','HUYEN THACH THAT,HA NOI','09528392386');



--- 4/ Nhan Vien

INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV01','Dao Thi Hong Ngoc','QUAN 1, TPHCM','09494499969',6300000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV02','Ngo Thi Hong Anh','QUAN 1, TPHCM','0995596624',4000000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV03','Nguyen Thi Kim Anh','QUAN 2, TPHCM','09822343455',5000000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV04','Nguyen Hoang Mai Khoi','QUAN 2, TPHCM','0936934644',6500000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV05','Tran Vu An Nhien','QUAN 2, TPHCM','0944924928',16000000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV06','Le Huynh','QUAN 6, TPHCM','09494499969',16600000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV07','Nguyen Dang Khoa','QUAN 7, TPHCM','0949821299',6000000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV08','Nguyen Hoang Minh Quan','QUAN 8, TPHCM','09494499969',6000000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV09','Pham Thi Thanh Truc','QUAN 9, TPHCM','0982999343',5900000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV10','Nguyen Minh Cuong','QUAN 10, TPHCM','0998555312',5900000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV11','Bui Thanh Trang','QUAN 11, TPHCM','09494499969',5900000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV12','Banh Van Tran Phat','QUAN 12, TPHCM','0938241489',5900000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV13','Tran Gia Han','QUAN TAN BINH, TPHCM','0982991868',4200000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV14','Pham Khanh Han','QUAN BINH TAN, TPHCM','09494499969',4200000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV15','Nguyen Huu Cuong','QUAN BINH THANH, TPHCM','0949165339',4200000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV16','Nguyen Anh Tuan','QUAN GO VAP, TPHCM','09494499969',4200000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV17','Tran Doan Kim Ngan','QUAN PHU NHUAN, TPHCM','09528392386',7500000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV18','Duong Minh Khang','QUAN TAN PHU, TPHCM','0993394146',7500000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV19','Hoang Tran Bao Long','QUAN THU DUC, TPHCM','09528392386',7500000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV20','Le Nhat Nam','HUYEN BINH CHANH, TPHCM','09494499969',7500000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV21','Dinh Nguyen Kim Anh','HUYEN CAN GIO, TPHCM','09494499969',7500000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV22','Le Gia Huy','HUYEN CU CHI, TPHCM','0994193243',8000000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV23','Le Trinh Hoang Phat','HUYEN HOC MON, TPHCM','0942244615',8000000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV24','Cao Tran Nam Anh','HUYEN NHA BE, TPHCM','0989968144',8000000,'CH01');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV25','Phan To Nhu','QUAN HOAN KIEM, HA NOI','0993362892',6100000,'CH01');


INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV26','Ngo Le Khoi Nguyen','QUAN DONG DA, HA NOI','09499594949',6100000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV27','Huynh My Yen','QUAN BA DINH, HA NOI','0992426225',6100000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV28','Truong Tuyet Anh','QUAN HAI BA TRUNG, HA NOI','09528392386',6100000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV28','Nguyen Minh Nhat','QUAN HOANG MAI, HA NOI','09528392386',6100000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV29','Nhat','QUAN HOANG MAI, HA NOI','09528392386',6100000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV30','Doan Dac Phuc','QUAN THANH XUAN, HA NOI','09494499969',7000000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV31','Nguyen Nguyen Bao Ngoc','QUAN LONG BIEN, HA NOI','09834525696',7000000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV32','Pham Ngoc Quynh Huong','QUAN NAM TU LIEM, HA NOI','0944899489',7000000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV33','Thai Ha Linh','QUAN BAC TU LIEM, HA NOI','09494499969',7000000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV34','Pham Ngoc Minh','QUAN TAY HO, HA NOI','0946924915',7000000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV35','Nguyen Hong Minh','QUAN CAU GIAY, HA NOI','0993916948',6000000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV36','Le Duong','QUAN HA DONG, HA NOI','09364632242',6000000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV37','Phan Bao Tram','THI XA SON TAY, HA NOI','0931441445',6000000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV38','Phan Gia Huy','HUYEN BA VI, HA NOI','0935116895',6000000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV39','Gia Bao','QUAN GO VAP, TPHCM','09528392386',6000000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV40','Ha Minh Phat','QUAN GO VAP, TPHCM','09494499969',6000000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV41','Tran Minh Phat','QUAN GO VAP, TPHCM','09528392386',6000000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV42','Nguyen Van Binh','QUAN GO VAP, TPHCM','09494499969',6000000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV43','Vo Thi Tra My','QUAN GO VAP, TPHCM','0983154412',6000000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV44','Nguyen Le Kim Khanh','QUAN GO VAP, TPHCM','0991958924',6000000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV45','Phan Minh Huy','QUAN GO VAP, TPHCM','0933223832',6000000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV46','Truong Thanh Tai','QUAN 12, TPHCM','0995949124',6000000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV47','Vo Minh Quan','QUAN 12, TPHCM','09898699925',6000000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV48','Dang Thai Son','QUAN 12, TPHCM','0966486839',6000000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV49','Cao Pham Khanh Mai','QUAN 12, TPHCM','09528392386',6000000,'CH02');
INSERT INTO   NHANVIEN (manv,tennv,diachi,sodt,luong, mach )VALUES ('NV50','Ho Khanh Thi','QUAN 12, TPHCM','09528392386',6000000,'CH02');



-- 7/ HOADON -- 
DELETE FROM  HOADON;

INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD01','NV01','KH01','CH01','30/10/2021',22390000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD02','NV01','KH01','CH01','30/10/2021',44780000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,ThanhTien) VALUES ('HD03','NV01','KH02','CH01','30/10/2021',21590000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD04','NV05','KH03','CH01','30/10/2021',64770000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD05','NV10','KH04','CH01','30/10/2021',24190000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD06','NV15','KH06','CH01','30/10/2021',24190000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD07','NV24','KH08','CH01','30/10/2021',29490000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD08','NV03','KH10','CH01','30/10/2021',41999000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD09','NV04','KH11','CH01','30/10/2021',90000000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD10','NV06','KH12','CH01','30/10/2021',90000000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD11','NV07','KH15','CH01','31/10/2021',49980000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD12','NV20','KH18','CH01','31/10/2021',74970000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD13','NV01','KH20','CH01','31/10/2021',80970000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien)VALUES ('HD14','NV01','KH21','CH01','31/10/2021',26990000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien)VALUES ('HD15','NV01','KH22','CH01','31/10/2021',26990000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD16','NV01','KH22','CH01','01/11/2021',5480000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD17','NV01','KH22','CH01','01/11/2021',5480000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD18','NV01','KH30','CH01','01/11/2021',5390000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien)VALUES ('HD19','NV01','KH32','CH01','01/11/2021',22390000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD20','NV01','KH33','CH01','07/11/2021',22390000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD21','NV01','KH43','CH01','07/11/2021',4490000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD22','NV01','KH44','CH01','07/11/2021',4490000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien)VALUES ('HD23','NV01','KH45','CH01','07/11/2021',4490000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD24','NV01','KH46','CH01','07/11/2021',4490000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD25','NV01','KH47','CH01','07/11/2021',4490000);

INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien)VALUES ('HD26','NV27','KH04','CH02','30/10/2021',18290000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien)VALUES ('HD27','NV27','KH05','CH02','30/10/2021',36580000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien)VALUES ('HD28','NV32','KH06','CH02','30/10/2021',18290000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD29','NV35','KH08','CH02','30/10/2021',58770000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien)VALUES ('HD30','NV42','KH08','CH02','30/10/2021',19590000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD31','NV44','KH09','CH02','30/10/2021',19590000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD32','NV29','KH09','CH02','30/10/2021',22390000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD33','NV30','KH10','CH02','30/10/2021',21590000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD34','NV30','KH12','CH02','30/10/2021',43180000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD35','NV30','KH12','CH02','30/10/2021',36580000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD36','NV32','KH14','CH02','31/10/2021',36580000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD37','NV46','KH17','CH02','31/10/2021',54870000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD38','NV43','KH20','CH02','31/10/2021',72570000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD39','NV50','KH21','CH02','31/10/2021',24190000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD40','NV26','KH24','CH02','31/10/2021',24190000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD41','NV26','KH24','CH02','01/11/2021',24190000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD42','NV29','KH25','CH02','01/11/2021',24190000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD43','NV38','KH31','CH02','01/11/2021',29490000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD44','NV39','KH34','CH02','01/11/2021',41999000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD45','NV40','KH35','CH02','07/11/2021',41999000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD46','NV44','KH40','CH02','07/11/2021',26990000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD47','NV33','KH41','CH02','07/11/2021',26990000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD48','NV35','KH42','CH02','07/11/2021',5390000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD49','NV35','KH43','CH02','07/11/2021',5390000);
INSERT INTO  HOADON (mahd,manv,makh,mach,ngayhd,thanhtien) VALUES ('HD50','NV37','KH44','CH02','07/11/2021',5390000);

-- 8/ CTHD 
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD01','Phone09',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD02','Phone10',02);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD03','Phone12',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD04','Phone14',03);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD05','Phone16',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD06','Phone17',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD07','Phone18',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD08','Phone22',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD09','Phone25',02);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD10','Phone26',02);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD11','Phone27',02);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD12','Phone30',03);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD13','Phone31',03);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD14','Phone32',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD15','Phone34',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD16','Phone47',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD17','Phone48',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD18','Phone40',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD19','Phone09',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD20','Phone10',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD21','Phone41',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD22','Phone41',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD23','Phone42',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD24','Phone42',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD25','Phone42',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD16','Phone48',03);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD26','Phone01',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD27','Phone02',02);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD28','Phone04',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD29','Phone05',03);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD30','Phone07',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD31','Phone08',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD32','Phone09',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD33','Phone12',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD34','Phone14',02);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD35','Phone01',02);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD36','Phone01',02);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD37','Phone02',03);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD38','Phone15',03);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD39','Phone15',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD40','Phone15',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD41','Phone17',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD42','Phone17',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD43','Phone20',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD44','Phone21',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD45','Phone23',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD46','Phone32',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD47','Phone33',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD48','Phone35',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD49','Phone35',01);
INSERT INTO  CTHD (mahd,madt,soluong) VALUES ('HD50','Phone35',01);

COMMIT;

-- Câu 1: Tìm Nhân Viên ở CH1 có mức lương trên 7 triệu

Use CH1;
SELECT * FROM NhanVien where luong>7000000 ALLOW FILTERING;

-- Câu 2: Tìm những điện thoại có tên là Iphone 12 và Iphone 13

select * from Dienthoai where tendt in('Iphone 12','Iphone 13');

-- Câu 3: Sắp xếp các điện thoại có TenDT= ‘Iphone 12’ giảm dần theo mã điện thoại và chỉ lấy 5 dòng dữ liệu

select * from DienThoai where tendt='Iphone 12' Order by madt desc limit 5;