readmit=sc.textFile("file:///data/readmit_nh.csv")
print readmit.count()
readmitrecords=readmit.map(lambda r : r.split(","))
readmitrecords.first()
readmitrecords.count()
readmitrecords.saveAsTextFile("file:///data/readmitrecords.py")