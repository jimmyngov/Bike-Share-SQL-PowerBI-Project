# Bike-Share-SQL-PowerBI-Project
## **Cyclistic Bike-Share Case Study**
* This exercise is a case study that was provided by Coursera's Google Data Analytics program as a final project. Students were provided with a prompt that painted a scenario for the fictional company "Cyclistic", along with stakeholder questions. The excel data can be retrieved from https://divvy-tripdata.s3.amazonaws.com/index.html.

## **1. Project Objective:**
* Create a Power BI dashboard imported from a SQL database that contains 12 months of biking data (from June 2021 to May 2022 with 5,793,778 rows) in order to answer the key business questions of the stakeholders:
  1. How do annual members differ from casual riders in bike usage?
  2. Why would casual riders purchase annual memberships?
  3. How can digital media be used to market in pursuit of increase in memberships?
  
## **2. Data Description:**
* Tables:
  * dbo.'202106-divvy-tripdata$': Table consisting of biking trip data from June 2021.
  * dbo.'202107-divvy-tripdata$': Table consisting of biking trip data from July 2021.
  * dbo.'202108-divvy-tripdata$': Table consisting of biking trip data from August 2021.
  * dbo.'202109-divvy-tripdata$': Table consisting of biking trip data from September 2021.
  * dbo.'202110-divvy-tripdata$': Table consisting of biking trip data from October 2021.
  * dbo.'202111-divvy-tripdata$': Table consisting of biking trip data from November 2021.
  * dbo.'202112-divvy-tripdata$': Table consisting of biking trip data from December 2021.
  * dbo.'202201-divvy-tripdata$': Table consisting of biking trip data from January 2022.
  * dbo.'202202-divvy-tripdata$': Table consisting of biking trip data from February 2022.
  * dbo.'202203-divvy-tripdata$': Table consisting of biking trip data from March 2022.
  * dbo.'202204-divvy-tripdata$': Table consisting of biking trip data from April 2022.
  * dbo.'202205-divvy-tripdata$': Table consisting of biking trip data from May 2022.
  
* Fields:
  * ride_id: ID assigned to that specific ride trip.
  * start_station_id: ID assigned to the station name/location. 
  * end_station_name: Name/location of station that ride trip ended at.
  * start_lat: Latitude of start location.
  * start_lng: Longitude of start location.
  * end_lat: Latitude of end location.
  * end_lng: Longitude of end location.
  * member_casual: Type of rider; membership or casual. 
  * rideable_type: Type of bike.
  * started_at: Date and time rider started their trip.
  * ended_at: Date and time rider ended their trip.
  * ridelength_decimalhours: Custom field created to generate the amount of time spent per trip in decimal hours. Used "CAST(DATEDIFF(MINUTE, started_at, ended_at)/60.0 AS DECIMAL(35,2)) AS ridelength_decimalhours" in SQL Server. 
  * day_of_week: Custom field created to generate the name of the day of the week that the trip was taken on. Used "DATENAME(WEEKDAY, started_at) AS day_of_week" in SQL Server.
  * Day_NumberSort: Custom field created to generate the number of the day of the week that the trip was taken on (Sunday = 1, Monday = 2, etc). Used "DATEPART(WEEKDAY, started_at) AS Day_NumberSort" in SQL Server.
  * hour_started: Custom field created to generate the hour of day (in military time) that the rider started their trip on. Used "DATEPART(HOUR, started_at) AS hour_started" in SQL Server.
  * Total Rides: Custom field created to generate the total amount of ride trips taken in the 12 month span. Used "Total Rides = COUNTROWS(Query1)" in Power BI.
  
