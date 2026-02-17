SELECT 
    date_trunc('day', created_at) AS day,
    count(*) AS total_casts
FROM dune.neynar.dataset_farcaster_casts
WHERE created_at >= current_date - interval '90' day
GROUP BY 1
ORDER BY 1 DESC
