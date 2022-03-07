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
    CustGender             VARCHAR(1)   NOT NULL, --M for Male, F for Female for now--
    CustAddress            VARCHAR(100) NOT NULL,
    CustEmail              VARCHAR(100) NOT NULL,
    Instagram              VARCHAR(100) NOT NULL,
    Facebook               VARCHAR(100) NOT NULL,
    Twitter                VARCHAR(100) NOT NULL
)

--DML Enquiry (SELECT, INSERT etc)

