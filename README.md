# ONLINE FOOD ORDERING SYSTEM PROJECT
<p align="justify">
  This project uses Oracle SQL Developer Data Modeler to design an Entity Relationship Diagram (ERD) and Oracle APEX to implement the ERD into a query. I completed this project while participating in Fresh Graduate Academy at <a href="https://www.linkedin.com/in/indahsh/overlay/1729484633342/single-media-viewer/?profileId=ACoAADQ0K_IBB-BflJ1wnBkU3Z47qF6xVW9xyvI">Digital Talent Scholarship</a>.
</p>

## 1. MISSION STATEMENT
<p align="justify">The Online Food Ordering System aims to establish a centralized platform that efficiently manages and processes orders for food and beverages, ensuring seamless interaction between customers, restaurants, and delivery services. The system aims to enhance the customer experience by providing a user-friendly interface, reliable transaction processing, and real-time updates. Additionally, it supports restaurant operations by optimizing order management, reducing human error, and generating data-driven insights to inform strategic decision-making. The platform facilitates collaboration and integration across multiple stakeholders to improve service quality and operational scalability.</p>

## 2. MISSION OBJECTIVES
1. <p align="justify">Creating the necessary tables to store data on customers, restaurants, menu items, orders, order details, delivery, and pickup.</p>
2. <p align="justify">Entering initial data for customers, restaurants, menu items, orders, order details, delivery, and pickup to ensure system completeness.</p>
3. <p align="justify">Creating a summary view of specific customer orders to make it easier to monitor customer activity.</p>
4. <p align="justify">Using synonyms to make it easier to access and reference specific tables or views that are frequently used.</p>
5. <p align="justify">Creating sequences to generate unique order IDs automatically.</p>
6. <p align="justify">Creating indexes to speed up searching customer data by address.</p>

## 3. ERD CONCEPTUAL
<p align="center">
  <img src="https://github.com/user-attachments/assets/93b27dcb-6ff1-4272-9e35-dfac34be4d26" width="80%"/>
</p>

### 3.1. Entity
#### a. Customer
<p align="justify">This entity represents the customer who uses the system. The main attribute is customer_id, first_name, last_name, phone_number, address, and email.</p>

#### b. Orders
<p align="justify">This entity records customer orders. The main attribute is order_id, order date, and payment method (including options such as cash and transfer), which is related to the customer entity through customer_id.</p>

#### c. Delivery
<p align="justify">This entity records delivery information. The main attribute is driver_id, driver_name, phone_number, and license_plate data, which is related to the orders entity through order_id.</p>

#### d. Pickup
<p align="justify">This entity records order pickup information with the main attributes of pickup_id and pickup_time, which is related to the orders entity through order_id.</p>

#### e. Restaurant
<p align="justify">This entity stores information about the restaurant. The main attribute is restaurant_id, restaurant_name, address, and phone_number.</p>

#### f. Menu Item
<p align="justify">This entity represents the food or drinks offered by the restaurant. The main attribute is item_id, item_name, price, and description item, which is related to the restaurant entity through restaurant_id.</p>

#### g. Order Detail
<p align="justify">This entity is a detailed representation of each order placed by a customer in the online food ordering system. The main attribute is item_quantity, which is related to the menu item entity through item_id and orders entity through order_id.</p>

### 3.2. Relationship between Entities
#### a. Customer and Orders
<p align="justify">- Each customer must has one or more orders.</p>
<p align="justify">- Each order must ordered by one and only one customer.</p>

#### b. Orders and Delivery
<p align="justify">- Each order may be ordered by one and only one delivery.</p>
<p align="justify">- Each delivery must has one and only one order.</p>

#### c. Orders and Pickup
<p align="justify">- Each order may be ordered by one and only one pickup.</p>
<p align="justify">- Each pickup must has one and only one order.</p>

#### d. Orders and Order Detail
<p align="justify">- Each order must has one or more order details.</p>
<p align="justify">- Each order detail must refers to one and only one order.</p>

#### e. Order Detail and Menu Item
<p align="justify">- Each order detail must has one and only one menu item.</p>
<p align="justify">- Each menu item must refers to one or more order details.</p>

