ALTER USER CH2 QUOTA UNLIMITED ON USERS;
ALTER SESSION SET NLS_DATE_FORMAT =' DD/MM/YYYY HH24:MI:SS ';
Set serverOutput on;

-- User: Giam Doc 2

-- ==========================  Yeu Cau 2 ===================================---
ALTER USER CH2 QUOTA UNLIMITED ON USERS;
ALTER SESSION SET NLS_DATE_FORMAT =' DD/MM/YYYY HH24:MI:SS ';
Set serverOutput on;
-- ================
--|| PROCEDURE 1  ||
-- ================

-- Cap nhat CTHD --
CREATE OR REPLACE PROCEDURE PROC_THEMCTHD
(V_MAHOADON  varchar2, V_MaDT  varchar2, V_SoLuong  NUMBER)
AS
     V_isExitsInvoiceDetail varchar2(10);
     V_oldQuantity NUMBER;
     V_newcount NUMBER; 
BEGIN
	SELECT MaHD, SoLuong INTO V_isExitsInvoiceDetail, V_oldQuantity
	FROM CH2.CTHD 
	WHERE MaHD = V_MAHOADON AND MaDT = V_MaDT;
    BEGIN
         V_newcount := V_oldQuantity + V_SoLuong;
        IF(V_newcount>0) THEN
            UPDATE CH2.CTHD SET SoLuong = SoLuong + V_SoLuong
            WHERE MaDT = V_MaDT AND MaHD = V_MAHOADON ;
        ELSE
            DELETE CH2.CTHD  WHERE MaDT = V_MaDT AND MaHD = V_MAHOADON;
        END IF;
        DBMS_OUTPUT.PUT_LINE ('CAP NHAT SO LUONG THANH CONG');
    END;   
     EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
        IF (V_SoLuong>0) THEN
         INSERT INTO CH2.CTHD (MaHD, MaDT, SoLuong)
            VALUES (V_MAHOADON, V_MaDT, V_SoLuong);
        DBMS_OUTPUT.PUT_LINE ('THEM MOI THANH CONG');
        ELSE
            DBMS_OUTPUT.PUT_LINE ('THEM MOI THAT BAI');
        END IF;
COMMIT;
END;

-- // CALL PROCEDURE 1 \\ --
DECLARE
    V_MAHOADON varchar2(10) := 'HD25' ;
    V_MaDT VARCHAR2(10) := 'Phone43';
    V_SoLuong NUMBER(2) := 1;
BEGIN
    PROC_THEMCTHD(V_MAHOADON,V_MaDT,V_SoLuong);
END;

SELECT * FROM CH2.CTHD WHERE MaHD='HD24';

------------------------------------------------------------------------------
-- ================
--|| PROCEDURE 2  ||
-- ================

-- TK NV: Dua ra thong tin dien thoai co mau Purple o tat ca cua hang. --

CREATE OR REPLACE PROCEDURE PROC_FINDCOLOR(v_Color varchar2)
AS
BEGIN
    FOR item IN
    (SELECT DT1.MADT, DT1.TENDT, DT1.GIATIEN, NVBH1.TINHTRANG,NVBH1.MACH 
    FROM CH2.DIENTHOAI DT1  JOIN CH2.KHOHANG_NVBH NVBH1
        ON DT1.MADT = NVBH1.MADT
    WHERE MAUSAC = v_color 
    GROUP BY DT1.MADT, DT1.TENDT, DT1.GIATIEN, NVBH1.TINHTRANG,NVBH1.MACH
    UNION
    SELECT DT2.MADT, DT2.TENDT, DT2.GIATIEN, NVBH2.TINHTRANG, NVBH2.MACH 
    FROM CH2.DIENTHOAI@giamdoc1_dblink DT2 JOIN CH2.KHOHANG_NVBH@giamdoc1_dblink NVBH2 
        ON DT2.MADT = NVBH2.MADT 
    WHERE MAUSAC = v_color 
    GROUP BY DT2.MADT, DT2.TENDT, DT2.GIATIEN, NVBH2.TINHTRANG, NVBH2.MACH  )
    
    LOOP
    DBMS_OUTPUT.PUT_LINE('MADT = ' || item.MADT || ', Ten DT = ' || item.TENDT
    ||', Gia Tien = '||item.GiaTien ||', Tinh Trang = '||item.TinhTrang 
    ||', Cua Hang = '||item.MACH);
    END LOOP;
