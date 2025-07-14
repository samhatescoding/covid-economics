#PART I:

# Correlation of per capita GDP PPP between countries
SELECT 
	t1.country,
    t2.country,
    (avg(t1.value * t2.value) - avg(t1.value) * avg(t2.value)) /
    (sqrt(avg(t1.value * t1.value) - avg(t1.value) * avg(t1.value)) *
    sqrt(avg(t2.value * t2.value) - avg(t2.value) * avg(t2.value)))
    AS corr
FROM gdppppc AS t1
INNER JOIN gdppppc AS t2 ON t1.date = t2.date
GROUP BY t1.country, t2.country;

# Correlation between stock prices for american stocks
SELECT 
	t1.stock,
    t2.stock,
    ROUND((avg(t1.price * t2.price) - avg(t1.price) * avg(t2.price)) /
    (sqrt(avg(t1.price * t1.price) - avg(t1.price) * avg(t1.price)) *
    sqrt(avg(t2.price * t2.price) - avg(t2.price) * avg(t2.price))), 5)
    AS corr
FROM stockprices AS t1
INNER JOIN stockprices AS t2 ON t1.date = t2.date
    AND t1.stock IN (SELECT stockID FROM stocks WHERE country = 'USA')
    AND t2.stock IN (SELECT stockID FROM stocks WHERE country = 'USA')
GROUP BY t1.stock, t2.stock;

# Correlation per capita GDP PPP pc and poverty rates in the USA
SELECT 
    ROUND((avg(t1.value * t2.value) - avg(t1.value) * avg(t2.value)) /
    (sqrt(avg(t1.value * t1.value) - avg(t1.value) * avg(t1.value)) *
    sqrt(avg(t2.value * t2.value) - avg(t2.value) * avg(t2.value))), 5)
    AS corr
FROM gdpppppc AS t1
INNER JOIN poverty AS t2 
	ON t1.date = t2.date
    AND t1.country = t2.country
    AND t1.country = 'USA';


#PART II:

# Comparison of pre/post-COVID average growth in stock prices
SELECT 
	s.country,
    s.stockID,
    t1.growth AS 'Pre COVID',
    t2.growth AS 'Post COVID',
    ROUND(t2.growth - t1.growth, 5) AS 'Change'
FROM stocks AS s
INNER JOIN precovidgrowth AS t1
INNER JOIN postcovidgrowth AS t2
ON s.stockID = t1.measure AND t1.measure = t2.measure;

# Shows average difference in growth between pre/post-COVID periods
SELECT 
    AVG(t2.growth - t1.growth) AS 'AVG Change'
FROM stocks AS s
INNER JOIN precovidgrowth AS t1
INNER JOIN postcovidgrowth AS t2
ON s.stockID = t1.measure AND t1.measure = t2.measure;

# Comparison of pre/post-COVID average growth for remaining economic factors
SELECT DISTINCT
	t1.country,
    t1.measure,
    t1.growth AS 'Pre COVID',
    t2.growth AS 'Post COVID',
    ROUND(t2.growth - t1.growth, 5) AS 'Change'
FROM stocks AS s
INNER JOIN precovidgrowth AS t1
INNER JOIN postcovidgrowth AS t2
ON t1.country = t2.country AND t1.measure = t2.measure
WHERE t1.measure NOT IN (SELECT stockID FROM stocks);


