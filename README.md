

---

# 🚀 Sales Data Warehouse Project (PostgreSQL + Medallion Architecture)

Welcome to the **Sales Data Warehouse Project**!
This repository showcases a complete end-to-end modern data warehouse using **PostgreSQL**, built using industry-standard Medallion Architecture (**Bronze → Silver → Gold**).

The goal of this project is to demonstrate real-world **data engineering**, **ETL pipeline development**, **data modeling**, and **analytics** capabilities using actual business data from CRM & ERP source systems.

---

## 🏗️ Data Architecture (Medallion Design)

The project follows the modern **Medallion Architecture**, separating data into three clearly defined layers:

1. **Bronze Layer** — Raw ingested data from CSV files
2. **Silver Layer** — Cleaned, validated, standardized data
3. **Gold Layer** — Business-ready star-schema model for analytics

<img width="1280" height="903" alt="image" src="https://github.com/user-attachments/assets/f12aa1d3-1fcc-4a5e-91fa-a2091edda8e2" />


---

## 📖 Project Overview

This project includes:

### ✅ **1. Data Architecture & Schema Design**

* Designed a three-layer DWH in PostgreSQL
* Modeled fact and dimension tables for analytical reporting
* Implemented best practices for naming conventions and schema separation

### ✅ **2. ETL Pipelines**

* Loaded source CSVs into Bronze layer
* Applied transformations & cleansing into the Silver layer
* Generated business-ready star schema in the Gold layer

<img width="1280" height="482" alt="image" src="https://github.com/user-attachments/assets/22e8ae5a-d52d-489b-8407-bdb5d07fff01" />


### ✅ **3. Data Modeling**

* **Fact table:** Sales
* **Dimensions:** Customers, Products
* Includes surrogate keys, denormalization, and proper relationships


<img width="1280" height="905" alt="image" src="https://github.com/user-attachments/assets/8b85b48b-57b4-40ec-a5a2-065c797e9da2" />


### ✅ **4. Analytics & Reporting**

Used SQL queries to deliver insights on:

* Customer behavior
* Product category performance
* Sales trends over time
* Revenue and quantity metrics

---

## 🎯 Skills Demonstrated



* Data Engineering
* Data Warehousing (PostgreSQL)
* ETL Pipeline Development
* SQL Development
* Data Modeling (Star Schema)
* Analytics & Insight Generation



---

## 🛠️ Tools & Technologies

* **PostgreSQL** (main DWH)
* **CSV Source Files** (CRM + ERP systems)
* **DBeaver / TablePlus / PgAdmin** (management GUIs)
* **Draw.io** (architecture & diagrams)
* **GitHub** (version control)

---

## 📂 Repository Structure

```
sales-datawarehouse/
│
├── datasets/                     # Raw CSV files from CRM and ERP systems
│
├── docs/                         # Documentation and diagrams
│   ├── architecture.drawio       # Medallion architecture diagram
│   ├── data_flow.drawio          # Full ETL pipeline visual
│   ├── data_model.drawio         # Star schema (fact + dimensions)
│   ├── data_catalog.md           # Field descriptions for Gold layer
│
├── scripts/
│   ├── bronze/                   # Scripts for loading raw source data
│   ├── silver/                   # Scripts for cleaning & transformations
│   ├── gold/                     # Scripts for building star schema
│
├── tests/                        # Data quality tests
│
├── README.md                     # Project overview (this file)
└── .gitignore
```

---

## ⚙️ ETL Pipeline Summary

### **Bronze Layer**

* Loads raw customer, product, and sales data from CSV files
* No transformations — just ingestion

### **Silver Layer**

* Cleans gender inconsistencies
* Standardizes date formats
* Resolves missing values
* Normalizes customer, product, and location information

### **Gold Layer (Star Schema)**

Includes:

#### ⭐ **Dimension: Customers**

Contains cleaned customer data enriched with ERP attributes

* Surrogate customer key
* Name, country, gender, birthdate

#### ⭐ **Dimension: Products**

Combines CRM product data with ERP category mappings

* Product categories
* Product line
* Maintenance type

#### ⭐ **Fact: Sales**

Main analytical table

* Order dates
* Product & customer foreign keys
* Sales amount, quantity, price

---

## 🧪 Data Quality Checks

Included tests ensure:

* No duplicate IDs
* No null keys
* Valid date formats
* Referential integrity between fact and dimensions

---

## 📊 Insights You Can Generate

* Top customers by revenue
* Category-level performance
* Revenue trends by month
* High-value product segments
* Order efficiency (order vs shipping date)

---

## 🚀 Future Enhancements

Planned improvements include:

* Adding Slowly Changing Dimensions (SCD Type 2)
* Automating ETL with Airflow or Prefect
* Creating dashboards (Tableau, Power BI)
* Supporting incremental loads

---

## 🤝 Connect With Me

Feel free to connect or message if you want help improving your portfolio or adding new features to this project.