END;

--// CALL PROCEDURE 2 \\--

DECLARE 
 V_Color varchar2(10) := 'Purple' ;
BEGIN
    PROC_FINDCOLOR(V_Color);
END;

------------------------------------------------------------------------------
-- ================
--||   FUNCTION   ||
-- ================

CREATE OR REPLACE FUNCTION TinhTongTien(v_MaHD varchar2)
RETURN NUMBER
AS
    V_TONGTIEN NUMBER;
BEGIN
   SELECT SUM(CT.SOLUONG * DT.GIATIEN)  INTO V_TONGTIEN
    FROM CH2.CTHD CT JOIN CH2.DIENTHOAI DT ON CT.MADT = DT.MADT
    WHERE MAHD = v_MaHD;
    RETURN V_TONGTIEN;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    RETURN NULL;
END;

--// CALL FUNCTION 1  \\--
 
DECLARE 
 V_MAHD VARCHAR2(10) := 'HD24' ;
 V_TONGTIEN NUMBER ;
BEGIN
    V_TONGTIEN :=TinhTongTien(V_MAHD);
    DBMS_OUTPUT.PUT_LINE('TONG TIEN = ' || V_TONGTIEN );
END;

--// CHECK FUNCTION 1  \\--
    SELECT *
    FROM CH2.CTHD CT JOIN CH2.DIENTHOAI DT ON CT.MADT = DT.MADT
    WHERE MAHD = 'HD24'
------------------------------------------------------------------------------
-- ================
--||   TRIGGER   ||
-- ================

CREATE OR REPLACE TRIGGER Insert_Update_KhoHang
AFTER INSERT OR UPDATE OF SOLUONG
ON CH2.KHOHANG_QLKHO
FOR EACH ROW 
BEGIN
    CASE
        WHEN UPDATING ('SoLuong') THEN
            IF(:NEW.SoLuong>0) THEN 
                UPDATE CH2.KHOHANG_NVBH
                SET TinhTrang = 'Con hang' 
                WHERE MaCH = :NEW.MaCH AND MaDT=:NEW.MaDT;  
            ELSIF (:NEW.SoLuong<=0) THEN 
                UPDATE CH2.KHOHANG_NVBH
                SET TinhTrang = 'Het hang' 
                WHERE MaCH = :NEW.MaCH AND MaDT=:NEW.MaDT;  
            END IF;
        WHEN INSERTING THEN
            IF(:NEW.SoLuong>0) THEN 
                INSERT INTO CH2.KHOHANG_NVBH VALUES
                (:NEW.MaCH, :NEW.MaDT,'Con hang');
            ELSIF (:NEW.SoLuong<=0) THEN 
               INSERT INTO CH2.KHOHANG_NVBH VALUES
              (:NEW.MaCH, :NEW.MaDT,'Het hang');
            END IF;
    END CASE;
END;

COMMIT;
---------
DROP TRIGGER GIAMDOC1.INSERT_UPDATE_KHOHANG
---------
--// CHECK TRIGGER  \\--
INSERT INTO CH2.KHOHANG (MACH, MADT, SOLUONG, NGAYNHAPKHO) VALUES ('CH02','Phone04',10,'07/12/2021');
INSERT INTO CH2.KHOHANG (MACH, MADT, SOLUONG, NGAYNHAPKHO) VALUES ('CH02','Phone11',0,'07/12/2021');

