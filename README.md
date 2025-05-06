# SpeedExpress: Courier Tracking and Management System

SpeedExpress is a full-stack logistics system designed to support the core operations of a courier company, including package tracking, customer order management, courier dispatch, delivery records, and customer feedback.

### Contributors
* Hanbo (David) Luo - hanbol3
* Zhouyang Yu - zyu44
* Siyu Chen - siyu10

**Instructor:** Kahyun Choi  
**Project template:** Provided by TA: Ziyang Zheng (ziyangz5)  

## Features

- **Track Parcel**: Customers can track real-time package status using a tracking number.
- **My Orders**: View order details including cost, payment method, package info, and delivery status.
- **Feedback**: Submit feedback for completed deliveries.
- **Courier Dispatch Dashboard** (Admin only): View courier performance metrics including total deliveries, last delivery time, and delivery zone.
- **Delivery Record Log**: Review delivery history of a specific courier with feedback and rating.


## Step 1. Database Scenario

We designed a database system for a logistics company called SpeedExpress. The company specializes in same-city and cross-city courier service and has over 200 couriers and over 10,000 registered customers.

### Database Purpose

The database is designed to support the core business processes (Business Process) of the courier company, including:
* Customer Order Management (Order Management)
* Parcel (Parcel) tracking (Tracking)
* Courier dispatch (Courier Dispatch)
* Delivery Record (Delivery Record) tracking
* Customer feedback (Feedback) collection

### Target Users
1. **Customers:** through the website or APP to place an order, tracking packages, submit feedback
2. **Courier:** receive delivery tasks, update the status of the package (Status)
3. **Administrator:** monitor operations, generate reports, manage user accounts 
4. **Customer Service Representative (CSR):** Handle customer inquiries and complaints.


## Step 2. Front-end Interface

<p align="center">
  <img src="Figures/front_end.png" alt="Frontend Interface" width="600">
  <br/>
  <strong>Figure 1.</strong> SpeedExpress Frontend Interface
</p>


## Step 3. Database Requirements

### Entity & Attribute Requirements

### Attribute in Customer
**Database Requirements for Attribute in Customer**  
Each customer in the system has a unique Customer ID as the primary key. Customers must provide their full name, stored as separate First Name and Last Name attributes. A unique Email address is required for registration, serving as the customer's login identifier. The system supports multiple Phone Numbers per customer (a multivalued attribute) to accommodate alternate contact methods. The customer's Address is modeled as a composite attribute with sub-attributes: Street, City, and Zip Code. The Registration Date is automatically recorded to track customer tenure. An Account Status field (Active/Inactive) manages account visibility.

### Attribute in Parcel
**Database Requirements for Attribute in Parcel**  
Each parcel is uniquely identified by a Tracking Number. It includes key delivery details such as Shipping Type, Weight (in kilograms), and a composite Size attribute containing Length, Width, and Height (in centimeters). The Current Status tracks the progress of the parcel through stages such as "Ordered", "Picked Up", "In Transit", and "Delivered". The Estimated Delivery Date is calculated upon dispatch, while Actual Delivery Date is derived upon successful delivery. An optional Insurance Amount can be specified to indicate the parcel’s declared value.

### Attribute in Employee
**Database Requirements for Attribute in Employee**  
All employees share a common structure defined by a unique Employee ID, a composite Employee Name (divided into EmpFName and EmpLName), a phone number for contact purposes, and the Hire Date indicating when the employee joined the organization. This structure forms the basis for general employee management across subtypes.

### Attribute in Admin
**Database Requirements for Attribute in Admin**  
Admins are specialized employees responsible for system administration. In addition to the inherited employee attributes, each Admin record contains a Role attribute, which defines the admin's permission level or area of responsibility (e.g., account management, reporting).

### Attribute in Courier
**Database Requirements for Attribute in Courier**  
Couriers are a subtype of employees who handle parcel delivery. Each courier has a Vehicle Type attribute indicating their mode of transportation, such as Motorcycle, Van, or Truck. They are also assigned to a specific delivery zone, which is referenced in the ZoneID attribute. All general employee information is inherited from the Employee entity.

### Attribute in DeliveryZone
**Database Requirements for Attribute in DeliveryZone**  
Each delivery zone is uniquely identified by a Zone ID. Descriptive attributes include Zone Name, which represents the name or code for the zone, Coverage Area, which describes the geographical scope, and Base Location, identifying the central hub or depot from which deliveries in that zone are managed.

### Attribute in DeliveryRecord
**Database Requirements for Attribute in DeliveryRecord**  
A delivery record documents the process of delivering a parcel. Each record has a partially unique Delivery ID, along with Pickup Time and Delivery Time to track the lifecycle of the delivery. Optional fields include Customer Feedback (text-based comments) and a Feedback Rating on a scale from 1 to 5. These attributes are collected after delivery to monitor service quality.

### Attribute in Order
**Database Requirements for Attribute in Order**  
Orders are uniquely identified by an Order ID. The entity also stores the Order Date when the transaction was initiated, the Total Cost calculated from shipment charges, and the Order Status, which indicates the current state of the order (e.g., pending, completed, cancelled).

### Attribute in Payment
**Database Requirements for Attribute in Payment**  
Payments are tracked using a unique Payment ID. Each payment includes an Amount paid, the Payment Method used (such as credit card, PayPal, etc.), the Payment Date when the transaction was processed, and the Payment Status, which shows whether the payment was completed, pending, or failed.


### 