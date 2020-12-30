create database HousePrice;
use HousePrice;


CREATE TABLE house_t (
    id    INT		        NOT NULL,
    datesold  date,
    postcode  INT,
    price  float,
	propertyType   varchar(50),
	bedroom	INT,
    PRIMARY KEY (id)
)



BULK
INSERT house_t
FROM 'C:\Users\wingy\Desktop\TS project\TimeSeries Group project\raw_sales.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR =',',
ROWTERMINATOR = '\n'
)
GO


select* from house_t



select left(datesold, 7) as solddate, round(sum(price)/count(datesold),2) as price, propertyType,bedroom
from
(select left(datesold, 10) as datesold, price, propertyType, bedroom
from house_t
where bedroom=4
and datesold>='2008-01-15' and datesold<='2019-07-27'and propertyType='house'
group by datesold,propertyType,bedroom, price
) as date_t
group by left(datesold, 7),propertyType,bedroom
order by solddate






select left(datesold, 10) as datesold, price, propertyType, bedroom
from house_t
where datesold>='2008-01-15' and datesold<='2019-07-27'
group by datesold,propertyType,bedroom, price
order by datesold
