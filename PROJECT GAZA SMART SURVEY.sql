USE `02_smart_2026_v3 mgg`; 

SELECT * FROM `02_smart_2026_v3 mgg`;


RENAME TABLE `02_smart_2026_v3 mgg` TO smart_indicators;


SHOW TABLES;

SELECT * FROM smart_indicators;


SELECT category, COUNT(DISTINCT indicator_id)
 AS total_indicators
 FROM smart_indicators 
 GROUP BY category ORDER BY
 total_indicators DESC;
 
 
 SELECT indicator_id, indicator_name, domain, estimate_pct, ci_low, ci_high, who_severity 
 FROM smart_indicators
 WHERE indicator_id 
 IN ('GAM_WHZ', 'SAM_WHZ', 'cGAM', 'cSAM')
 ORDER BY indicator_id, estimate_pct 
 DESC;
 
 
 
 SELECT category, indicator_name, domain, estimate_pct, who_severity
 FROM smart_indicators
 WHERE who_severity
 LIKE '%Emergency%'
 OR who_severity 
 LIKE '%Critical%'
 OR who_severity 
 LIKE '%High%'
 ORDER BY estimate_pct DESC;
 
 
 
 
 SELECT indicator_name, MAX(CASE WHEN domain = 'Gaza_North_Gaza' THEN estimate_pct END) AS north_gaza, MAX(CASE WHEN domain = 'Deir_Al_Balah'
 THEN estimate_pct END) AS deir_al_balah, MAX(CASE WHEN domain = 'Khan_Younis_Rafah' 
 THEN estimate_pct END) AS khan_younis_rafah, MAX(CASE WHEN domain = 'Gaza_Strip_weighted'
 THEN estimate_pct END) AS total_weighted
 FROM smart_indicators
 WHERE indicator_id IN ('GAM_WHZ', 'cGAM', 'Stunting', 'Underweight', 'ExclusiveBF_u6m', 'Diarrhea_2w')
 GROUP BY indicator_name;





SELECT indicator_name, domain, estimate_pct, ci_low, ci_high, relative_precision, precision_flag
FROM smart_indicators
WHERE domain NOT IN ('Gaza_Strip_weighted','Gaza_Strip_total') 
  AND relative_precision != ''
ORDER BY CAST(relative_precision AS FLOAT) DESC
LIMIT 20;



SELECT indicator_name, domain, estimate_pct, highest_domain, lowest_domain,
  CASE WHEN domain = highest_domain THEN 'WORST in this indicator'
       WHEN domain = lowest_domain THEN 'BEST in this indicator'
       ELSE '' END AS position
FROM smart_indicators
WHERE domain = 'Gaza_North_Gaza'
  AND indicator_id IN ('GAM_WHZ','cGAM','Stunting','Underweight','ExclusiveBF_u6m',
                        'Diarrhoea_2wk','MinDietDiversity','MinAcceptableDiet')
ORDER BY indicator_name;




SELECT indicator_name, domain, estimate_pct, who_severity
FROM smart_indicators
WHERE category = 'Preventive Health' 
  AND domain = 'Gaza_Strip_weighted'
ORDER BY CAST(estimate_pct AS FLOAT) ASC;



SELECT indicator_name, age_group, estimate_pct, who_severity
FROM smart_indicators
WHERE domain = 'Gaza_Strip_weighted'
  AND category IN ('Breastfeeding','Complementary Feeding')
ORDER BY 
  CASE indicator_id
    WHEN 'EverBreastfed' THEN 1
    WHEN 'ExclusiveBF_u6m' THEN 2
    WHEN 'MinDietDiversity' THEN 3
    WHEN 'MinMealFreq' THEN 4
    WHEN 'MinAcceptableDiet' THEN 5
    ELSE 6 END;
    
    
    
    
    








