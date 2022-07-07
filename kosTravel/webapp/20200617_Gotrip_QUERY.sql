CREATE TABLE KOS_PLAN(
    PNUM        VARCHAR2(100)       PRIMARY KEY,
    MNUM        VARCHAR2(100)       NOT NULL,
    TNUM        VARCHAR2(100)       NOT NULL,
    PDAY        VARCHAR2(100)       NOT NULL,
    PLOCATION   VARCHAR2(2000)      NOT NULL,
    PNAME       VARCHAR2(2000)      NOT NULL,
    PMEMO       VARCHAR2(2000)      NULL,
    INSERTDATE  DATE                NOT NULL,
    UPDATEDATE  DATE                NOT NULL
);

DROP TABLE KOS_PLAN;
SELECT A.TABLE_NAME, A.COLUMN_NAME, A.INDEX_NAME
FROM   ALL_IND_COLUMNS A
WHERE  A.TABLE_NAME IN ('KOS_PLAN');
TRUNCATE TABLE KOS_PLAN;
SELECT * FROM KOS_PLAN;

SELECT 	A.PNUM 			PNUM
		       ,A.MNUM 			MNUM
		       ,A.PDATE 		PDATE
		       ,A.PDAY 			PDAY
		       ,A.PLOCATION 	PLOCATION
		       ,A.PNAME 		PNAME		   
		       ,A.PMEMO 		PMEMO
		       ,TO_CHAR(A.INSERTDATE, 'YYYY-MM-DD') INSERTDATE
		       ,TO_CHAR(A.UPDATEDATE, 'YYYY-MM-DD') UPDATEDATE	     
		FROM 	KOS_PLAN A
		WHERE 	MNUM = 'M202206260001'
		ORDER BY 1 ASC; 
        
CREATE TABLE KOS_TRAVEL(
    TNUM        VARCHAR2(100)       PRIMARY KEY,
    MNUM        VARCHAR2(100)       NOT NULL,
    TNAME       VARCHAR2(100)       NOT NULL,
    TSTARTDATE  DATE                NOT NULL,
    TENDDATE    DATE                NOT NULL
);

DROP TABLE KOS_TRAVEL;
TRUNCATE TABLE KOS_TRAVEL;
SELECT A.TABLE_NAME, A.COLUMN_NAME, A.INDEX_NAME
FROM   ALL_IND_COLUMNS A
WHERE  A.TABLE_NAME IN ('KOS_TRAVEL');

SELECT * FROM KOS_TRAVEL;

CREATE TABLE KOS_CART(
    KCNUM	    VARCHAR2(100)    PRIMARY KEY,
    MNUM	    VARCHAR2(100)    NOT NULL,
    FNUM	    VARCHAR2(100),
    FSTARTDAY	DATE,
    FDETDAY	    DATE,
    FNAME	    VARCHAR2(100),
    FSTART	    VARCHAR2(100),
    FDEST	    VARCHAR2(100),
    FSTARTTIME	VARCHAR2(100),
    FDETTIME	VARCHAR2(100),
    FPRICE	    VARCHAR2(100),
    HNUM	    VARCHAR2(100),
    HNAME	    VARCHAR2(100),
    HKIND	    VARCHAR2(100),
    HPRICE	    VARCHAR2(100),
    HPHONE	    VARCHAR2(100),
    HADDR	    VARCHAR2(100),
    HCHECKIN	DATE,
    HCHECKOUT	DATE,
    CARNUM	    VARCHAR2(100),
    CARNAME	    VARCHAR2(100),
    CARADDR 	VARCHAR2(100),
    CARPRICE	VARCHAR2(100),
    CARPHONE	VARCHAR2(100),
    CARSTARTDAY	DATE,
    CARENDDAY	DATE
);
INSERT INTO KOS_CART(
    KCNUM,
    MNUM,
    FNUM,
    FSTARTDAY,
    FDETDAY,
    FNAME,
    FSTART,
    FDEST,
    FSTARTTIME,
    FDETTIME,
    FPRICE,
    HNUM,
    HNAME,
    HKIND,
    HPRICE,
    HPHONE,
    HADDR,
    HCHECKIN,
    HCHECKOUT,
    CARNUM,
    CARNAME,
    CARADDR,
    CARPRICE,
    CARPHONE,
    CARSTARTDAY,
    CARENDDAY)
    VALUES('KC202207040001','M202206260001','F202207040001','22/07/14','22/07/16','대한항공','인천','제주','09:00','10:00','150000','H202207040001','호텔이얌','호텔','100000','010000','제주시','22/07/14','22/07/16','C202207040001','렌트카얌','제주시','70000','0101111','22/07/14','22/07/16');