WITH best_submission AS (
    SELECT 
        hacker_id,
        challenge_id,
        MAX(score) AS max_score
    FROM Submissions
    GROUP BY hacker_id, challenge_id
),
total_score AS (
    SELECT 
        hacker_id,
        SUM(max_score) AS total_score
    FROM best_submission
    GROUP BY hacker_id
    HAVING SUM(max_score) > 0
)
SELECT h.hacker_id, h.name, t.total_score
FROM total_score t
JOIN Hackers h 
  ON t.hacker_id = h.hacker_id
ORDER BY t.total_score DESC, h.hacker_id ASC;
