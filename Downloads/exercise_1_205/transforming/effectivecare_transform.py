effectivecare=sc.textFile("file:///data/effectivecare_nh.csv")
print effectivecare.count()
effectivecarerecords = effectivecare.map(lambda r : r.split(","))
effectivecarerecords.first()
effectivecarerecords.count()
effectivecarerecords.saveAsTextFile("file:///data/effectivecarerecords.py")