ALTER USER CH2 QUOTA UNLIMITED ON USERS;
ALTER SESSION SET NLS_DATE_FORMAT =' DD/MM/YYYY HH24:MI:SS ';
Set serverOutput on;

-- User: Giam Doc 2
-- ==========================  Yeu Cau 2 ===================================---
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























