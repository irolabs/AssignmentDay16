WITH wand_info AS (
    SELECT 
        w.id,
        wp.age,
        w.coins_needed,
        w.power,
        MIN(w.coins_needed) OVER (
            PARTITION BY wp.age, w.power
        ) AS min_cost
    FROM Wands w
    JOIN Wands_Property wp 
      ON w.code = wp.code
    WHERE wp.is_evil = 0
)
SELECT id, age, coins_needed, power
FROM wand_info
WHERE coins_needed = min_cost
ORDER BY power DESC, age DESC;
