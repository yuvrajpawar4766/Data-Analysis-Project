# 🏨 ITV Hotels Dashboard (Power BI)

## 📌 Project Overview
The **ITV Hotel Dashboard** is a 3-page interactive Power BI report designed to analyze hotel business performance.  
It provides insights into **revenue, bookings, hotel utilization, cancellations, and customer behavior** to support data-driven decision-making.  

The dashboard is divided into 3 main pages:
1. **Business Overview** – revenue and booking snapshot
2. **Hotel Performance** – operational efficiency metrics
3. **Room & Customer Insights** – guest behavior and room usage trends  

---

## 🗂 Dataset Description
The dashboard is built on a **Snowflake schema model** with fact and dimension tables:

- **fact_bookings** → Detailed booking transactions (guests, booking_id, status, revenue, platform, rating)  
- **fact_aggregated_bookings** → Aggregated metrics like capacity and successful bookings  
- **dim_hotels** → Hotel details (property name, city, category: Luxury/Business)  
- **dim_rooms** → Room classes (Standard, Elite, Premium, Presidential) and categories  
- **dim_date** → Date hierarchy (date, month, week, day type: weekday/weekend)  

---

## 📊 KPIs Used
- **Total Revenue Realized**  
- **Total Bookings / Active Bookings**  
- **Average Rating**  
- **Occupancy Rate (%)**  
- **Cancellation Rate (%)**  
- **Average Length of Stay**  
- **Average Daily Rate (ADR)**  
- **Revenue per Available Room (RevPAR)**  
- **Average Lead Time (days)**  
- **Average Guests per Booking**  
- **Weekend Booking %**  
- **Peak Booking Week**  

---

## 📈 Visualizations Included
- Donut chart → Bookings by platform  
- Bar charts → Revenue by city, bookings per hotel  
- Stacked bar → Booking status distribution (Checked Out, Cancelled, No Show)  
- Line charts → Revenue/Occupancy trends over time   
- Tables → Property-wise revenue, occupancy, guest counts  
- Pie charts → Weekend vs Weekday bookings, booking platform contribution  
- Room Analysis → Room class contribution to bookings  

---

## 💡 Key Insights
- **High cancellation rate (~25%)** leads to major revenue leakage  
- **Revenue concentrated** in Mumbai & Luxury hotels → underperformance in Delhi, Hyderabad, and some properties like ITV Seasons  
- **Occupancy rate (~58%)** shows unused capacity → opportunity to increase utilization  
- **Customers book late** (avg lead time ~3–4 days) and usually in **small groups (~2 guests)**  
- **Weekend bookings (28%)** are significant → strong leisure demand  
- **OTA platforms dominate** bookings, increasing dependence on third-party channels  

---

## 🚀 How to Open the Dashboard
1. Download the file **`ITV_Hotel_Dashboard.pbix`** from this repository  
2. Open it using **Microsoft Power BI Desktop (free)**  
3. Navigate across 3 pages to explore:
   - Business Overview  
   - Hotel Performance  
   - Room & Customer Insights  

---

## 📷 Dashboard Screenshots
### Business Overview
![Business Overview](images/business_overview.png)

### Hotel Performance
![Hotel Performance](images/hotel_performance.png)

### Room & Customer Insights
![Customer Insights](images/customer_insights.png)

---

## 🛠️ Tools Used
- **Power BI Desktop** (DAX, Data Modeling, Visualizations)  
- **Snowflake Schema** data modeling approach  


