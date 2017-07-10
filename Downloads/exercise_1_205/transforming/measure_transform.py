measure=sc.textFile("file:///data/measure_nh.csv")
print measure.count()
measurerecords= measure.map(lambda r : r.split(","))
measurerecords.first()
measurerecords.count()
measurerecords.saveAsTextFile("file:///data/measurerecords.py")

