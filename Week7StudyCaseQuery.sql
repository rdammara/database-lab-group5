CREATE DATABASE WEEK7STUDYCASE
USE WEEK7STUDYCASE


CREATE TABLE Bank
(
    BankID                 CHAR(3)        NOT NULL,
    BankName               VARCHAR(50)    NOT NULL,
    PRIMARY KEY            (BankID)
)

CREATE TABLE Photographer
(
    PhotographerID       CHAR(5)        NOT NULL  PRIMARY KEY,
    PhotographerName     VARCHAR(50)    NOT NULL,
    PhotographerGender   CHAR(1)        NOT NULL  CHECK (PhotographerGender = 'M' OR PhotographerGender = 'F'),
    PhotographerAddress  VARCHAR(50)    NOT NULL,
    PhotographerEmail    VARCHAR(50)	NOT NULL,
    Skill                VARCHAR(50)    NOT NULL,
    Camera               VARCHAR(50)    NOT NULL,
    Lens                 VARCHAR(50)    NOT NULL,
    Equipment            VARCHAR(50)    NOT NULL,
    AccountNumber        INT            NOT NULL,
    BankID               CHAR(3)        NOT NULL,
    Descriptions         TEXT           NOT NULL,
    FOREIGN KEY          (BankID) REFERENCES Bank
)

CREATE TABLE Customer
(
    CustID                 CHAR(5)      PRIMARY KEY,
    CustName               VARCHAR(50)  NOT NULL,
    CustGender             CHAR(1)      NOT NULL  CHECK (CustGender = 'M' OR CustGender = 'F'),
    CustAddress            VARCHAR(100) NOT NULL,
    CustEmail              VARCHAR(100) NOT NULL,
    Instagram              VARCHAR(100) NOT NULL,
    Facebook               VARCHAR(100) NOT NULL,
    Twitter                VARCHAR(100) NOT NULL
)


--Portfolio--
CREATE TABLE PortfolioAlbum
(
	PortfolioAlbumID CHAR(5) NOT NULL,
	PhotographerID CHAR(5) NOT NULL,
	AlbumTitle VARCHAR(50) NOT NULL,
	CreatedDate DATE NOT NULL,
	Photo IMAGE NOT NULL,
	Descriptions TEXT NOT NULL,
	PRIMARY KEY	(PortfolioAlbumID),
	FOREIGN KEY	(PhotographerID) REFERENCES Photographer
)

--Transactions--
CREATE TABLE Transactions
(
	TransactionID CHAR(5) NOT NULL,
	CustID CHAR(5) NOT NULL,
	PhotographerID CHAR(5) NOT NULL,
	EventDate DATE NOT NULL,
	EventTime TIME(1) NOT NULL,
	Duration TIME NOT NULL,
	PlaceName VARCHAR(50) NOT NULL,
	Locations VARCHAR(50) NOT NULL,
	BookingDate DATE NOT NULL,
	PRIMARY KEY	(TransactionID),
	FOREIGN KEY	(PhotographerID) REFERENCES Photographer,
	FOREIGN KEY	(CustID) REFERENCES Customer
)

CREATE TABLE Payment
(
	PaymentID CHAR(5) NOT NULL,
	TransactionID CHAR(5) NOT NULL,
	PaymentDate DATE NOT NULL,
	AmmountofPayment INT NOT NULL,
	PaymentMethod VARCHAR(50) NOT NULL,
	PaymentStatus VARCHAR(10) NOT NULL,
	PRIMARY KEY	(PaymentID),
	FOREIGN KEY	(TransactionID) REFERENCES Transactions
)

--DML Enquiry (SELECT, INSERT etc)
-- Bank Table
INSERT INTO Bank VALUES ('001','Bank Indonesia')
INSERT INTO Bank VALUES ('008','Bank Tabungan Negara')
INSERT INTO Bank VALUES ('007','Bank Bukopin')
INSERT INTO Bank VALUES ('012','Bank Danamon Indonesia')
INSERT INTO Bank VALUES ('005','Bank Mega')

-- Photographer Table
INSERT INTO Photographer VALUES ('PR001','Richard','M','Bekasi','richard@gmail.com','Auto Lock','Sony A55',' Sony 1000mm','Camera, Lens, Memory Card, Flash','04510009','001','Lulusan S1 DKV Institut Teknologi Bandung')
INSERT INTO Photographer VALUES ('PR002','AL','M','Jakarta','al@gmail.com','Fisheye','Nikon D500','Nikon A 250-300mm','Camera, Lens, Memory Card','01110202','005','Lulusan S1 Film Universitas Multimedia Nusantara')
INSERT INTO Photographer VALUES ('PR003','Fikri','M','Solo','fikri@gmail.com','Jump Shot','Canon 600D','Canon 600mm', 'Camera, Lens, Memory Card','08735089','008','Lulusan S1 Film Universitas Multimedia Nusantara')
INSERT INTO Photographer VALUES ('PR004','Steven','M','Jakarta Barat','steven@gmail.com','Sharpen Shot','Sony A55',' Sony 1000mm','Camera, Lens, Memory Card, Flash','07648537','007','Lulusan S1 DKV Bina Nusantara')
INSERT INTO Photographer VALUES ('PR005','Kendy','M','Tangerang','kendoy@gmail.com','Panorama','Canon EOS 5D','Canon 30-50mm','Camera, Lens, Memory Card, Extra Batteries, Flash','06654642','012','Lulusan S1 DKV Institut Teknologi Sepuluh Nopember')

