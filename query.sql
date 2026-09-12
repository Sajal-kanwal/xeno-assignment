SELECT * FROM campaign;
SELECT * FROM communication_log LIMIT 10;


SELECT COUNT(*) FROM campaign;
SELECT COUNT(*) FROM communication_log;


SELECT MIN(sent_time), MAX(sent_time) FROM communication_log;

SELECT creation_status, COUNT(*) FROM campaign GROUP BY creation_status;
SELECT processing_status, COUNT(*) FROM campaign GROUP BY processing_status;
SELECT delivery_status, COUNT(*) FROM communication_log GROUP BY delivery_status;

SELECT id, parent_id, name, creation_status, processing_status
FROM campaign
WHERE merchant_id = 501
ORDER BY id;

SELECT c.id, c.name, c.creation_status, COUNT(cl.id) AS n_sends
FROM campaign c
LEFT JOIN communication_log cl ON cl.communication_id = c.id
WHERE c.merchant_id = 501
GROUP BY c.id, c.name, c.creation_status
ORDER BY c.id;

SELECT COUNT(*) as target_base FROM communication_log cl
JOIN campaign c ON cl.communication_id = c.id
WHERE c.merchant_id = 501 AND c.name LIKE '%Diwali%';

SELECT COUNT(*) as approved_campaigns FROM communication_log cl
JOIN campaign c ON cl.communication_id = c.id
WHERE c.merchant_id = 501 AND c.name LIKE '%Diwali%'
AND c.creation_status = 'approved';

SELECT COUNT(*) as approved_campaigns_delivered FROM communication_log cl
JOIN campaign c ON cl.communication_id = c.id
WHERE c.merchant_id = 501 AND c.name LIKE '%Diwali%'
AND c.creation_status = 'approved'
AND cl.delivery_status = 900;
