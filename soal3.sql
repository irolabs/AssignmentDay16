WITH challenge_max AS (
    SELECT c.challenge_id, d.score AS max_score
    FROM Challenges c
    JOIN Difficulty d 
      ON c.difficulty_level = d.difficulty_level
),
full_score_submissions AS (
    SELECT s.hacker_id, s.challenge_id
    FROM Submissions s
    JOIN challenge_max cm 
      ON s.challenge_id = cm.challenge_id
    WHERE s.score = cm.max_score
    GROUP BY s.hacker_id, s.challenge_id
),
hacker_fullcount AS (
    SELECT hacker_id, COUNT(*) AS solved_count
    FROM full_score_submissions
    GROUP BY hacker_id
    HAVING COUNT(*) > 1
)
SELECT h.hacker_id, h.name
FROM hacker_fullcount hf
JOIN Hackers h 
  ON hf.hacker_id = h.hacker_id
ORDER BY hf.solved_count DESC, h.hacker_id ASC;
