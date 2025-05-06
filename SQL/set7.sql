CREATE DATABASE IF NOT EXISTS spdexpress;
USE spdexpress;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `EmployeeID` int NOT NULL,
  `Role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`EmployeeID`) USING BTREE,
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'Account Management');
INSERT INTO `admin` VALUES (2, 'Reporting');
INSERT INTO `admin` VALUES (3, 'System Administration');
INSERT INTO `admin` VALUES (4, 'Data Analysis');
INSERT INTO `admin` VALUES (5, 'User Management');

-- ----------------------------
-- Table structure for courier
-- ----------------------------
DROP TABLE IF EXISTS `courier`;
CREATE TABLE `courier`  (
  `CourierID` int NOT NULL,
  `VehicleType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ZoneID` int NOT NULL,
  PRIMARY KEY (`CourierID`) USING BTREE,
  CONSTRAINT `courier_ibfk_1` FOREIGN KEY (`CourierID`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courier
-- ----------------------------
INSERT INTO `courier` VALUES (6, 'Motorcycle', 1);
INSERT INTO `courier` VALUES (7, 'Van', 2);
INSERT INTO `courier` VALUES (8, 'Truck', 3);
INSERT INTO `courier` VALUES (9, 'Motorcycle', 1);
INSERT INTO `courier` VALUES (10, 'Van', 2);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LastName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RegistrationDate` date NOT NULL,
  `AccountStatus` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Active',
  PRIMARY KEY (`CustomerID`) USING BTREE,
  UNIQUE INDEX `Email`(`Email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, 'John', 'Doe', 'john.doe@example.com', '2022-01-15', 'Active');
INSERT INTO `customer` VALUES (2, 'Jane', 'Smith', 'jane.smith@example.com', '2022-02-20', 'Active');
INSERT INTO `customer` VALUES (3, 'Bob', 'Johnson', 'bob.johnson@example.com', '2022-03-10', 'Active');
INSERT INTO `customer` VALUES (4, 'Alice', 'Brown', 'alice.brown@example.com', '2022-04-05', 'Active');
INSERT INTO `customer` VALUES (5, 'Mike', 'Davis', 'mike.davis@example.com', '2022-05-18', 'Active');
INSERT INTO `customer` VALUES (6, 'David', 'Wilson', 'david.wilson@example.com', '2022-06-20', 'Active');
INSERT INTO `customer` VALUES (7, 'Emily', 'Miller', 'emily.miller@example.com', '2022-07-12', 'Active');
INSERT INTO `customer` VALUES (8, 'Kevin', 'Moore', 'kevin.moore@example.com', '2022-08-05', 'Active');
INSERT INTO `customer` VALUES (9, 'Sarah', 'Taylor', 'sarah.taylor@example.com', '2022-09-18', 'Active');
INSERT INTO `customer` VALUES (10, 'Michael', 'Anderson', 'michael.anderson@example.com', '2022-10-22', 'Active');

-- ----------------------------
-- Table structure for customeraddress
-- ----------------------------
DROP TABLE IF EXISTS `customeraddress`;
CREATE TABLE `customeraddress`  (
  `CustomerID` int NULL DEFAULT NULL,
  `AddressID` int NOT NULL AUTO_INCREMENT,
  `Street` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `City` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ZipCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`AddressID`) USING BTREE,
  INDEX `CustomerID`(`CustomerID` ASC) USING BTREE,
  CONSTRAINT `customeraddress_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customeraddress
-- ----------------------------
INSERT INTO `customeraddress` VALUES (1, 1, '123 Main St', 'Anytown', '12345');
INSERT INTO `customeraddress` VALUES (2, 2, '456 Oak Ave', 'Oakville', '67890');
INSERT INTO `customeraddress` VALUES (3, 3, '789 Pine Rd', 'Pinecrest', '54321');
INSERT INTO `customeraddress` VALUES (4, 4, '321 Maple St', 'Maplewood', '98765');
INSERT INTO `customeraddress` VALUES (5, 5, '654 Birch Ave', 'Birchwood', '13579');
INSERT INTO `customeraddress` VALUES (6, 6, '987 Cedar St', 'Cedarville', '24680');
INSERT INTO `customeraddress` VALUES (7, 7, '753 Willow Rd', 'Willowbrook', '13579');
INSERT INTO `customeraddress` VALUES (8, 8, '864 Elm St', 'Elmwood', '98765');
INSERT INTO `customeraddress` VALUES (9, 9, '520 Walnut Ave', 'Walnut Creek', '11223');
INSERT INTO `customeraddress` VALUES (10, 10, '315 Chestnut St', 'Chestnut Hill', '44556');

-- ----------------------------
-- Table structure for customerphone
-- ----------------------------
DROP TABLE IF EXISTS `customerphone`;
CREATE TABLE `customerphone`  (
  `CustomerID` int NOT NULL,
  `PhoneNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`CustomerID`, `PhoneNumber`) USING BTREE,
  CONSTRAINT `customerphone_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customerphone
-- ----------------------------
INSERT INTO `customerphone` VALUES (1, '123-456-7890');
INSERT INTO `customerphone` VALUES (1, '234-567-8901');
INSERT INTO `customerphone` VALUES (2, '345-678-9012');
INSERT INTO `customerphone` VALUES (3, '456-789-0123');
INSERT INTO `customerphone` VALUES (4, '567-890-1234');
INSERT INTO `customerphone` VALUES (5, '678-901-2345');
INSERT INTO `customerphone` VALUES (6, '789-012-3456');
INSERT INTO `customerphone` VALUES (7, '890-123-4567');
INSERT INTO `customerphone` VALUES (8, '901-234-5678');
INSERT INTO `customerphone` VALUES (9, '012-345-6789');
INSERT INTO `customerphone` VALUES (10, '123-456-7891');

-- ----------------------------
-- Table structure for deliveryrecord
-- ----------------------------
DROP TABLE IF EXISTS `deliveryrecord`;
CREATE TABLE `deliveryrecord`  (
  `DeliveryID` int NOT NULL AUTO_INCREMENT,
  `TrackingNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CourierID` int NOT NULL,
  `PickupTime` datetime NOT NULL,
  `DeliveryTime` datetime NULL DEFAULT NULL,
  `CustomerFeedback` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `FeedbackRating` int NULL DEFAULT NULL,
  PRIMARY KEY (`DeliveryID`) USING BTREE,
  INDEX `TrackingNumber`(`TrackingNumber` ASC) USING BTREE,
  INDEX `CourierID`(`CourierID` ASC) USING BTREE,
  CONSTRAINT `deliveryrecord_ibfk_1` FOREIGN KEY (`TrackingNumber`) REFERENCES `parcel` (`TrackingNumber`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `deliveryrecord_ibfk_2` FOREIGN KEY (`CourierID`) REFERENCES `courier` (`CourierID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `deliveryrecord_chk_1` CHECK (`FeedbackRating` between 1 and 5)
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of deliveryrecord
-- ----------------------------
INSERT INTO `deliveryrecord` VALUES (31, 'PARCEL001', 6, '2022-01-18 09:00:00', '2022-01-22 14:30:00', 'Great service!', 5);
INSERT INTO `deliveryrecord` VALUES (32, 'PARCEL002', 7, '2022-02-22 10:15:00', '2022-03-12 13:45:00', NULL, NULL);
INSERT INTO `deliveryrecord` VALUES (33, 'PARCEL003', 8, '2022-03-12 13:45:00', '2022-03-12 13:45:00', NULL, NULL);
INSERT INTO `deliveryrecord` VALUES (34, 'PARCEL004', 9, '2022-03-12 13:45:00', '2022-03-12 13:45:00', NULL, NULL);
INSERT INTO `deliveryrecord` VALUES (35, 'PARCEL005', 10, '2022-05-18 08:30:00', '2022-03-12 13:45:00', NULL, NULL);
INSERT INTO `deliveryrecord` VALUES (36, 'PARCEL006', 6, '2022-06-13 09:30:00', '2022-06-18 15:45:00', 'Delivery was on time.', 4);
INSERT INTO `deliveryrecord` VALUES (37, 'PARCEL007', 7, '2022-07-20 11:00:00', '2022-03-12 13:45:00', NULL, NULL);
INSERT INTO `deliveryrecord` VALUES (38, 'PARCEL008', 8, '2022-08-11 14:20:00', '2022-03-12 13:45:00', NULL, NULL);
INSERT INTO `deliveryrecord` VALUES (39, 'PARCEL009', 9, '2022-03-12 13:45:00', '2022-03-12 13:45:00', NULL, NULL);
INSERT INTO `deliveryrecord` VALUES (40, 'PARCEL010', 10, '2022-10-17 10:00:00', '2022-03-12 13:45:00', NULL, NULL);

-- ----------------------------
-- Table structure for deliveryzone
-- ----------------------------
DROP TABLE IF EXISTS `deliveryzone`;
CREATE TABLE `deliveryzone`  (
  `ZoneID` int NOT NULL,
  `ZoneName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CoverageArea` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BaseLocation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ZoneID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of deliveryzone
-- ----------------------------
INSERT INTO `deliveryzone` VALUES (1, 'Zone A', 'Downtown Area', 'Hub A');
INSERT INTO `deliveryzone` VALUES (2, 'Zone B', 'Suburban Area', 'Hub B');
INSERT INTO `deliveryzone` VALUES (3, 'Zone C', 'Rural Area', 'Hub C');
INSERT INTO `deliveryzone` VALUES (4, 'Zone D', 'North Area', 'Hub D');
INSERT INTO `deliveryzone` VALUES (5, 'Zone E', 'South Area', 'Hub E');
INSERT INTO `deliveryzone` VALUES (6, 'Zone F', 'East Area', 'Hub F');
INSERT INTO `deliveryzone` VALUES (7, 'Zone G', 'West Area', 'Hub G');
INSERT INTO `deliveryzone` VALUES (8, 'Zone H', 'Central Area', 'Hub H');
INSERT INTO `deliveryzone` VALUES (9, 'Zone I', 'Westside Area', 'Hub I');
INSERT INTO `deliveryzone` VALUES (10, 'Zone J', 'Eastside Area', 'Hub J');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `EmpFName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EmpLName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EmployeePhone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HireDate` date NOT NULL,
  PRIMARY KEY (`EmployeeID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, 'Tom', 'Wilson', '111-222-3333', '2020-01-01');
INSERT INTO `employee` VALUES (2, 'Amy', 'Anderson', '222-333-4444', '2020-02-15');
INSERT INTO `employee` VALUES (3, 'John', 'Miller', '333-444-5555', '2020-03-10');
INSERT INTO `employee` VALUES (4, 'Lisa', 'Moore', '444-555-6666', '2020-04-20');
INSERT INTO `employee` VALUES (5, 'David', 'Taylor', '555-666-7777', '2020-05-05');
INSERT INTO `employee` VALUES (6, 'Michael', 'Johnson', '666-777-8888', '2020-06-12');
INSERT INTO `employee` VALUES (7, 'Emily', 'Brown', '777-888-9999', '2020-07-18');
INSERT INTO `employee` VALUES (8, 'Kevin', 'Davis', '888-999-0000', '2020-08-22');
INSERT INTO `employee` VALUES (9, 'Sarah', 'Wilson', '999-000-1111', '2020-09-25');
INSERT INTO `employee` VALUES (10, 'Alexander', 'Martinez', '000-111-2222', '2020-10-30');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `OrderDate` datetime NOT NULL,
  `TotalCost` decimal(10, 2) NOT NULL,
  `PaymentStatus` enum('Pending','Completed','Cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Pending',
  PRIMARY KEY (`OrderID`) USING BTREE,
  INDEX `CustomerID`(`CustomerID` ASC) USING BTREE,
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, 1, '2022-01-15 14:20:00', 15.00, 'Completed');
INSERT INTO `order` VALUES (2, 2, '2022-02-20 10:30:00', 25.00, 'Pending');
INSERT INTO `order` VALUES (3, 3, '2022-03-10 16:45:00', 10.00, 'Completed');
INSERT INTO `order` VALUES (4, 4, '2022-04-05 09:15:00', 20.00, 'Completed');
INSERT INTO `order` VALUES (5, 5, '2022-05-18 12:00:00', 30.00, 'Pending');
INSERT INTO `order` VALUES (6, 6, '2022-06-12 14:30:00', 18.00, 'Completed');
INSERT INTO `order` VALUES (7, 7, '2022-07-15 11:20:00', 22.00, 'Pending');
INSERT INTO `order` VALUES (8, 8, '2022-08-10 16:40:00', 16.00, 'Completed');
INSERT INTO `order` VALUES (9, 9, '2022-09-18 09:25:00', 24.00, 'Completed');
INSERT INTO `order` VALUES (10, 10, '2022-10-20 13:15:00', 28.00, 'Pending');

-- ----------------------------
-- Table structure for parcel
-- ----------------------------
DROP TABLE IF EXISTS `parcel`;
CREATE TABLE `parcel`  (
  `TrackingNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SenderID` int NOT NULL,
  `ReceiverID` int NOT NULL,
  `Weight` decimal(5, 2) NOT NULL,
  `Length` decimal(5, 2) NOT NULL,
  `Width` decimal(5, 2) NOT NULL,
  `Height` decimal(5, 2) NOT NULL,
  `ShippingType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CurrentStatus` enum('Ordered','Picked Up','In Transit','Delivered') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Ordered',
  `EstimatedDeliveryDate` date NULL DEFAULT NULL,
  `ActualDeliveryDate` date NULL DEFAULT NULL,
  `InsuranceAmount` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`TrackingNumber`) USING BTREE,
  INDEX `SenderID`(`SenderID` ASC) USING BTREE,
  INDEX `ReceiverID`(`ReceiverID` ASC) USING BTREE,
  CONSTRAINT `parcel_ibfk_1` FOREIGN KEY (`SenderID`) REFERENCES `customer` (`CustomerID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `parcel_ibfk_2` FOREIGN KEY (`ReceiverID`) REFERENCES `customer` (`CustomerID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of parcel
-- ----------------------------
INSERT INTO `parcel` VALUES ('PARCEL001', 1, 2, 2.50, 30.00, 20.00, 10.00, 'Standard', 'Delivered', '2022-01-20', '2022-01-22', 100.00);
INSERT INTO `parcel` VALUES ('PARCEL002', 2, 3, 5.00, 40.00, 30.00, 20.00, 'Express', 'In Transit', '2022-02-25', NULL, 200.00);
INSERT INTO `parcel` VALUES ('PARCEL003', 3, 4, 1.80, 25.00, 15.00, 8.00, 'Standard', 'Picked Up', '2022-03-15', NULL, 50.00);
INSERT INTO `parcel` VALUES ('PARCEL004', 4, 5, 3.20, 35.00, 25.00, 15.00, 'Express', 'Ordered', '2022-04-10', NULL, 150.00);
INSERT INTO `parcel` VALUES ('PARCEL005', 5, 1, 4.70, 45.00, 35.00, 25.00, 'Standard', 'In Transit', '2022-05-20', NULL, 250.00);
INSERT INTO `parcel` VALUES ('PARCEL006', 6, 7, 2.00, 30.00, 20.00, 10.00, 'Standard', 'Delivered', '2022-06-15', '2022-06-18', 80.00);
INSERT INTO `parcel` VALUES ('PARCEL007', 7, 8, 6.50, 45.00, 35.00, 25.00, 'Express', 'In Transit', '2022-07-22', NULL, 300.00);
INSERT INTO `parcel` VALUES ('PARCEL008', 8, 9, 2.30, 28.00, 18.00, 12.00, 'Standard', 'Picked Up', '2022-08-10', NULL, 65.00);
INSERT INTO `parcel` VALUES ('PARCEL009', 9, 10, 4.00, 40.00, 30.00, 20.00, 'Express', 'Ordered', '2022-09-15', NULL, 200.00);
INSERT INTO `parcel` VALUES ('PARCEL010', 10, 6, 3.80, 38.00, 28.00, 18.00, 'Standard', 'In Transit', '2022-10-20', NULL, 180.00);

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `Amount` decimal(10, 2) NOT NULL,
  `PaymentMethod` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PaymentDate` datetime NOT NULL,
  `PaymentStatus` enum('Completed','Pending','Failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Pending',
  PRIMARY KEY (`PaymentID`) USING BTREE,
  INDEX `OrderID`(`OrderID` ASC) USING BTREE,
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES (1, 1, 15.00, 'Credit Card', '2022-01-15 14:30:00', 'Completed');
INSERT INTO `payment` VALUES (2, 2, 25.00, 'PayPal', '2022-02-20 10:40:00', 'Pending');
INSERT INTO `payment` VALUES (3, 3, 10.00, 'Credit Card', '2022-03-10 16:50:00', 'Completed');
INSERT INTO `payment` VALUES (4, 4, 20.00, 'PayPal', '2022-04-05 09:25:00', 'Completed');
INSERT INTO `payment` VALUES (5, 5, 30.00, 'Credit Card', '2022-05-18 12:10:00', 'Pending');
INSERT INTO `payment` VALUES (6, 6, 18.00, 'Credit Card', '2022-06-12 14:35:00', 'Completed');
INSERT INTO `payment` VALUES (7, 7, 22.00, 'PayPal', '2022-07-15 11:25:00', 'Pending');
INSERT INTO `payment` VALUES (8, 8, 16.00, 'Credit Card', '2022-08-10 16:45:00', 'Completed');
INSERT INTO `payment` VALUES (9, 9, 24.00, 'PayPal', '2022-09-18 09:30:00', 'Completed');
INSERT INTO `payment` VALUES (10, 10, 28.00, 'Credit Card', '2022-10-20 13:20:00', 'Pending');

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `referral` (
  `ReferrerID` INT NOT NULL,
  `RefereeID` INT NOT NULL,
  PRIMARY KEY (`ReferrerID`, `RefereeID`),
  FOREIGN KEY (`ReferrerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE,
  FOREIGN KEY (`RefereeID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE
);
