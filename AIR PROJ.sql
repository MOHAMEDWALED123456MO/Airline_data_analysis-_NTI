--1
SELECT airline, SUM(CAST(price AS BIGINT)) AS total_price
FROM FlightData
GROUP BY airline
order by total_price desc;


-- 2
    
select airline , class, SUM(CAST(price AS BIGINT))AS total_price from FlightData
group by airline,class
order by total_price desc;



--3
select source_city,destination_city ,count(*) as 'No of Flight between Cities',sum(price) as 'Total price',avg(price) as 'Avg Price for each flight' ,max(price) AS 'Max tickets between two cities',min(price)AS 'Min tickets between two cities'  from FlightData
group by source_city,destination_city
order by count(*) desc ,sum(price) desc ,Avg(price) desc;

--4

select class,count(*) as 'No of tickets' ,SUM(CAST(price AS BIGINT)) as 'Total Price',avg(CAST(price AS BIGINT))as 'Avg Price'  from FlightData
group by class
order by [Total Price] desc ;

--5
SELECT 
    CONCAT(RIGHT('0' + CAST(FLOOR(duration) AS VARCHAR), 2), ':', RIGHT('0' + CAST(ROUND((duration - FLOOR(duration)) * 60, 0) AS VARCHAR), 2)) AS time_in_hours_minutes,
    AVG(CAST(price AS BIGINT)) AS 'Avg Price'
FROM FlightData
GROUP BY CONCAT(RIGHT('0' + CAST(FLOOR(duration) AS VARCHAR), 2), ':', RIGHT('0' + CAST(ROUND((duration - FLOOR(duration)) * 60, 0) AS VARCHAR), 2))
ORDER BY CONCAT(RIGHT('0' + CAST(FLOOR(duration) AS VARCHAR), 2), ':', RIGHT('0' + CAST(ROUND((duration - FLOOR(duration)) * 60, 0) AS VARCHAR), 2)) DESC ,[Avg Price];


--6
select airline,class ,avg(duration) AS 'Avg of Duration'from FlightData
group by airline,class
order by [Avg of Duration] asc;



--7
SELECT departure_time, airline, class, COUNT(*) AS 'No of tickets'
FROM FlightData
GROUP BY departure_time, airline, class
ORDER BY
    CASE departure_time
        WHEN 'Early_Morning' THEN 1
        WHEN 'Morning'       THEN 2
        WHEN 'Afternoon'     THEN 3
        WHEN 'Evening'       THEN 4
        WHEN 'Night'         THEN 5
        WHEN 'Late_Night'    THEN 6
    END,
    airline, class;

--8
SELECT stops, class,
       AVG(CAST(price AS BIGINT)) AS avg_price,
       AVG(duration) AS avg_duration
FROM FlightData
GROUP BY stops, class
ORDER BY class, stops;
 


 --9
 select destination_city , count (*) as 'No of Tickets' from FlightData
group by destination_city
order by count(*) desc; 


--10
SELECT departure_time, arrival_time,
       COUNT(*) AS no_of_tickets,
       AVG(CAST(price AS DECIMAL(18,2))) AS avg_price
FROM FlightData
WHERE class = 'Economy'
GROUP BY departure_time, arrival_time
ORDER BY avg_price;




--11

SELECT airline,
       COUNT(DISTINCT flight) AS distinct_flight_codes,
       COUNT(*) AS no_of_listings,
       COUNT(*) / COUNT(DISTINCT flight) AS listings_per_code
FROM FlightData
GROUP BY airline
ORDER BY distinct_flight_codes DESC;


--12
SELECT days_left, class,
       AVG(CAST(price AS DECIMAL(18,2))) AS avg_price
FROM FlightData
GROUP BY days_left, class
ORDER BY days_left, class;