## **3. Project Sequence:**
A. Imported all of the bike-share trip excel data into a local SQL database. Executed queries on relevant fields in preparation for dashboard.
  * Used the UNION ALL command to combine all columns from 202106, 202107, 202108, 202109, 202110, 20211, 202112, 202201, 202202, 202203, 202204, and 202205.
  * There were some data type incosistencies and all data types must match in each table in order to perform UNION ALL and combine. Used CONVERT(nvarchar(255) on:
    * start_station_id for 202107, 202111, and 202204.
    * end_station_id for 202107
    
    ![un1](https://user-images.githubusercontent.com/122722167/218680100-15c57404-7abc-468c-998d-b767b9468203.png)
  
  * Used queries to generate new columns:
    * ridelength_decimalhours: Extracted the duration of the biking trip in hour decimals by subtracting the time ended_at by the time started_at formatted in minutes/60.0. (I.E. 0.27 hour decimal ride trip x 60 would equate to 16.2 minutes)   
    * day_of_week: Extracted the name of the day of the week the trip was started from started_at.
    * Day_NumberSort: Extracted the number of the day of the week trip was started from started_at. (Necessary to sort by column day_of_week in Power BI to achieve chronological order in day names).
    * hour_started: Extracted the hour the ride trip was started in military time from started_at.
    
    ![SQLQuery](https://user-images.githubusercontent.com/122722167/218683669-ebda7f94-9290-4cde-bbdb-b1d6e71f8344.png)

B. Imported queries from SQL Server database to Power BI.
  * Generated new field to obtain Total Rides and aid in data visualization.
  
  ![TotalRides](https://user-images.githubusercontent.com/122722167/218687946-0fa06de1-3dd2-4991-9376-c78e7923e4ea.png)

  * Used sort by column on day_of_week by Day_NumberSort to achieve chronological order in day names when utilized in data visualization.
 
 ![SortbyColumns](https://user-images.githubusercontent.com/122722167/218695197-548a508d-a97d-42de-a923-96f63a49b708.png)

C. Designed a visual dashboard that helps solve the stakeholder's key business questions.
  * The right portion of the dashboard displays the Total Ride trips taken from June 2021 to May 2022, along with Sum of Ride Length Hours, and Average of Ride Length Hours. This is accompanied by a matrix chart that provides a breakdown on casual and annual membership rider's Total Ride trips, Sum of Ride Length Hours, and Average of Ride Length Hours throughout the observed timespan. Below that is a line chart that shows the change in total ride length over time by casual and annual membership riders.
  * The middle portion incorporates column charts to display casual and annual membership rider's:
    * Total rides by the hour of day they started their trip.
    * Total rides by the day of the week they started their trip.
  * The left portion consists of:
    * Two Donut Charts:
      * The first displays total rides by each member type; showing total number and percentage.
      * The second displays total hours spent riding by each member type; showing total number and percentage.
    * Two Bar Charts:
      * The first displays total rides of each bike type by each member type.
      * The second displays each member type's average ride length hour by the day of the week. 
  
  ![DashComplete](https://user-images.githubusercontent.com/122722167/218702425-73ff38bb-42ef-4823-98ab-266acd20be52.png)

* Incorporation of dashboard slicer that allows the user to filter by the desired station's name to be displayed on the visual dashboard.

![Station](https://user-images.githubusercontent.com/122722167/218703523-e1b0f751-3584-4244-b265-08bc693262ca.png)

* Incorporation of dashboard slicer that allows the user to filter by the desired member type to be displayed on the visual dashboard.

![Member](https://user-images.githubusercontent.com/122722167/218704128-219dab74-f421-4b2c-bd80-93cfada4bd44.png)

## **4. Key Findings:**
* From the dashboard we created we can conclude that: 
  * Annual Membership Riders:
    * Have a consistent ride length of < 0.2 hour decimals or ~ 12 minutes.
    * Do not ride docked bikes, while using electric and classic bikes more than casual riders.
    * Peak time of day in riders would be 8 AM and 5 PM.
    * Shows consistency in usage with highs on the weekdays.
    * Fairly consistent riding hours all year round.
    * Were shown to take more total trips throughout the 12 month timespan (56.6%), however was shown to have less total riding hours (35.7%).
  * On the other hand casual riders:
    * Have longer ride durations, with no cosistency.
    * The only type of riders that use docked bikes.
    * Peak time of day in riders would be 5PM, but significantly lower in comparison to annual membership riders.
    * Indicates a higher usage during the weekends.
    * Indicates a spike in riding hours during May, June, and July (With the peak being June).
    * Were shown to take less total trips throughout the 12 month timespan (43.4%), however was shown to have more total ridings hours (64.3%).

* Some suggestions:
    * Launch weekend passes that enables holders to have unlimited 35 minute trips for only Saturday and Sunday(targeting Casual Riders, since they mainly ride on the weekends). This would be presented at an appealingly lower price in comparison to the traditional annual pass with consideration of the spike in usage during the summer months by casual riders. With the possibility of different tiers of seasonal passes; slower seasons with pricing discounts.
    * Introduce a loyalty program or rewards for referral to provide incentives.
    * Showcase positive statistics when marketing; money saved on gas with bike usage, improved life expectancy, environmental benfits/decreased air pollution, and calories burned.

* In terms of utilizing digital media to market, it is important to have a strong, interactive presence on the main social media platforms such as: Twitter, Instagram, FaceBook, TikTok and Youtube. Marketing should be tailored to bring on associations of hip and trendy with the brand. However, to better expand in marketing would require more data on user demographics such as: interests, age group, home address, gender, education, occupation, height, weight, and BMI.  
