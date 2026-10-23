 WITH RECURSIVE tour AS (
  SELECT 'a'::VARCHAR AS current_point,
  ARRAY['a'] AS path,
  0 AS total_cost
UNION ALL
SELECT 
  nodes.point2 AS current_point,
  tour.path || ARRAY[nodes.point2] AS path,
  tour.total_cost + nodes.cost AS total_cost
  FROM tour
  JOIN nodes ON tour.current_point = nodes.point1
  WHERE NOT (
    tour.path @> ARRAY[nodes.point2::text]
)
  )
  
  SELECT
    tour.total_cost + nodes.cost AS total_cost,
    tour.path || ARRAY['a'] AS tour
    FROM tour
    JOIN nodes
    ON tour.current_point = nodes.point1
    WHERE ARRAY_LENGTH(tour.path, 1) = 4 AND nodes.point2 = 'a'
    ORDER by total_cost, tour;