cd exercise_1
hdfs dfs -mkdir hospital_comparison
ls
Measure.csv             hospitals.csv          surveys_responses.csv
README.md               loading_and_modelling
effective_care.csv.zip  readmissions.csv 
tail -n +2 Measure.csv > measure_nh.csv
ls     
Measure.csv             hospitals.csv          no_header
README.md               loading_and_modelling  readmissions.csv
effective_care.csv.zip  measure_nh.csv         surveys_responses.csv
tail -n +2 surveys_responses.csv > surv_resp_nh.csv
tail -n +2 readmissions.csv > readmit_nh.csv
tail -n +2 hospitals.csv > hosp_nh.csv
ls
Measure.csv             hospitals.csv          readmissions.csv
README.md               loading_and_modelling  readmit_nh.csv
effective_care.csv.zip  measure_nh.csv         surv_resp_nh.csv
hosp_nh.csv             no_header              surveys_responses.csv
unzip effective_care.csv.zip
Archive:  effective_care.csv.zip
  inflating: Timely and Effective Care - Hospital.csv  
   creating: __MACOSX/
  inflating: __MACOSX/._Timely and Effective Care - Hospital.csv  
ls
Measure.csv                               loading_and_modelling
README.md                                 measure_nh.csv
Timely and Effective Care - Hospital.csv  no_header
__MACOSX                                  readmissions.csv
effective_care.csv.zip                    readmit_nh.csv
hosp_nh.csv                               surv_resp_nh.csv
hospitals.csv                             surveys_responses.csv
tail -n +2 'Timely and Effective Care - Hospital.csv' > effectivecare_nh.csv
ls
hdfs dfs -put hosp_nh.csv /user/w205/hospital_compare
hdfs dfs -put measure_nh.csv /user/w205/hospital_compare
hdfs dfs -put readmit_nh.csv /user/w205/hospital_compare
hdfs dfs -put surv_resp_nh.csv /user/w205/hospital_compare
hdfs dfs -put effectivecare_nh.csv /user/w205/hospital_compare

hdfs dfs -mkdir /user/w205/hospital_compare/hosp
hdfs dfs -put hosp_nh.csv /user/w205/hospital_compare/hosp
hdfs dfs -mkdir /user/w205/hospital_compare/meas
hdfs dfs -put measure_nh.csv /user/w205/hospital_compare/meas
hdfs dfs -mkdir /user/w205/hospital_compare/read
hdfs dfs -put readmit_nh.csv /user/w205/hospital_compare/read
hdfs dfs -mkdir /user/w205/hospital_compare/surv
hdfs dfs -put surv_resp_nh.csv /user/w205/hospital_compare/surv
hdfs dfs -mkdir /user/w205/hospital_compare/eff
hdfs dfs -put effectivecare_nh.csv /user/w205/hospital_compare/eff
