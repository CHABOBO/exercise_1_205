hosp=sc.textFile("file:///data/hosp_nh.csv")
print hosp.count()
hosprecords = hosp.map(lambda r : r.split(","))
hosprecords.first()
hosprecords.count()
hosprecords.saveAsTextFile("file:///data/hosprecords.py")