-- Query 1: Inner Join - Find customer information and order details for completed orders

SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.OrderDate, o.TotalCost, o.PaymentStatus

FROM Customer c

INNER JOIN `Order` o ON c.CustomerID = o.CustomerID

WHERE o.PaymentStatus = 'Completed';

 

-- Query 2: Outer Join - Find all customers and their order information (including those without orders)

SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.OrderDate, o.TotalCost

FROM Customer c

LEFT OUTER JOIN `Order` o ON c.CustomerID = o.CustomerID;

 

-- Query 3: Aggregate Functions with Group By - Count deliveries per courier

SELECT c.CourierID, e.EmpFName, e.EmpLName, COUNT(dr.DeliveryID) AS DeliveryCount

FROM Courier c

JOIN Employee e ON c.CourierID = e.EmployeeID

JOIN DeliveryRecord dr ON c.CourierID = dr.CourierID

GROUP BY c.CourierID, e.EmpFName, e.EmpLName;

 

-- Query 4: Find the number of couriers per zone

SELECT dz.ZoneID, dz.ZoneName, COUNT(c.CourierID) AS CourierCount

FROM DeliveryZone dz

LEFT JOIN Courier c ON dz.ZoneID = c.ZoneID

GROUP BY dz.ZoneID, dz.ZoneName;

 

-- Query 5: Find the average order cost per customer

SELECT c.CustomerID, c.FirstName, c.LastName, AVG(o.TotalCost) AS AvgOrderCost

FROM Customer c

JOIN `Order` o ON c.CustomerID = o.CustomerID

GROUP BY c.CustomerID, c.FirstName, c.LastName;

 

-- Query 6: Find the current status and estimated delivery date for each parcel

SELECT p.TrackingNumber, p.CurrentStatus, p.EstimatedDeliveryDate

FROM Parcel p;

 

-- Query 7: Find payment information for each order

SELECT o.OrderID, o.CustomerID, o.OrderDate, p.PaymentID, p.Amount, p.PaymentMethod, p.PaymentStatus

FROM `Order` o

LEFT JOIN Payment p ON o.OrderID = p.OrderID;

 

-- Query 8: Find the delivery zone for each courier

SELECT c.CourierID, e.EmpFName, e.EmpLName, dz.ZoneID, dz.ZoneName, dz.CoverageArea

FROM Courier c

JOIN Employee e ON c.CourierID = e.EmployeeID

JOIN DeliveryZone dz ON c.ZoneID = dz.ZoneID;

 

-- Query 9: Find registration date and account status for each customer

SELECT CustomerID, FirstName, LastName, RegistrationDate, AccountStatus

FROM Customer;

 

-- Query 10: Find the dimensions and weight for each parcel

SELECT TrackingNumber, Length, Width, Height, Weight

FROM Parcel;
