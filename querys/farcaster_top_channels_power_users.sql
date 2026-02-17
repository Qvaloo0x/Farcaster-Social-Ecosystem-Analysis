SELECT 
    regexp_extract(casts.parent_url, '[^/:]+$') AS channel, -- Extrae solo lo último después de / o :
    count(*) AS total_casts
FROM dune.neynar.dataset_farcaster_casts AS casts
JOIN dune.neynar.dataset_farcaster_power_users AS power_users 
    ON casts.fid = power_users.fid
WHERE casts.created_at >= current_date - interval '7' day
    AND casts.parent_url IS NOT NULL 
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10
