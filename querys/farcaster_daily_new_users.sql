SELECT 
    date_trunc('day', registered_at) AS registration_day,
    count(fid) AS new_users_count
FROM dune.neynar.dataset_farcaster_fids
WHERE registered_at >= current_date - interval '90' day
GROUP BY 1
ORDER BY 1 DESC
