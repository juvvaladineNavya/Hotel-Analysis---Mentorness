-- What is the total number of reservations in the dataset? 

Select count(booking_id) As Total_Reservations from `hotel reservation dataset`;

-- Which meal plan is the most popular among guests? 
SELECT type_of_meal_plan,count(type_of_meal_plan) As "popular meal plan"
from `hotel reservation dataset`
Group BY type_of_meal_plan
ORDER BY `popular meal plan` desc;

-- What is the average price per room for reservations involving children? 
SELECT round(avg(avg_price_per_room),2) As avg_price
from `hotel reservation dataset`
where no_of_children >0;

-- How many reservations were made for the year 20XX (replace XX with the desired year)?
SELECT count(Booking_ID) As 'Reservation_count'
from `hotel reservation dataset`
where year(new_arrival_date) ='2017';

-- What is the most commonly booked room type? 
SELECT room_type_reserved,count(room_type_reserved) As "count_ room type"
from `hotel reservation dataset`
Group BY room_type_reserved
ORDER BY `count_ room type` desc
LIMIT 1;

-- How many reservations fall on a weekend (no_of_weekend_nights > 0)?
SELECT count(no_of_weekend_nights)  As 'Reservation count'
from `hotel reservation dataset`
where no_of_weekend_nights > 0;

-- What is the highest and lowest lead time for reservations? 

select max(lead_time) as 'highest lead time', min(lead_time) as 'lowest lead time'
from `hotel reservation dataset`;

-- What is the most common market segment type for reservations

Select  market_segment_type,count(market_segment_type) As "count of segment"
from `hotel reservation dataset`
Group BY market_segment_type
ORDER BY `count of segment` desc
limit 1;

-- How many reservations have a booking status of "Confirmed"?
select count(booking_status) As Confirmed_bookings
from `hotel reservation dataset`
where booking_status = 'Not_Canceled';

-- What is the total number of adults and children across all reservations
select * , Adults+ children  as Total from (
select sum(no_of_adults) as 'Adults',sum(no_of_children) as 'children'
from `hotel reservation dataset`) as sq1;

-- What is the average number of weekend nights for reservations involving children

select round(avg(no_of_weekend_nights),1) as avg_days
from `hotel reservation dataset`
where no_of_children >0;

-- How many reservations were made in each month of the year?

select month(new_arrival_date) as monthh, 
count(case when year(new_arrival_date) = 2017 then Booking_ID else null end ) as '2017_booking',
count(case when year(new_arrival_date) = 2018 then Booking_ID else null end )as '2018_booking'
from `hotel reservation dataset`
group by  monthh;

-- What is the average number of nights (both weekend and weekday) spent by guests for each room type? 
select  room_type_reserved, round(avg(no_of_week_nights),0) as Avg_WeekNights,round(avg(no_of_weekend_nights),0) as Avg_WeekendNights
from `hotel reservation dataset`
group by room_type_reserved;

-- For reservations involving children, what is the most common room type, and what is the average price for that room type?

SELECT room_type_reserved,count(room_type_reserved) As "count_ room type",
round(avg(avg_price_per_room),0) as Avg_price
from `hotel reservation dataset`
where no_of_children >0
Group BY room_type_reserved
ORDER BY `count_ room type` desc;

-- Find the market segment type that generates the highest average price per room. 

select market_segment_type, round(avg(avg_price_per_room),0) as Avg_price
from `hotel reservation dataset`
group by market_segment_type
order by Avg_price desc;





