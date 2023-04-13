--show full table
SELECT * FROM YouTubeData.dbo.[Viewship by country 2022]

--Gets a count of distinct continents
SELECT COUNT(DISTINCT Continent) AS NumContinents FROM YouTubeData.dbo.[Viewship by country 2022]

--views by continents
SELECT Continent, SUM(Views) AS TotalViews FROM YouTubeData.dbo.[Viewship by country 2022]
Group by Continent
Order by TotalViews DESC

--Overall total views from all countries
SELECT SUM(Views) AS TotalViews FROM YouTubeData.dbo.[Viewship by country 2022]

--Shows views from the top 5 countries that viewed the most
SELECT Country, views_category, Views FROM YouTubeData.dbo.[Viewship by country 2022]
WHERE views_category = 'Top 5'
Order by Views DESC

--Total views from Top 5 countries
SELECT SUM(Views) AS Top5Views FROM YouTubeData.dbo.[Viewship by country 2022]
WHERE views_category = 'Top 5'

--Total views from bottom 15 countries
SELECT SUM(Views) AS Bottom15Views FROM YouTubeData.dbo.[Viewship by country 2022]
WHERE views_category = 'bottom 15'

--Average view duration by country
SELECT Country, Average_view_duration_per_video_in_seconds FROM YouTubeData.dbo.[Viewship by country 2022]
Order by Average_view_duration_per_video_in_seconds DESC

--Average time viewed per person
--This shows the Average total amount of a time a person views a videos on the channel by country
SELECT Country, (Views/Watch_time_hours) AS AvgViewTimePerPerson FROM YouTubeData.dbo.[Viewship by country 2022]
order by AvgViewTimePerPerson DESC

--Looking at viewership data from countries in Asia
SELECT Country, Views, Average_view_duration_per_video_in_seconds FROM YouTubeData.dbo.[Viewship by country 2022]
WHERE Continent = 'Asia'
ORDER BY Views DESC

--Looking at viewership data from all countries not in Asia
SELECT Country, Views, Average_view_duration_per_video_in_seconds FROM YouTubeData.dbo.[Viewship by country 2022]
WHERE Continent != 'Asia'
ORDER BY Views DESC

SELECT COUNT(Country) AS NumNACountries FROM YouTubeData.dbo.[Viewship by country 2022]
WHERE Continent = 'North America'


--Sum of all views from Europe
SELECT SUM(Views) AS EU_Views FROM YouTubeData.dbo.[Viewship by country 2022]
WHERE Continent = 'Europe'

--The average view duration globally
SELECT AVG(Average_view_duration_per_video_in_seconds) AS TotalAVG_view_duration FROM YouTubeData.dbo.[Viewship by country 2022]

--Shows countries in Asia that have over 2mil views
SELECT Country, Views FROM YouTubeData.dbo.[Viewship by country 2022]
WHERE Views > 2000000 AND Continent = 'Asia'
Order By Views DESC

--Shows views from all countries in North America or South America
SELECT Country, Views FROM YouTubeData.dbo.[Viewship by country 2022]
WHERE Continent = 'North America' OR Continent = 'South America'
Order By Views DESC


--Categorizes the countries by those who have over 2million views
SELECT Country, Views, 
CASE
	WHEN Views > 2000000 THEN 'Over 2mil'
	ELSE 'Under 2mil'
END AS category
FROM YouTubeData.dbo.[Viewship by country 2022]
ORDER BY VIEWS DESC