#### f. Menu Item and Restaurant
<p align="justify">- Each menu item must offered by one and only one restaurant.</p>
<p align="justify">- Each restaurant may be offers one or more menu item.</p>

## 4. STUDY CASES
#### 1. Create a simple view that displays a list of restaurants in Jl Jakarta.

| RESTAURANT_ID | RESTAURANT_NAME | ADDRESS | PHONE_NUMBER |
| --- | --- | --- | --- |
| R0002 | Ramen Hot Yum | Jl. Jakarta No. 10 | 81987654321 |
| R0003 | Mie Ayam Bakso TOP | Jl. Jakarta No. 5 | 81876543210 |
| R0005 | Seafood House | Jl. Jakarta No. 7 | 81654321098 |

#### 2. Insert data in simple view.

| RESTAURANT_ID | RESTAURANT_NAME | ADDRESS | PHONE_NUMBER |
| --- | --- | --- | --- |
| R0002 | Ramen Hot Yum | Jl. Jakarta No. 10 | 81987654321 |
| R0003 | Mie Ayam Bakso TOP | Jl. Jakarta No. 5 | 81876543210 |
| R0006 | Rumah Makan Sunda | Jl. Jakarta No. 13 | 81543210987 |
| R0005 | Seafood House | Jl. Jakarta No. 7 | 81654321098 |

#### 3. View the customer's order summary by creating a complex view.

| FIRST_NAME | LAST_NAME | ADDRESS | ORDER_ID | ORDER_DATE | PAYMENT_METHOD |
| --- | --- | --- | --- | --- | --- |
| Stefani | Lina | Jl. Mawar No. 1 | O0003 | 08/08/2024 | 1 |

#### 4. Create synonyms from view_resto_jakarta to resto_jakarta.

| RESTAURANT_ID | RESTAURANT_NAME | ADDRESS | PHONE_NUMBER |
| --- | --- | --- | --- |
| R0002 | Ramen Hot Yum | Jl. Jakarta No. 10 | 81987654321 |
| R0003 | Mie Ayam Bakso TOP | Jl. Jakarta No. 5 | 81876543210 |
| R0006 | Rumah Makan Sunda | Jl. Jakarta No. 13 | 81543210987 |
| R0005 | Seafood House | Jl. Jakarta No. 7 | 81654321098 |

#### 5. Create sequences for order number.

| ORDER_ID | CUSTOMER_ID | ORDER_DATE | PAYMENT_METHOD |
| --- | --- | --- | --- |
| O0001 | C0001 | 08/08/2024 | 1 |
| O0002 | C0002 | 08/08/2024 | 2 |
| O0004 | C0004 | 08/08/2024 | 2 |
| O0005 | C0005 | 08/08/2024 | 2 |
| O0003 | C0003 | 08/08/2024 | 1 |

#### 6. Create index for customer_address.

| INDEX_NAME | INDEX_TYPE | TABLE_OWNER | TABLE_NAME | ... | UNIQUENESS |
| --- | --- | --- | --- | --- | --- |
| CUSTOMER_ID_PK | NORMAL | WKSP_IDI0710 | CUSTOMER | ... | UNIQUE |
| DRIVER_ID_PK | NORMAL | WKSP_IDI0710 | DELIVERY | ... | UNIQUE |
| IDX_CUSTOMER_ADDRESS | NORMAL | WKSP_IDI0710 | CUSTOMER | ... | NONUNIQUE |
| ITEM_ID_PK | NORMAL | WKSP_IDI0710 | MENU_ITEM | ... | UNIQUE |
| ORDER_ID_PK | NORMAL | WKSP_IDI0710 | ORDERS | ... | UNIQUE |
| PICKUP_ID_PK | NORMAL | WKSP_IDI0710 | PICKUP | ... | UNIQUE |
| RESTAURANT_ID_PK | NORMAL | WKSP_IDI0710 | RESTAURANT | ... | UNIQUE |
| SYS_C00168342063 | NORMAL | WKSP_IDI0710 | CUSTOMER | ... | UNIQUE |
