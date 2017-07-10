CREATE TABLE best_hosp AS 
SELECT DISTINCT r.hospital_name, e.score, s.hcahps_base_score, s.hcahps_consistency_score, h.hospital_type, r.compared_to_national 
FROM readmit r 
LEFT JOIN surveyresp s 
ON r.provider_id= s.provider_id AND r.compared_to_national='Better than the National Rate' 
LEFT JOIN effcare e ON s.provider_id = e.provider_id 
AND e.score 
IN ('Very High (60,000+ patients annually)','High (40,000 - 59,999 patients annually)','Medium (20,000 - 39,999 patients annually)','Low (0 - 19,999 patients annually)') 
LEFT JOIN hospitals_nh h 
ON e.provider_id=h.provider_id 
WHERE s.hcahps_base_score > 60 
AND s.hcahps_consistency_score > 15 
AND s.hcahps_base_score IS NOT NULL 
AND s.hcahps_consistency_score IS NOT NULL 
AND e.score IS NOT NULL 
ORDER BY s.hcahps_base_score DESC, s.hcahps_consistency_score DESC, e.score DESC 
LIMIT 10;