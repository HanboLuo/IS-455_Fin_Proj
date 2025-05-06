// Step 9: Convert the relational database to MongoDB

// Create a new database
use SpeedExpressDB

// Customer collection
// Merge Customer, CustomerPhone, and CustomerAddress into a single document collection
db.createCollection("Customer")
db.Customer.insertMany([
    {
        firstName: "John",
        lastName: "Doe",
        email: "john.doe@example.com",
        registrationDate: new Date("2022-01-15"),
        accountStatus: "Active",
        phones: ["123-456-7890", "234-567-8901"],
        addresses: [
            {
                street: "123 Main St",
                city: "Anytown",
                zipCode: "12345"
            }
        ],
        orders: [
            {
                orderID: 1,
                orderDate: new Date("2022-01-15 14:20:00"),
                totalCost: 15.00,
                paymentStatus: "Completed",
                payment: {
                    paymentID: 1,
                    amount: 15.00,
                    paymentMethod: "Credit Card",
                    paymentDate: new Date("2022-01-15 14:30:00"),
                    paymentStatus: "Completed"
                }
            }
        ],
        parcels: [
            {
                trackingNumber: "PARCEL001",
                role: "Sender",
                weight: 2.5,
                length: 30,
                width: 20,
                height: 10,
                shippingType: "Standard",
                currentStatus: "Delivered",
                estimatedDeliveryDate: new Date("2022-01-20"),
                actualDeliveryDate: new Date("2022-01-22"),
                insuranceAmount: 100.00,
                deliveryRecord: {
                    courierID: 6,
                    pickupTime: new Date("2022-01-18 09:00:00"),
                    deliveryTime: new Date("2022-01-22 14:30:00"),
                    customerFeedback: "Great service!",
                    feedbackRating: 5
                }
            },
            {
                trackingNumber: "PARCEL002",
                role: "Receiver",
                weight: 5.0,
                length: 40,
                width: 30,
                height: 20,
                shippingType: "Express",
                currentStatus: "In Transit",
                estimatedDeliveryDate: new Date("2022-02-25"),
                deliveryRecord: {
                    courierID: 7,
                    pickupTime: new Date("2022-02-22 10:15:00"),
                    deliveryTime: null,
                    customerFeedback: null,
                    feedbackRating: null
                }
            }
        ]
    },
    {
        firstName: "Jane",
        lastName: "Smith",
        email: "jane.smith@example.com",
        registrationDate: new Date("2022-02-20"),
        accountStatus: "Active",
        phones: ["345-678-9012"],
        addresses: [
            {
                street: "456 Oak Ave",
                city: "Oakville",
                zipCode: "67890"
            }
        ],
        orders: [
            {
                orderID: 2,
                orderDate: new Date("2022-02-20 10:30:00"),
                totalCost: 25.00,
                paymentStatus: "Pending",
                payment: {
                    paymentID: 2,
                    amount: 25.00,
                    paymentMethod: "PayPal",
                    paymentDate: new Date("2022-02-20 10:40:00"),
                    paymentStatus: "Pending"
                }
            }
        ],
        parcels: [
            {
                trackingNumber: "PARCEL002",
                role: "Sender",
                weight: 5.0,
                length: 40,
                width: 30,
                height: 20,
                shippingType: "Express",
                currentStatus: "In Transit",
                estimatedDeliveryDate: new Date("2022-02-25"),
                deliveryRecord: {
                    courierID: 7,
                    pickupTime: new Date("2022-02-22 10:15:00"),
                    deliveryTime: null,
                    customerFeedback: null,
                    feedbackRating: null
                }
            },
            {
                trackingNumber: "PARCEL003",
                role: "Receiver",
                weight: 1.8,
                length: 25,
                width: 15,
                height: 8,
                shippingType: "Standard",
                currentStatus: "Picked Up",
                estimatedDeliveryDate: new Date("2022-03-15"),
                deliveryRecord: {
                    courierID: 8,
                    pickupTime: new Date("2022-03-12 13:45:00"),
                    deliveryTime: null,
                    customerFeedback: null,
                    feedbackRating: null
                }
            }
        ]
    },
    // Insert other customer data similarly
])

