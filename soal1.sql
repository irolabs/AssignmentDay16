WITH nilai_siswa AS (
    SELECT siswa.name, siswa.marks, nilai.grade
    FROM Students siswa
    JOIN Grades nilai
      ON siswa.marks BETWEEN nilai.min_mark AND nilai.max_mark
)
SELECT
    CASE WHEN grade < 8 THEN 'NULL' ELSE name END AS name,
    grade,
    marks
FROM nilai_siswa
ORDER BY
    grade DESC,
    CASE WHEN grade >= 8 THEN name END ASC,
    CASE WHEN grade < 8 THEN marks END ASC;
