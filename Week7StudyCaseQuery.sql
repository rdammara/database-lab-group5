CREATE DATABASE WEEK7STUDYCASE
USE WEEK7STUDYCASE


CREATE TABLE Bank
(
    BankID                 CHAR(3)        NOT NULL,
    BankName               VARCHAR(50)    NOT NULL,
    PRIMARY KEY            (BankID)
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
--DML Enquiry (SELECT, INSERT etc)

