SELECT * FROM zomato12
--What is the distribution of restaurant ratings?
Select Aggregate_rating,count(*) as count from zomato12
group by Aggregate_rating
order by Aggregate_rating asc;

--How many restaurants offer online delivery?
select Has_Online_delivery,count(*) as Restaurants  from zomato12
group by Has_Online_delivery;

--What is the average amount for two across different cities?
select top 25 city,avg(Average_Cost_for_two) as avg_amount 
from zomato12
group by City 
order by avg_amount desc;

--Identify the top 5 cuisines available across restaurants.
select top 5 Cuisines,COUNT(*) as counts  from zomato12
group by Cuisines
order by counts desc;

--How does the price range vary across different localities?
select top 10 Locality,SUM(Price_range)AS Price_range from zomato12
GROUP BY Locality
order by Price_range desc;


--Compare the number of restaurants that allow table booking versus those that do not.
select Has_Table_booking ,count(*)as count from zomato12
group by Has_Table_booking

--What are the most common restaurant names (if any)?
select top 5 Restaurant_Name,	count(*)as count from zomato12
group by Restaurant_Name
order by count desc;

--How many unique cities are represented in the dataset?
SELECT COUNT(DISTINCT City) AS unique_cities
FROM zomato12;

--Identify the top 5 restaurants with the highest number of votes.
select top 5 Restaurant_Name,Votes from zomato12
order by Votes desc;

--How do restaurant ratings vary between restaurants that offer online delivery and those that do not?
SELECT Has_online_delivery, AVG(Aggregate_rating) AS avg_rating
FROM zomato12
GROUP BY Has_online_delivery;

--How many restaurants are there in each country?
select [Country-Code].Country,count(*) as count
from [Country-Code]
join zomato12 on [Country-Code].Country_Code =zomato12.Country_Code
group by Country
order by count desc;

--What is the average aggregate rating of restaurants in each country?
select [Country-Code].Country, Avg(Aggregate_rating) as avg_rating
from [Country-Code]
JOIN 
zomato12 ON [Country-Code].Country_Code = zomato12.Country_Code
group by Country;

--How many restaurants in each country offer online delivery?
select [Country-Code].Country, Has_Online_delivery,count(*) as count
from [Country-Code]
JOIN 
zomato12 ON [Country-Code].Country_Code = zomato12.Country_Code
group by Country,Has_Online_delivery
order by count desc;