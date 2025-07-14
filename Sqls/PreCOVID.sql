CREATE TABLE precovidgrowth(
	country VARCHAR(45),
	measure VARCHAR(25),
	growth FLOAT,
	type VARCHAR(45)
);

INSERT INTO precovidgrowth
SELECT 
	s.country,
	s.stockID, 
	AVG((t2.price - t1.price)/t1.price * 100),
	'monthly'
FROM stocks AS s
INNER JOIN stockprices AS t1, stockprices AS t2
WHERE s.stockID = t1.stock
	AND t1.stock = t2.stock
	AND t2.date = date_add(t1.date, interval 1 month)
	AND YEAR(t2.date) < 2020
GROUP BY s.stockID;

INSERT INTO precovidgrowth
SELECT 
	t1.country,
	'GDP',
	AVG((t2.value - t1.value)/t1.value * 100),
	'yearly'
FROM gdp AS t1
INNER JOIN gdp AS t2
WHERE t1.country = t2.country
	AND t2.date = date_add(t1.date, interval 1 year)
	AND YEAR(t2.date) < 2020
GROUP BY t1.country;

INSERT INTO precovidgrowth
SELECT 
	t1.country,
	'GDP pc',
	AVG((t2.value - t1.value)/t1.value * 100),
	'yearly'
FROM gdppc AS t1
INNER JOIN gdppc AS t2
WHERE t1.country = t2.country
	AND t2.date = date_add(t1.date, interval 1 year)
	AND YEAR(t2.date) < 2020
GROUP BY t1.country;

INSERT INTO precovidgrowth
SELECT 
	t1.country,
	'GDP PPP',
	AVG((t2.value - t1.value)/t1.value * 100),
	'yearly'
FROM gdpppp AS t1
INNER JOIN gdpppp AS t2
WHERE t1.country = t2.country
	AND t2.date = date_add(t1.date, interval 1 year)
	AND YEAR(t2.date) < 2020
GROUP BY t1.country;

INSERT INTO precovidgrowth
SELECT 
	t1.country,
	'GDP PPP pc',
	AVG((t2.value - t1.value)/t1.value * 100),
	'yearly'
FROM gdpppppc AS t1
INNER JOIN gdpppppc AS t2
WHERE t1.country = t2.country
	AND t2.date = date_add(t1.date, interval 1 year)
	AND YEAR(t2.date) < 2020
GROUP BY t1.country;

INSERT INTO precovidgrowth
SELECT 
	t1.country,
	'Gini Index',
	AVG((t2.value - t1.value)/t1.value * 100),
	'yearly'
FROM giniindex AS t1
INNER JOIN giniindex AS t2
WHERE t1.country = t2.country
	AND t2.date = date_add(t1.date, interval 1 year)
	AND YEAR(t2.date) < 2020
GROUP BY t1.country;

INSERT INTO precovidgrowth
SELECT 
	t1.country,
	'Poverty Rate',
	AVG((t2.value - t1.value)/t1.value * 100),
	'yearly'
FROM poverty AS t1
INNER JOIN poverty AS t2
WHERE t1.country = t2.country
	AND t2.date = date_add(t1.date, interval 1 year)
	AND YEAR(t1.date) < 2020
GROUP BY t1.country;

INSERT INTO precovidgrowth
SELECT 
	t1.country,
	'Unemployment Rate',
	AVG((t2.value - t1.value)/t1.value * 100),
	'yearly'
FROM poverty AS t1
INNER JOIN poverty AS t2
WHERE t1.country = t2.country
	AND t2.date = date_add(t1.date, interval 1 year)
	AND YEAR(t2.date) < 2020
GROUP BY t1.country;