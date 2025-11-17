Ah bro, got you — you want a **Gold layer data catalog** where each column has a **clear, business-friendly description**, without source references.
Here’s a polished version:

---

# ✅ **Gold Layer Data Catalog (Business Descriptions)**

---

## **1️⃣ dim_customers**

**Purpose:** Contains all unique customers with enriched demographic and profile information for analytics, segmentation, and reporting.

| Column Name         | Data Type   | Description                                                                |
| ------------------- | ----------- | -------------------------------------------------------------------------- |
| **customer_key**    | INTEGER     | Unique surrogate key for each customer, used for joining with fact tables. |
| **customer_id**     | INT         | Original customer identifier from CRM systems.                             |
| **customer_number** | VARCHAR(50) | Internal customer number for operational tracking.                         |
| **first_name**      | VARCHAR(50) | Customer’s given name.                                                     |
| **last_name**       | VARCHAR(50) | Customer’s family name or surname.                                         |
| **country**         | VARCHAR(50) | Country where the customer resides.                                        |
| **gender**          | VARCHAR(50) | Customer’s gender; defaulted to 'n/a' if unknown.                          |
| **maritial_status** | VARCHAR(50) | Customer’s marital status (e.g., single, married).                         |
| **birthdate**       | DATE        | Customer’s date of birth.                                                  |
| **create_date**     | DATE        | Date when the customer profile was first created.                          |

---

## **2️⃣ dim_products**

**Purpose:** Stores all active products with enriched attributes, enabling product-level and category-level analytics.

| Column Name        | Data Type   | Description                                                           |
| ------------------ | ----------- | --------------------------------------------------------------------- |
| **product_key**    | INTEGER     | Unique surrogate key for each product, used for joins in fact tables. |
| **product_id**     | INT         | Original product identifier from source systems.                      |
| **product_number** | VARCHAR(50) | Internal product number for operational tracking.                     |
| **category_id**    | VARCHAR(50) | Identifier for the product category.                                  |
| **product_name**   | VARCHAR(50) | Official name of the product.                                         |
| **category**       | VARCHAR(50) | Name of the product category.                                         |
| **subcategory**    | VARCHAR(50) | Name of the product subcategory.                                      |
| **maintenance**    | VARCHAR(50) | Maintenance or service information associated with the product.       |
| **cost**           | INT         | Cost of the product.                                                  |
| **product_line**   | VARCHAR(50) | Product line or group classification.                                 |
| **start_day**      | DATE        | Date when the product became active or available for sale.            |

---

## **3️⃣ fact_sales**

**Purpose:** Central fact table capturing all sales transactions for analytics, reporting, and KPI calculations.

| Column Name        | Data Type   | Description                                                   |
| ------------------ | ----------- | ------------------------------------------------------------- |
| **order_number**   | VARCHAR(50) | Unique identifier for each sales order.                       |
| **product_key**    | INTEGER     | Surrogate key referencing the product sold.                   |
| **customer_key**   | INTEGER     | Surrogate key referencing the customer who made the purchase. |
| **order_date**     | DATE        | Date when the order was placed.                               |
| **shipping_date**  | DATE        | Date when the order was shipped.                              |
| **due_date**       | DATE        | Expected delivery date for the order.                         |
| **sales_amount**   | INT         | Total monetary value of the order line.                       |
| **sales_quantity** | INT         | Number of units sold in the order line.                       |
| **price**          | INT         | Price per unit of the product at the time of sale.            |

---

If you want, bro, I can also **polish this further into a Confluence/Markdown-ready table with bolded headers and aligned columns**, so it looks **professional in documentation**.

Do you want me to do that next?
