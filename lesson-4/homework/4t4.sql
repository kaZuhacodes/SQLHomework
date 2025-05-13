--## Task 4
--- Order letters but 'b' must be first/last
--- Order letters but 'b' must be 3rd (Optional)


create table letters
(letter char(1));

insert into letters
values ('a'), ('a'), ('a'), 
  ('b'), ('c'), ('d'), ('e'), ('f');

select * from letters

SELECT *
FROM letters
ORDER BY 
    CASE WHEN letter = 'b' THEN 0 ELSE 1 END,
    letter;

SELECT *
FROM letters
ORDER BY 
    CASE WHEN letter = 'b' THEN 1 ELSE 0 END,
    letter;



