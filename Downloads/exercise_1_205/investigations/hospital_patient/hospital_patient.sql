CREATE TABLE hospital_pat AS SELECT
e.condition, 
e.state,
e.city,
e.score, 
e.provider_id, 
e.hospital_name,
h.hospital_type, 
h.hospital_ownership, 
h.emergency_services, 
r.compared_to_national, 
AVG(r.score) AS rscore, 
s.hcahps_base_score, 
s.hcahps_consistency_score 
FROM effcare AS e
LEFT JOIN hospitals_nh AS h 
ON e.provider_id=h.provider_id 
LEFT JOIN readmit AS r 
ON e.provider_id=r.provider_id 
LEFT JOIN surveyresp AS s 
ON e.provider_id=s.provider_id 
WHERE e.score IN ('Very High (60,000+ patients annually)','High (40,000 - 59,999 patients annually)','Medium (20,000 - 39,999 patients annually)','Low (0 - 19,999 patients annually)') 
GROUP BY e.condition, e.state, e.city, e.score, e.provider_id, e.hospital_name, h.hospital_type, h.hospital_ownership, h.emergency_services, r.compared_to_national, s.hcahps_base_score, s.hcahps_consistency_score
LIMIT 10;