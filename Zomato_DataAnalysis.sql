select * from [dbo].[ZomatoData]

/* Distinct list of country codes */
select distinct CountryCode
from ZomatoData;

/* Distinct list of country names served by Zomato Restaurants */

select distinct dbo.ContryTable.Country
from ZomatoData, ContryTable
where ZomatoData.CountryCode = ContryTable.CountryCode;


/* Summarize: Total number of distinct countries */
select count(distinct dbo.ContryTable.Country) as TotalCountries
from ZomatoData, ContryTable
where ZomatoData.CountryCode = ContryTable.CountryCode;

/* List the distinct combination of country and city */
select distinct dbo.ContryTable.Country, [dbo].[ZomatoData].City
from ZomatoData, ContryTable
where ZomatoData.CountryCode = ContryTable.CountryCode;

/* How many restaurants are there in each country? 
Sort the data by the number of restaurants. */
select dbo.ContryTable.Country, count(dbo.ContryTable.Country) as No_Of_Restaurants
from ZomatoData, ContryTable 
where ZomatoData.CountryCode = ContryTable.CountryCode
group by  [dbo].[ContryTable].Country
order by 2 desc;

/* Find the total number of restaurants in each city and country */
select dbo.ContryTable.Country,[dbo].[ZomatoData].City , count(dbo.ContryTable.Country) as No_Of_Restaurants
from ZomatoData, ContryTable 
where ZomatoData.CountryCode = ContryTable.CountryCode
group by  [dbo].[ContryTable].Country,[dbo].[ZomatoData].City
order by 3 desc;

/* Find top 5 Countries with highest no. of Zomato listed restaurants */
select top 5 dbo.ContryTable.Country, count(dbo.ContryTable.Country) as No_Of_Restaurants
from ZomatoData, ContryTable 
where ZomatoData.CountryCode = ContryTable.CountryCode
group by  [dbo].[ContryTable].Country
order by 2 DESC;

/* List the cities with restaurants having average ratings of more than 4.5 */
select distinct [dbo].[ZomatoData].City, AVG([dbo].[ZomatoData].Rating) as Rating
from ZomatoData
where rating > 4.5
group by [dbo].[ZomatoData].City
order by 1 ASC;

/* Find the top 2 countries with average ratings of more than 4.5 */
select top 2 [dbo].[ContryTable].Country, AVG([dbo].[ZomatoData].Rating) as Rating
from ZomatoData, ContryTable 
where ZomatoData.CountryCode = ContryTable.CountryCode AND
Rating > 4.5
group by [dbo].[ContryTable].Country
order by 2 DESC;

