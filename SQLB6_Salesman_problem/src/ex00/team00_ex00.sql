CREATE TABLE
  nodes (
    point1 VARCHAR NOT NULL,
    point2 VARCHAR NOT NULL,
    cost INTEGER NOT NULL,
    PRIMARY KEY (point1, point2),
    CHECK (point1 <> point2)
  );

INSERT INTO
  nodes (point1, point2, cost)
VALUES
  ('a', 'b', 10), ('b', 'a', 10),
  ('a', 'd', 20), ('d', 'a', 20),
  ('a', 'c', 15), ('c', 'a', 15),
  ('b', 'd', 25), ('d', 'b', 25),
  ('b', 'c', 35), ('c', 'b', 35),
  ('d', 'c', 30), ('c', 'd', 30);

WITH RECURSIVE tour AS (
    SELECT
        'a'::VARCHAR AS current_point,
        ARRAY['a']::TEXT[] AS path,
        0 AS total_cost

    UNION ALL

    SELECT
        nodes.point2 AS current_point,
        tour.path || ARRAY[nodes.point2::text] AS path,
        tour.total_cost + nodes.cost AS total_cost
    FROM tour
    JOIN nodes
        ON tour.current_point = nodes.point1
    WHERE NOT (
        tour.path @> ARRAY[nodes.point2::text]
    )
),
all_tours AS (
    SELECT
        tour.total_cost + nodes.cost AS total_cost,
        tour.path || ARRAY['a']::text[] AS tour
    FROM tour
    JOIN nodes
        ON tour.current_point = nodes.point1
    WHERE ARRAY_LENGTH(tour.path, 1) = 4
      AND nodes.point2 = 'a'
)
SELECT
    total_cost,
    tour
FROM all_tours
WHERE total_cost = (
    SELECT MIN(total_cost)
    FROM all_tours
)
ORDER BY total_cost, tour;