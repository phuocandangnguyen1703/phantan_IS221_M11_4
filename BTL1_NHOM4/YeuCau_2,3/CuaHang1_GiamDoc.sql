-- User: Giam Doc 1 
-- ==========================  Yeu Cau 2 ===================================---
ALTER USER CH1 QUOTA UNLIMITED ON USERS;
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
	FROM CH1.CTHD 
	WHERE MaHD = V_MAHOADON AND MaDT = V_MaDT;
    BEGIN
         V_newcount := V_oldQuantity + V_SoLuong;
        IF(V_newcount>0) THEN
            UPDATE CH1.CTHD SET SoLuong = SoLuong + V_SoLuong
            WHERE MaDT = V_MaDT AND MaHD = V_MAHOADON ;
        ELSE
            DELETE CH1.CTHD  WHERE MaDT = V_MaDT AND MaHD = V_MAHOADON;
        END IF;
        DBMS_OUTPUT.PUT_LINE ('CAP NHAT SO LUONG THANH CONG');
    END;   
     EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
        IF (V_SoLuong>0) THEN
         INSERT INTO CH1.CTHD (MaHD, MaDT, SoLuong)
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

SELECT * FROM CH1.CTHD WHERE MaHD='HD24';


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
    FROM CH1.DIENTHOAI DT1  JOIN CH1.KHOHANG_NVBH NVBH1
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
    FROM CH1.CTHD CT JOIN CH1.DIENTHOAI DT ON CT.MADT = DT.MADT
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
    FROM CH1.CTHD CT JOIN CH1.DIENTHOAI DT ON CT.MADT = DT.MADT
    WHERE MAHD = 'HD24'
------------------------------------------------------------------------------
-- ================
--||   TRIGGER   ||
-- ================

CREATE OR REPLACE TRIGGER Insert_Update_KhoHang
AFTER INSERT OR UPDATE OF SOLUONG
ON CH1.KHOHANG_QLKHO
FOR EACH ROW 
BEGIN
    CASE
        WHEN UPDATING ('SoLuong') THEN
            IF(:NEW.SoLuong>0) THEN 
                UPDATE CH1.KHOHANG_NVBH
                SET TinhTrang = 'Con hang' 
                WHERE MaCH = :NEW.MaCH AND MaDT=:NEW.MaDT;  
            ELSIF (:NEW.SoLuong<=0) THEN 
                UPDATE CH1.KHOHANG_NVBH
                SET TinhTrang = 'Het hang' 
                WHERE MaCH = :NEW.MaCH AND MaDT=:NEW.MaDT;  
            END IF;
        WHEN INSERTING THEN
            IF(:NEW.SoLuong>0) THEN 
                INSERT INTO CH1.KHOHANG_NVBH VALUES
                (:NEW.MaCH, :NEW.MaDT,'Con hang');
            ELSIF (:NEW.SoLuong<=0) THEN 
               INSERT INTO CH1.KHOHANG_NVBH VALUES
              (:NEW.MaCH, :NEW.MaDT,'Het hang');
            END IF;
    END CASE;
END;

COMMIT;
---------
DROP TRIGGER GIAMDOC1.INSERT_UPDATE_KHOHANG
---------
--// CHECK TRIGGER  \\--
INSERT INTO CH1.KHOHANG (MACH, MADT, SOLUONG, NGAYNHAPKHO) VALUES ('CH01','Phone04',10,'07/12/2021');
INSERT INTO CH1.KHOHANG (MACH, MADT, SOLUONG, NGAYNHAPKHO) VALUES ('CH01','Phone11',0,'07/12/2021');

UPDATE CH1.KHOHANG SET SOLUONG = SOLUONG - 10 Where MaCH ='CH01'AND MaDT='Phone04'
UPDATE CH1.KHOHANG SET SOLUONG = SOLUONG + 11 Where MaCH ='CH01'AND MaDT='Phone11'


--- ==========================  Yeu Cau 3 ===================================---

--                        ======================
--                      ||   CHECK - ISOLATION  ||
--                        ======================
 
DECLARE 
TRANS_ID VARCHAR2(100);
BEGIN
    TRANS_ID := DBMS_TRANSACTION.LOCAL_TRANSACTION_ID( TRUE );
END;

SELECT S.SID, S.SERIAL#,
  CASE BITAND(T.FLAG, POWER(2, 28))
  WHEN 0 THEN 'READ COMMITTED'
  ELSE 'SERIALIZABLE'
  END AS ISOLATION_LEVEL
FROM V$TRANSACTION T 
JOIN V$SESSION S ON T.ADDR = S.TADDR AND S.SID = SYS_CONTEXT('USERENV', 'SID')

--// PROCEDURE SLEEP  \\--
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


--                        ====================
--                      ||   Non-repeatable   ||
--                        ====================

-- // TH1: READ COMMITTED
COMMIT;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED Name 'May1_VD1';

CREATE OR REPLACE PROCEDURE Update_Price(v_Money Number,v_Name varchar2)
AS
    CURSOR cur_trans IS SELECT MaDT, GiaTien
                     FROM CH1.DIENTHOAI
                     WHERE ThuongHieu = v_Name;     
     r_trans cur_trans%ROWTYPE;
     
     CURSOR cur_trans2 IS SELECT MaDT, GiaTien
                     FROM CH2.DIENTHOAI@giamdoc1_dblink
                     WHERE ThuongHieu = v_Name;     
     r_trans2 cur_trans%ROWTYPE;
     
