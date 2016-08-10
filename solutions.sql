-- CLUE NUMBER 1

SELECT name, code FROM country WHERE region = 'Southern Europe' ORDER BY population;

--              name
-- -------------------------------
--  Holy See (Vatican City State)
--  Gibraltar
--  San Marino
--  Andorra
--  Malta
--  Slovenia
--  Macedonia
--  Albania
--  Bosnia and Herzegovina
--  Croatia
--  Portugal
--  Greece
--  Yugoslavia
--  Spain
--  Italy
-- (15 rows)

-- CLUE NUMBER 2

SELECT language,isofficial FROM countrylanguage WHERE countrycode = 'VAT';
--  language | isofficial
-- ----------+------------
--  Italian  | t

-- CLUE NUMBER 3

SELECT percentage,isofficial,language,name,continent,code,region FROM countrylanguage INNER JOIN country ON country.code = countrylanguage.countrycode WHERE language = 'Italian' ORDER BY percentage DESC ;
--  percentage | isofficial | language |             name              |   continent   | code |          region
-- ------------+------------+----------+-------------------------------+---------------+------+---------------------------
--         100 | t          | Italian  | San Marino                    | Europe        | SMR  | Southern Europe
--        94.1 | t          | Italian  | Italy                         | Europe        | ITA  | Southern Europe
--        16.1 | f          | Italian  | Monaco                        | Europe        | MCO  | Western Europe
--         7.7 | t          | Italian  | Switzerland                   | Europe        | CHE  | Western Europe
--         4.6 | f          | Italian  | Luxembourg                    | Europe        | LUX  | Western Europe
--         2.5 | f          | Italian  | Liechtenstein                 | Europe        | LIE  | Western Europe
--         2.4 | f          | Italian  | Belgium                       | Europe        | BEL  | Western Europe
--         2.2 | f          | Italian  | Australia                     | Oceania       | AUS  | Australia and New Zealand
--         1.7 | f          | Italian  | Canada                        | North America | CAN  | North America
--         1.7 | f          | Italian  | Argentina                     | South America | ARG  | South America
--         0.7 | f          | Italian  | Germany                       | Europe        | DEU  | Western Europe
--         0.6 | f          | Italian  | United States                 | North America | USA  | North America
--         0.4 | f          | Italian  | France                        | Europe        | FRA  | Western Europe
--         0.4 | f          | Italian  | Brazil                        | South America | BRA  | South America
--           0 | t          | Italian  | Holy See (Vatican City State) | Europe        | VAT  | Southern Europe

-- CLUE NUMBER 4

SELECT * FROM city WHERE countrycode = 'SMR' ORDER BY population DESC LIMIT 10;
--   id  |    name    | countrycode |     district      | population
-- ------+------------+-------------+-------------------+------------
--  3170 | Serravalle | SMR         | Serravalle/Dogano |       4802
--  3171 | San Marino | SMR         | San Marino        |       2294

-- CLUE NUMBER 5

SELECT * FROM city WHERE name LIKE 'Serr%';
--  id  |    name    | countrycode |     district      | population
-- ------+------------+-------------+-------------------+------------
--  265 | Serra      | BRA         | Espï¿½rito Santo  |     302666
-- 3170 | Serravalle | SMR         | Serravalle/Dogano |       4802
-- (2 rows)

SELECT * FROM country WHERE code = 'BRA';
--  code |  name  |   continent   |    region     | surfacearea | indepyear | population | lifeexpectancy |    gnp    |  gnpold   | localname |  governmentform  |        headofstate        | capital | code2
-- ------+--------+---------------+---------------+-------------+-----------+------------+----------------+-----------+-----------+-----------+------------------+---------------------------+---------+-------
--  BRA  | Brazil | South America | South America |  8.5474e+06 |      1822 |  170115000 |           62.9 | 776739.00 | 804108.00 | Brasil    | Federal Republic | Fernando Henrique Cardoso |     211 | BR
-- (1 row)
--

-- CLUE NUMBER 6

SELECT capital FROM country WHERE code = 'BRA';
--  capital
-- ---------
--      211
-- (1 row)