UPDATE CH2.KHOHANG SET SOLUONG = SOLUONG - 10 Where MaCH ='CH02'AND MaDT='Phone04'
UPDATE CH2.KHOHANG SET SOLUONG = SOLUONG + 11 Where MaCH ='CH02'AND MaDT='Phone11'


-- ==========================  Yeu Cau 3 ===================================---
--                        ====================
--                      ||   Non-repeatable   ||
--                        ====================

-- // TH1: READ COMMITTED
Set serverOutput on;

Commit;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED Name 'May2_VD1';

SELECT * FROM CH2.DIENTHOAI;

--- PROCEDURE SLEEP

CREATE OR REPLACE PROCEDURE sleep (in_time number)

IS

 v_now date;

BEGIN

 SELECT SYSDATE

 INTO v_now

 FROM DUAL;


 LOOP

 EXIT WHEN v_now + (in_time * (1/86400)) <= SYSDATE;

 END LOOP;

end;

CREATE OR REPLACE PROCEDURE SELECT_DIENTHOAI(in_time IN number)
IS 
BEGIN
    DBMS_OUTPUT.PUT_LINE('Truy Van lan 1');
    FOR item IN
    (
     SELECT DT.MaDT, DT.GiaTien FROM CH2.DIENTHOAI DT WHERE ThuongHieu='Apple'
    )
    LOOP
    DBMS_OUTPUT.PUT_LINE('MADT = ' || item.MADT 
    ||',Gia Tien ='||item.GiaTien);
    END LOOP;
    sleep (in_time);
    DBMS_OUTPUT.PUT_LINE('Dung 5s');
      DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('Truy Van lan 2');
     FOR item2 IN
    (
     SELECT DT.MaDT, DT.GiaTien FROM CH2.DIENTHOAI DT WHERE ThuongHieu='Apple'
    )
     LOOP
    DBMS_OUTPUT.PUT_LINE('MADT = ' || item2.MADT 
    ||',Gia Tien ='||item2.GiaTien);
    END LOOP;    
Commit;   
END;


BEGIN
 SELECT_DIENTHOAI(10);
END;


-- // TH2: SERIALIZABLE 

COMMIT;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE Name 'May2_VD2';

BEGIN
 SELECT_DIENTHOAI(10);
END;

SELECT * FROM CH2.DIENTHOAI;

-------------------------------------------------------------------------------

--                        ====================
--                       ||   Phantom Read   ||
--                        ====================

-- // TH1: READ COMMITTED
Commit;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED Name 'May2_VD3';


CREATE OR REPLACE PROCEDURE INSERT_SMARTPHONE
(V_MaDT VARCHAR2,V_TenDT VARCHAR2,V_MauSac VARCHAR2,V_DungLuong VARCHAR2,
V_GiaTien NUMBER,V_ThuongHieu VARCHAR2)

AS

BEGIN
    INSERT INTO CH2.DIENTHOAI 
    VALUES (V_MaDT,V_TenDT,V_MauSac,V_DungLuong,V_GiaTien,V_ThuongHieu);
 
    INSERT INTO CH2.KHOHANG_QLKHO 
    VALUES ('CH02',V_MaDT,100,'07/12/2021');
    
    INSERT INTO CH2.KHOHANG_NVBH 
    VALUES ('CH02',V_MaDT,'Con hang');
    
    INSERT INTO CH1.DIENTHOAI@ch2_dblink
    VALUES (V_MaDT,V_TenDT,V_MauSac,V_DungLuong,V_GiaTien,V_ThuongHieu);
 
    INSERT INTO CH1.KHOHANG_QLKHO@ch2_dblink
    VALUES ('CH01',V_MaDT,100,'07/12/2021');
    
    INSERT INTO CH1.KHOHANG_NVBH@ch2_dblink
    VALUES ('CH01',V_MaDT,'Con hang');
COMMIT;
END;

