CREATE TABLE best_state AS 
SELECT readmit.state, AVG(surveyresp.hcahps_base_score) 
AS avgbase, 
AVG(surveyresp.hcahps_consistency_score) 
AS avgcons, 
AVG(surveyresp.hcahps_base_score+surveyresp.hcahps_consistency_score) 
AS avgtotal, 
COUNT(readmit.compared_to_national='Better than the National Rate') 
AS bb 
FROM readmit 
JOIN surveyresp 
ON readmit.provider_id=surveyresp.provider_id 
WHERE readmit.compared_to_national='Better than the National Rate' 
AND surveyresp.hcahps_base_score > 60 AND surveyresp.hcahps_consistency_score > 15 
GROUP BY readmit.state 
ORDER BY avgtotal DESC 
LIMIT 10;