BEGIN   
    OPEN cur_trans;
         LOOP
         FETCH cur_trans INTO r_trans;
         EXIT WHEN cur_trans%NOTFOUND;
         UPDATE CH1.DIENTHOAI SET  GiaTien = GiaTien + v_Money
         WHERE  MaDT = r_trans.MaDT;
    END LOOP;
    OPEN cur_trans2;
         LOOP
         FETCH cur_trans2 INTO r_trans2;
         EXIT WHEN cur_trans2%NOTFOUND;
         UPDATE CH2.DIENTHOAI@giamdoc1_dblink SET  GiaTien = GiaTien + v_Money
         WHERE  MaDT = r_trans2.MaDT;
    END LOOP;
    COMMIT;
END;

BEGIN
 Update_Price(10000,'Apple');
END;

Rollback

SELECT * FROM CH1.DIENTHOAI WHERE ThuongHieu ='Apple' ;
SELECT * FROM CH2.DIENTHOAI@giamdoc1_dblink WHERE ThuongHieu ='Apple' ;


-- // TH2: SERIALIZABLE 

COMMIT;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE NAME 'May1_VD2';

BEGIN
 Update_Price(10000,'Apple');
END;

SELECT * FROM CH1.DIENTHOAI;


-------------------------------------------------------------------------------

--                        ====================
--                       ||   Phantom Read   ||
--                        ====================

-- // TH1: READ COMMITTED
COMMIT;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED Name 'May1_VD3';

SELECT * FROM CH1.DIENTHOAI;

CREATE OR REPLACE PROCEDURE PROC_FINDCOLOR2(v_Color varchar2,in_time IN number)
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Truy Van lan 1');
    FOR item IN
    (SELECT DT1.MADT, DT1.TENDT, DT1.GIATIEN, NVBH1.TINHTRANG,NVBH1.MACH 
    FROM CH1.DIENTHOAI DT1  JOIN CH1.KHOHANG_NVBH NVBH1
        ON DT1.MADT = NVBH1.MADT
    WHERE MAUSAC = v_color ) 
    LOOP
    DBMS_OUTPUT.PUT_LINE('MADT = ' || item.MADT || ', Ten DT = ' || item.TENDT
    ||',Gia Tien ='||item.GiaTien ||',Tinh Trang ='||item.TinhTrang 
    ||',Cua Hang ='||item.MACH);
    END LOOP;
    sleep (in_time);
    DBMS_OUTPUT.PUT_LINE('Dung 5s');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('Truy Van lan 2');
    FOR item2 IN
    (SELECT DT1.MADT, DT1.TENDT, DT1.GIATIEN, NVBH1.TINHTRANG,NVBH1.MACH 
    FROM CH1.DIENTHOAI DT1  JOIN CH1.KHOHANG_NVBH NVBH1
        ON DT1.MADT = NVBH1.MADT
    WHERE MAUSAC = v_color ) 
    LOOP
    DBMS_OUTPUT.PUT_LINE('MADT = ' || item2.MADT || ', Ten DT = ' || item2.TENDT
    ||',Gia Tien ='||item2.GiaTien ||',Tinh Trang ='||item2.TinhTrang 
    ||',Cua Hang ='||item2.MACH);
    END LOOP;
COMMIT; 
END;


DECLARE 
 V_Color varchar2(10) := 'Black' ;
BEGIN
    PROC_FINDCOLOR2(V_Color,10);
END;

DELETE FROM CH1.DIENTHOAI WHERE MADT ='Phone51'

SELECT * FROM CH1.KHOHANG_NVBH WHERE MADT ='Phone53'


-- // TH2: SERIALIZABLE 
COMMIT;
 
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE Name 'May1_VD4';

SELECT * FROM CH1.DIENTHOAI;

DECLARE 
 V_Color varchar2(10) := 'Black' ;
BEGIN
    PROC_FINDCOLOR2(V_Color,10);
END;

-------------------------------------------------------------------------------

--                        ====================
--                       ||   Lost Update    ||
--                        ====================

-- // TH1: READ COMMITTED
COMMIT;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED Name 'May1_VD5';

CREATE OR REPLACE PROCEDURE Update_Price2(v_Money Number,v_Name varchar2)
AS
    CURSOR cur_trans IS SELECT MaDT, GiaTien
                     FROM CH1.DIENTHOAI
                     WHERE ThuongHieu = v_Name;     
     r_trans cur_trans%ROWTYPE;
BEGIN   
    OPEN cur_trans;
         LOOP
         FETCH cur_trans INTO r_trans;
         EXIT WHEN cur_trans%NOTFOUND;
         UPDATE CH1.DIENTHOAI SET  GiaTien = GiaTien + v_Money
         WHERE  MaDT = r_trans.MaDT;
    END LOOP;
    sleep(10);
    COMMIT;
END;

BEGIN
 Update_Price2(10000,'Vivo');
END;

SELECT * FROM CH1.DIENTHOAI WHERE ThuongHieu ='Vivo' ;


-- // TH2: SERIALIZABLE 

COMMIT;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE Name 'May1_VD6';

BEGIN
 Update_Price2(10000,'Vivo');
END;


--- ==========================  Yeu Cau 4 ===================================---