DECLARE
    V_MaDT VARCHAR2(50) :='Phone60';
    V_TenDT VARCHAR2(50) :='VPhone';
    V_MauSac VARCHAR2(50) := 'Black';
    V_DungLuong VARCHAR2(50) := '128GB';
    V_GiaTien NUMBER := 6000000;
    V_ThuongHieu VARCHAR2(50) := 'BKAV';
    
BEGIN
     INSERT_SMARTPHONE(V_MaDT ,V_TenDT ,V_MauSac ,V_DungLuong ,
V_GiaTien ,V_ThuongHieu );
END;


SELECT * FROM CH2.DIENTHOAI;

------------------------------------
INSERT INTO CH2.DIENTHOAI@giamdoc1_dblink
VALUES (V_MaDT,V_TenDT,V_MauSac,V_DungLuong,V_GiaTien,V_ThuongHieu);
    
INSERT INTO CH2.KHOHANG_QLKHO@giamdoc1_dblink 
VALUES ('CH01',V_MaDT,100,'07/12/2021');

    
-----------------------------------
-- // TH2: SERIALIZABLE 

COMMIT;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE Name 'May2_VD3';

DECLARE
    V_MaDT VARCHAR2(50) :='Phone61';
    V_TenDT VARCHAR2(50) :='VPhone';
    V_MauSac VARCHAR2(50) := 'Black';
    V_DungLuong VARCHAR2(50) := '128GB';
    V_GiaTien NUMBER := 6000000;
    V_ThuongHieu VARCHAR2(50) := 'BKAV';
    
BEGIN
     INSERT_SMARTPHONE(V_MaDT ,V_TenDT ,V_MauSac ,V_DungLuong ,
V_GiaTien ,V_ThuongHieu );
END;
--==============================================================================
--                        ====================
--                       ||   Lost Update    ||
--                        ====================

-- // TH1: READ COMMITTED
COMMIT;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED Name 'May2_VD5';

SELECT * FROM CH2.DIENTHOAI WHERE ThuongHieu ='Vivo' ;

CREATE OR REPLACE PROCEDURE Update_Price3(v_Money Number,v_Name varchar2)
AS
    CURSOR cur_trans IS SELECT MaDT, GiaTien
                     FROM CH1.DIENTHOAI@ch2_dblink
                     WHERE ThuongHieu = v_Name;     
     r_trans cur_trans%ROWTYPE;
BEGIN   
    OPEN cur_trans;
         LOOP
         FETCH cur_trans INTO r_trans;
         EXIT WHEN cur_trans%NOTFOUND;
         UPDATE CH1.DIENTHOAI@ch2_dblink SET  GiaTien = v_Money
         WHERE  MaDT = r_trans.MaDT;
    END LOOP;
    COMMIT;
END;

BEGIN
 Update_Price3(1111111,'Vivo');
END;




-- // TH2: SERIALIZABLE 
COMMIT;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE Name 'May2_VD6';


BEGIN
 Update_Price3(888888,'Vivo');
END;


--- ==========================  Yeu Cau 4 ===================================---

  -- ====================================================
--||   Câu truy vấn đã tối ưu trong môi trường phân tán  ||
-- ======================================================

Select /*+ GATHER_PLAN_STATISTICS */ TenKH, TenDT, MauSac,SoLuong
From (Select MaHD, MaNV, MaKH From CH2.HoaDon Where 
NgayHD = '01/11/2021') HD JOIN 
(Select MaNV From CH2.NhanVien Where TenNV = 'Nhat') NV ON 
NV.MaNV = HD.MaNV JOIN (Select * From CH2.CTHD) CTHD ON CTHD.MaHD = HD.MaHD 
JOIN (Select MaKH, TenKH From CH2.KhachHang) KH ON KH.MaKH=HD.MaKH 
JOIN (Select MaDT, TenDT, MauSac From CH2.DienThoai) DT ON DT.MaDT = CTHD.MaDT;























