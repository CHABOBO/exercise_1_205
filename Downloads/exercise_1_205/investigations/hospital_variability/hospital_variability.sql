CREATE TABLE hosp_variability 
AS SELECT AVG(surveyresp.hcahps_base_score + surveyresp.hcahps_consistency_score) AS t, 
AVG(effcare.score) AS e, readmit.provider_id, readmit.hospital_name, readmit.state, readmit.compared_to_national, 
AVG(readmit.score) AS rs, hospitals_nh.hospital_type 
FROM readmit 
INNER JOIN hospitals_nh 
ON readmit.provider_id=hospitals_nh.provider_id 
INNER JOIN surveyresp 
ON readmit.provider_id=surveyresp.provider_id 
INNER JOIN effcare 
ON readmit.provider_id=effcare.provider_id 
WHERE readmit.score >= 0 
AND readmit.compared_to_national IN ('Better than the National Rate', 'No different than the National Rate', 'Number of Cases Too Small', 'Worse than the National Rate') 
GROUP BY readmit.provider_id, readmit.hospital_name, readmit.state, readmit.compared_to_national, hospitals_nh.hospital_type 
LIMIT 10;