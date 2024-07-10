--  lists all bands with Glam rock as their main style
-- Column names must be: band_name and lifespan
SELECT band_name, IFNULL(split - formed, 2020 - formed) AS lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
ORDER BY lifespan DESC;
