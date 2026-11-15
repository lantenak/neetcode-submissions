-- Write your query below
SELECT DISTINCT c.title
FROM tv_program tp
JOIN content c ON tp.content_id = c.content_id
WHERE c.kids_content = 'Y'
    AND c.content_type = 'Movies'
    AND tp.program_date >= '2020-06-01'
    AND tp.program_date < '2020-07-01';
