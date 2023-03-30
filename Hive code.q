CREATE EXTERNAL TABLE DelayedFlights 
(
    Id int,
    Year int,
    Month int,
    DayofMonth int,
    DayOfWeek int,
    DepTime int,
    CRSDepTime int,
    ArrTime int,
    CRSArrTime int,
    UniqueCarrier varchar(10),
    FlightNum int,
    TailNum varchar(10),
    ActualElapsedTime int,
    CRSElapsedTime int,
    AirTime int,
    ArrDelay int,
    DepDelay int,
    Origin varchar(10),
    Dest varchar(10),
    Distance int,
    TaxiIn int,
    TaxiOut int,
    Cancelled int,
    CancellationCode varchar(10),
    Diverted int,
    CarrierDelay varchar(10),
    WeatherDelay varchar(10),
    NASDelay varchar(10),
    SecurityDelay varchar(10),
    LateAircraftDelay varchar(10)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ","
LOCATION "s3://assignment-shaheem/assignment-shaheem/";


--check table is available--
SELECT * FROM DelayedFlights;

--Year wise carrier delay--
SELECT Year, avg((CarrierDelay /ArrDelay)*100) from DelayedFlights GROUP BY Year;

--Year wise NAS delay--
SELECT Year, avg((NASDelay /ArrDelay)*100) from DelayedFlights GROUP BY Year;

--Year wise Weather delay--
SELECT Year, avg((WeatherDelay /ArrDelay)*100) from DelayedFlights GROUP BY Year;

--Year wise late aircraft delay--
SELECT Year, avg((LateAircraftDelay /ArrDelay)*100) from DelayedFlights GROUP BY Year;

--Year wise security delay--
SELECT Year, avg((SecurityDelay /ArrDelay)*100) from DelayedFlights GROUP BY Year;