SELECT district FROM city INNER JOIN country ON country.capital = city.id WHERE capital = 211;
--      district
-- ------------------
--  Distrito Federal
-- (1 row)

 SELECT * FROM city WHERE id = 211 AND district = 'Distrito Federal';
--  id  |    name    | countrycode |     district     | population
-- -----+------------+-------------+------------------+------------
--  211 | Brasï¿½lia | BRA         | Distrito Federal |    1969868
-- (1 row)

CLUE NUMBER 7,8

SELECT * FROM city WHERE population BETWEEN 91000 AND 92000 ORDER BY population DESC;
--   id  |           name           | countrycode |       district       | population
-- ------+--------------------------+-------------+----------------------+------------
--  3303 | Ilan                     | TWN         | Ilan                 |      92000
--   523 | Gillingham               | GBR         | England              |      92000
--   528 | Hartlepool               | GBR         | England              |      92000
--   530 | Woking/Byfleet           | GBR         | England              |      92000
--   444 | Sï¿½o Lourenï¿½o da Mata | BRA         | Pernambuco           |      91999
--  2243 | Kaiyuan                  | CHN         | Yunnan               |      91999
--  1517 | Barletta                 | ITA         | Apulia               |      91904
--  1019 | Batam                    | IDN         | Riau                 |      91871
--  2684 | Matamoros                | MEX         | Coahuila de Zaragoza |      91858
--  4056 | San Mateo                | USA         | California           |      91799
--   445 | Santana do Livramento    | BRA         | Rio Grande do Sul    |      91779
--   446 | Votorantim               | BRA         | Sï¿½o Paulo          |      91777
--  4057 | Visalia                  | USA         | California           |      91762
--  1518 | Arezzo                   | ITA         | Toscana              |      91729
--   643 | al-Hawamidiya            | EGY         | Giza                 |      91700
--   581 | San Pedro de la Paz      | CHL         | Bï¿½obï¿½o           |      91684
--  1776 | Mobara                   | JPN         | Chiba                |      91664
--  3764 | Kirovo-Tï¿½epetsk        | RUS         | Kirov                |      91600
--  2244 | Tumen                    | CHN         | Jilin                |      91471
--  1777 | Narita                   | JPN         | Chiba                |      91470
--  3348 | Pardubice                | CZE         | Vï¿½chodnï¿½ Cechy   |      91309
--   644 | Disuq                    | EGY         | Kafr al-Shaykh       |      91300
--  1888 | Nyeri                    | KEN         | Central              |      91258
--  4058 | Boulder                  | USA         | Colorado             |      91238
--  1778 | Kashiwazaki              | JPN         | Niigata              |      91229
--  4059 | Cary                     | USA         | North Carolina       |      91213
--   447 | Campo Largo              | BRA         | Paranï¿½             |      91203
--  1020 | Padang Sidempuan         | IDN         | Sumatera Utara       |      91200
--  1779 | Tsuyama                  | JPN         | Okayama              |      91170
--  1528 | Klagenfurt               | AUT         | Kï¿½rnten            |      91141
--   125 | Tandil                   | ARG         | Buenos Aires         |      91101
--  1021 | Sawangan                 | IDN         | West Java            |      91100
--  3195 | Unayza                   | SAU         | Qasim                |      91100
--  3157 | Dï¿½ren                  | DEU         | Nordrhein-Westfalen  |      91092
--  4060 | Santa Monica             | USA         | California           |      91084
--  3260 | Idlib                    | SYR         | Idlib                |      91081
--   529 | Halifax                  | GBR         | England              |      91069
--   582 | Melipilla                | CHL         | Santiago             |      91056
--  1444 | Semnan                   | IRN         | Semnan               |      91045
--  2245 | Putian                   | CHN         | Fujian               |      91030
--  3765 | Krasnogorsk              | RUS         | Moskova              |      91000
--  3196 | Najran                   | SAU         | Najran               |      91000
--

ANSWER: CARMEN SANDIEGO IS IN SANTA MONICA, CALIFORNIA!!!!!!!!!
