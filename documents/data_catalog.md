# Data Catalog for Gold Layer

## Overview
The Gold Layer represents the business-level data model, designed to support analytical and reporting use cases. It consists of **dimension views** and **fact views** structured in a star-schema style.

---

### 1. **gold.dim_customers**
- **Purpose:** Stores customer details enriched with demographic and geographic data.
- **Columns:**

| Column Name      | Data Type | Description                                                                                   |
|------------------|----------|-----------------------------------------------------------------------------------------------|
| customer_key     | INT      | Surrogate key uniquely identifying each customer record (generated in the view).             |
| customer_id      | INT      | Unique numerical identifier assigned to each customer (source system ID).                     |
| customer_number  | VARCHAR(50)     | Alphanumeric identifier representing the customer (business key).                             |
| first_name       | VARCHAR(50)     | Customer's first name.                                                                        |
| last_name        | VARCHAR(50)     | Customer's last name.                                                                         |
| country          | VARCHAR(50)     | Country of residence (e.g., 'Australia').                                                     |
| marital_status   | VARCHAR(50)     | Marital status (e.g., 'Married', 'Single', 'n/a').                                            |
| gender           | VARCHAR(50)     | Customer gender, prioritising CRM data and falling back to ERP (e.g., 'Male', 'Female').      |
| birthdate        | DATE     | Customer date of birth (YYYY-MM-DD).                                                          |
| create_date      | DATE     | Date when the customer record was created in the source system.                               |

---

### 2. **gold.dim_products**
- **Purpose:** Provides current product information and attributes for analytical use.
- **Note:** Only the **current active version** of each product is included (`prd_end_dt IS NULL`).
- **Columns:**

| Column Name          | Data Type | Description                                                                                   |
|----------------------|----------|-----------------------------------------------------------------------------------------------|
| product_key          | INT      | Surrogate key uniquely identifying each product record (generated in the view).              |
| product_id           | INT      | Unique identifier assigned to the product (source system ID).                                 |
| product_number       | VARCHAR(50)     | Business identifier for the product.                                                          |
| product_name         | VARCHAR(50)     | Descriptive name of the product.                                                              |
| category_id          | VARCHAR(50)     | Identifier for the product category.                                                          |
| category             | VARCHAR(50)     | High-level product classification (e.g., Bikes, Components).                                 |
| subcategory          | VARCHAR(50)     | More detailed product classification.                                                         |
| maintenance          | VARCHAR(50)     | Indicates whether the product requires maintenance.                                           |
| cost                 | INT      | Cost of the product in monetary units.                                                        |
| product_line         | VARCHAR(50)     | Product line classification (e.g., Road, Mountain).                                           |
| start_date           | DATE     | Date when the product became active.                                                          |

---

### 3. **gold.fact_sales**
- **Purpose:** Stores transactional sales data for analytical purposes.
- **Columns:**

| Column Name     | Data Type | Description                                                                                   |
|-----------------|----------|-----------------------------------------------------------------------------------------------|
| order_number    | VARCHAR(50)     | Unique identifier for each sales order (e.g., 'SO54496').                                     |
| product_key     | INT      | Foreign key linking to `gold.dim_products`.                                                    |
| customer_key    | INT      | Foreign key linking to `gold.dim_customers`.                                                   |
| order_date      | DATE     | Date when the order was placed.                                                               |
| shipping_date   | DATE     | Date when the order was shipped.                                                              |
| due_date        | DATE     | Date when the payment was due.                                                                |
| sales_amount    | INT      | Total sales amount for the line item.                                                         |
| quantity        | INT      | Number of units sold.                                                                         |
| price           | INT      | Price per unit.                                                                               |
