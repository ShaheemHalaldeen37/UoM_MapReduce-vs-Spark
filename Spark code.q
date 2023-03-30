spark-shell

val df = spark.read.format("csv").option("header", "true").load("s3://assignment-shaheem/assignment-shaheem/DelayedFlights-updated.csv");

df.createOrReplaceTempView("delay_data")

spark.time {
  val result = spark.sql("SELECT Year, avg((CarrierDelay /ArrDelay)*100) from delay_data GROUP BY Year").show()
}

spark.time {
  val result = spark.sql("SELECT Year, avg((NASDelay /ArrDelay)*100) from delay_data GROUP BY Year").show()
}

spark.time {
  val result = spark.sql("SELECT Year, avg((WeatherDelay /ArrDelay)*100) from delay_data GROUP BY Year").show()
}

spark.time {
  val result = spark.sql("SELECT Year, avg((LateAircraftDelay /ArrDelay)*100) from delay_data GROUP BY Year").show()
}

spark.time {
  val result = spark.sql("SELECT Year, avg((SecurityDelay /ArrDelay)*100) from delay_data GROUP BY Year").show()
}