// Employee collection
// Merge Employee, Admin, and Courier into a single document collection
db.createCollection("Employee")
db.Employee.insertMany([
    {
        empFName: "Tom",
        empLName: "Wilson",
        employeePhone: "111-222-3333",
        hireDate: new Date("2020-01-01"),
        role: "Account Management",
        isCourier: false
    },
    {
        empFName: "Amy",
        empLName: "Anderson",
        employeePhone: "222-333-4444",
        hireDate: new Date("2020-02-15"),
        role: "Reporting",
        isCourier: false
    },
    {
        empFName: "John",
        empLName: "Miller",
        employeePhone: "333-444-5555",
        hireDate: new Date("2020-03-10"),
        role: "System Administration",
        isCourier: false
    },
    {
        empFName: "Lisa",
        empLName: "Moore",
        employeePhone: "444-555-6666",
        hireDate: new Date("2020-04-20"),
        role: "Data Analysis",
        isCourier: false
    },
    {
        empFName: "David",
        empLName: "Taylor",
        employeePhone: "555-666-7777",
        hireDate: new Date("2020-05-05"),
        role: "User Management",
        isCourier: false
    },
    {
        empFName: "Michael",
        empLName: "Johnson",
        employeePhone: "666-777-8888",
        hireDate: new Date("2020-06-12"),
        role: null,
        isCourier: true,
        courierDetails: {
            vehicleType: "Motorcycle",
            zoneID: 1,
            zoneName: "Zone A",
            coverageArea: "Downtown Area",
            baseLocation: "Hub A"
        }
    },
    {
        empFName: "Emily",
        empLName: "Brown",
        employeePhone: "777-888-9999",
        hireDate: new Date("2020-07-18"),
        role: null,
        isCourier: true,
        courierDetails: {
            vehicleType: "Van",
            zoneID: 2,
            zoneName: "Zone B",
            coverageArea: "Suburban Area",
            baseLocation: "Hub B"
        }
    },
    {
        empFName: "Kevin",
        empLName: "Davis",
        employeePhone: "888-999-0000",
        hireDate: new Date("2020-08-22"),
        role: null,
        isCourier: true,
        courierDetails: {
            vehicleType: "Truck",
            zoneID: 3,
            zoneName: "Zone C",
            coverageArea: "Rural Area",
            baseLocation: "Hub C"
        }
    },
    {
        empFName: "Sarah",
        empLName: "Wilson",
        employeePhone: "999-000-1111",
        hireDate: new Date("2020-09-25"),
        role: null,
        isCourier: true,
        courierDetails: {
            vehicleType: "Motorcycle",
            zoneID: 1,
            zoneName: "Zone A",
            coverageArea: "Downtown Area",
            baseLocation: "Hub A"
        }
    },
    {
        empFName: "Alexander",
        empLName: "Martinez",
        employeePhone: "000-111-2222",
        hireDate: new Date("2020-10-30"),
        role: null,
        isCourier: true,
        courierDetails: {
            vehicleType: "Van",
            zoneID: 2,
            zoneName: "Zone B",
            coverageArea: "Suburban Area",
            baseLocation: "Hub B"
        }
    }
])

// DeliveryZone collection
db.createCollection("DeliveryZone")
db.DeliveryZone.insertMany([
    {
        zoneID: 1,
        zoneName: "Zone A",
        coverageArea: "Downtown Area",
        baseLocation: "Hub A"
    },
    {
        zoneID: 2,
        zoneName: "Zone B",
        coverageArea: "Suburban Area",
        baseLocation: "Hub B"
    },
    {
        zoneID: 3,
        zoneName: "Zone C",
        coverageArea: "Rural Area",
        baseLocation: "Hub C"
    },
    {
        zoneID: 4,
        zoneName: "Zone D",
        coverageArea: "North Area",
        baseLocation: "Hub D"
    },
    {
        zoneID: 5,
        zoneName: "Zone E",
        coverageArea: "South Area",
        baseLocation: "Hub E"
    },
    {
        zoneID: 6,
        zoneName: "Zone F",
        coverageArea: "East Area",
        baseLocation: "Hub F"
    },
    {
        zoneID: 7,
        zoneName: "Zone G",
        coverageArea: "West Area",
        baseLocation: "Hub G"
    },
    {
        zoneID: 8,
        zoneName: "Zone H",
        coverageArea: "Central Area",
        baseLocation: "Hub H"
    },
    {
        zoneID: 9,
        zoneName: "Zone I",
        coverageArea: "Westside Area",
        baseLocation: "Hub I"
    },
    {
        zoneID: 10,
        zoneName: "Zone J",
        coverageArea: "Eastside Area",
        baseLocation: "Hub J"
    }
])

// Parcel collection (optional, as parcels can be embedded within Customer documents)
// If a separate Parcel collection is needed, it can be created as follows
// db.createCollection("Parcel")
// db.Parcel.insertMany([
//     {
//         trackingNumber: "PARCEL001",
//         senderID: 1,
//         receiverID: 2,
//         weight: 2.5,
//         length: 30,
//         width: 20,
//         height: 10,
//         shippingType: "Standard",
//         currentStatus: "Delivered",
//         estimatedDeliveryDate: new Date("2022-01-20"),
//         actualDeliveryDate: new Date("2022-01-22"),
//         insuranceAmount: 100.00,
//         deliveryRecord: {
//             courierID: 6,
//             pickupTime: new Date("2022-01-18 09:00:00"),
//             deliveryTime: new Date("2022-01-22 14:30:00"),
//             customerFeedback: "Great service!",
//             feedbackRating: 5
//         }
//     },
//     // Insert other parcel data similarly
// ])