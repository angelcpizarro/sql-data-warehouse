# **Naming Conventions**

This document outlines the naming conventions used for schemas, tables, views, columns, and other objects in the data warehouse.

## **Table of Contents**

1. [General Principles](#general-principles)
2. [Table Naming Conventions](#table-naming-conventions)
   - [Bronze Rules](#bronze-rules)
   - [Silver Rules](#silver-rules)
   - [Gold Rules](#gold-rules)
3. [Column Naming Conventions](#column-naming-conventions)
   - [Surrogate Keys](#surrogate-keys)
   - [Technical Columns](#technical-columns)
4. [SQL Script Naming Conventions](#sql-script-naming-conventions)

---

## **General Principles**

- **Naming Style**: Use `snake_case`, with lowercase letters and underscores (`_`) to separate words.
- **Language**: Use English for all names.
- **Avoid Reserved Words**: Do not use SQL reserved words as object names.
- **Clarity over Brevity**: Prefer clear and descriptive names over abbreviations.

---

## **Table Naming Conventions**

### **Bronze Rules**
- Table names must reflect the source system and retain the original structure as closely as possible.
- No transformations or renaming should be applied at this layer.

- **Pattern**:  
  **`<sourcesystem>_<entity>`**

  - `<sourcesystem>`: Name of the source system (e.g., `crm`, `erp`)  
  - `<entity>`: Original table name from the source system  

- Example:  
  `crm_cust_info` → Customer information from the CRM system

---

### **Silver Rules**
- Table names must follow the same naming as the bronze layer for consistency.
- Data is cleaned and standardized, but table names remain unchanged.

- **Pattern**:  
  **`<sourcesystem>_<entity>`**

- Example:  
  `crm_cust_info` → Cleaned and standardized customer data

---

### **Gold Rules**
- Table names must be business-oriented and easy to understand for analytical use.

- **Pattern**:  
  **`<category>_<entity>`**

  - `<category>`: Table type (e.g., `dim`, `fact`, `report`)  
  - `<entity>`: Descriptive name of the table, aligned with the business domain  

- Examples:
  - `dim_customers` → Customer dimension table  
  - `fact_sales` → Sales fact table  

#### **Glossary of Category Patterns**

| Pattern   | Meaning            | Example(s)                          |
|-----------|-------------------|-------------------------------------|
| `dim_`    | Dimension table   | `dim_customers`, `dim_products`     |
| `fact_`   | Fact table        | `fact_sales`                        |
| `report_` | Reporting table   | `report_sales_monthly`              |

---

## **Column Naming Conventions**

### **Surrogate Keys**
- All surrogate keys must use the suffix `_key`.

- **Pattern**:  
  **`<entity>_key`**

- Example:  
  `customer_key` → Surrogate key in `dim_customers`

---

### **Technical Columns**
- Technical (system-generated) columns must use the prefix `dwh_`.

- **Pattern**:  
  **`dwh_<column_name>`**

- Examples:
  - `dwh_create_date` → Timestamp when the record was created in the warehouse  

---

## **SQL Script Naming Conventions**

- SQL scripts must be named using a numeric prefix to indicate execution order.

- **Pattern**:  
  **`<order>_<action>_<layer>.sql`**

- Examples:
  - `01_create_schemas.sql`
  - `02_ddl_bronze.sql`

- Guidelines:
  - Use clear and descriptive names
  - Maintain consistent ordering
  - Separate creation, loading, and validation logic into different scripts