-- Portfolio Album Table
INSERT INTO PortfolioAlbum VALUES('PA001','PR001','Modern','20210305','001.jpg','britney spears')
INSERT INTO PortfolioAlbum VALUES('PA002','PR002','Traditional','20210103','002.jpg','blue sky');
INSERT INTO PortfolioAlbum VALUES('PA003','PR003','Futuristic','20211215','003.jpg','anne marie');
INSERT INTO PortfolioAlbum VALUES('PA004','PR004','Travel','20210429','004.jpg','orange glow');
INSERT INTO PortfolioAlbum VALUES('PA005','PR005','Adventure','20210910','005.jpg','jumanji');

-- Customer Table
INSERT INTO Customer VALUES('CR001', 'Jeandra Immanuel','M', 'Jl. Jaksa','imjeje@gmail.com','imjeje15', 'Jeandra Immanuel', 'imjeand')
INSERT INTO Customer VALUES('CR002', 'Christian Ryan','M', 'Jl. Gajah Mada','chrstr@gmail.com','christryan', 'Christian Ryan', 'chrstryan_')
INSERT INTO Customer VALUES('CR003', 'Jennie','F', 'Jl. Jendral Gatot Subroto','jennie@gmail.com','jen098', 'Jennie', 'itsmeJennie')
INSERT INTO Customer VALUES('CR004', 'Faisal Jacob','M', 'Jl. Jendral Sudirman','faisjc@gmail.com','faisjc_', 'Faisal Jacob', 'faisalJC')
INSERT INTO Customer VALUES('CR005', 'Alia Deandra','F', 'Jl. Merdeka','aliadean@gmail.com','aliadeandr_', 'Alia Deandra', 'aliDndr')

-- Transaction Table
INSERT INTO Transactions VALUES ('TR001','CR001','PR001','20220101','18:00','01:15:00','Summarecon Mall Serpong','Tangerang Selatan','20220101')
INSERT INTO Transactions VALUES ('TR002','CR002','PR002','20211204','14:00','02:30:00','Universitas Multimedia Nusantara','Tangerang Selatan','20211204')
INSERT INTO Transactions VALUES ('TR003','CR003','PR003','20210312','13:00','01:20:00','Monas','Jakarta','20210312')
INSERT INTO Transactions VALUES ('TR004','CR004','PR004','20220223','18:00','01:10:00','Alam Sutera','Tangerang','20220223')
INSERT INTO Transactions VALUES ('TR005','CR005','PR005','20210611','17:00','01:00:00','PRJ','Jakarta','20210611')

-- Payment Table
INSERT INTO Payment VALUES ('PM001','TR001','20220101','8500000','LOCAL BANK','PENDING')
INSERT INTO Payment VALUES ('PM002','TR002','20211204','5000000','LOCAL BANK','PENDING')
INSERT INTO Payment VALUES ('PM003','TR003','20210312','9550000','LOCAL BANK','PENDING')
INSERT INTO Payment VALUES ('PM004','TR004','20220223','7500000','LOCAL BANK','PENDING')
INSERT INTO Payment VALUES ('PM005','TR005','20210611','2300000','LOCAL BANK','PENDING')


-- SELECT
Select * From Bank

Select * From Photographer

Select * From PortfolioAlbum

Select * From Customer

Select * From Transactions

Select * From Payment


-- UPDATE

UPDATE Payment
SET PaymentStatus = 'DONE'
WHERE PaymentID = 'PM002'

UPDATE Customer
SET Instagram = 'jennieblackpink'
WHERE CustID = 'CR003'

-- DELETE
DELETE FROM Payment 
WHERE PaymentStatus = 'DONE'

DELETE FROM PortfolioAlbum
WHERE MONTH(CreatedDate) BETWEEN '2' AND '5'

--Combining Multiple tables
-- UNION

-- JOIN
--Menampilkan PhotographerID, PaymentStatus, BookingDate, dan PaymentDate dengan bulan Sebelum June dan diurutkan secara ASC 
SELECT x.PhotographerID, x.BookingDate, y.PaymentDate, y.PaymentStatus
FROM Transactions x JOIN Payment y
ON x.TransactionID = y.TransactionID
WHERE (MONTH (y.PaymentDate) < 6)
ORDER BY MONTH (y.PaymentDate)