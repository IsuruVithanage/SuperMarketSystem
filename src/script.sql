DROP DATABASE IF EXISTS SuperMarket;
CREATE DATABASE IF NOT EXISTS SuperMarket;
SHOW DATABASES ;
USE SuperMarket;
#-------------------
DROP TABLE IF EXISTS Customer;
CREATE TABLE IF NOT EXISTS Customer(
   CustID VARCHAR(6),
   CustTitle VARCHAR(5),
   CustName VARCHAR(30) NOT NULL DEFAULT 'Unknown',
   CustAddress VARCHAR(30),
   City VARCHAR(20),
   Province VARCHAR(20),
   PostalCode VARCHAR(9),
   CONSTRAINT PRIMARY KEY (CustID)
);
SHOW TABLES ;
DESCRIBE Customer;
#---------------------
DROP TABLE IF EXISTS `Order`;
CREATE TABLE IF NOT EXISTS `Order`(
   OrderId VARCHAR(6),
   CustID VARCHAR(6),
   orderDate DATE,
   time VARCHAR(15),
   cost DOUBLE,
   CONSTRAINT PRIMARY KEY (OrderId),
   CONSTRAINT FOREIGN KEY (CustID) REFERENCES Customer(CustID) ON DELETE CASCADE ON UPDATE CASCADE
);
SHOW TABLES ;
DESCRIBE `Order`;
#-----------------------
DROP TABLE IF EXISTS Item;
CREATE TABLE IF NOT EXISTS Item(
   Itemcode VARCHAR(6),
   Description TEXT,
   PackSize VARCHAR(20),
   QtyOnHand INT DEFAULT 0,
   UnitPrice DOUBLE DEFAULT 0.00,
   ItemDiscount DOUBLE DEFAULT 0.00,
   CONSTRAINT PRIMARY KEY (Itemcode)
);
SHOW TABLES ;
DESCRIBE Item;
#------------------------
DROP TABLE IF EXISTS OrderDetail;
CREATE TABLE IF NOT EXISTS OrderDetail(
   ItemCode VARCHAR(6),
   OrderId VARCHAR(6),
   OrderQTY INT,
   price DOUBLE,
   Discount DOUBLE DEFAULT 0.00,
   CONSTRAINT PRIMARY KEY (itemCode, orderId),
   CONSTRAINT FOREIGN KEY (itemCode) REFERENCES Item(Itemcode) ON DELETE CASCADE ON UPDATE CASCADE ,
   CONSTRAINT FOREIGN KEY (orderId) REFERENCES `Order`(OrderId) ON DELETE CASCADE ON UPDATE CASCADE
);
SHOW TABLES ;
DESCRIBE OrderDetail;
