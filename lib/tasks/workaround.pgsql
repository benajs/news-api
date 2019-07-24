select n1.title,n2.title from news n1, news n2 where n1.id !=n2.id and n1.title_tokens @@ to_tsquery(array_to_string(tsvector_to_array(n2.title_tokens),',',''));


select id,title,tokens from news 
where title_tokens @@ to_tsquery(array_to_string(tsvector_to_array(title_tokens),' | ',''));

select id,title_tokens,array_to_string(tsvector_to_array(title_tokens),' ','') from news 
where id = 9 and title_tokens @@ to_tsquery('assist | defend');

select id, ts_rank_cd(title_tokens,query) 
from news, to_tsquery('emphasi') query
where query @@ title_tokens;

CREATE EXTENSION pg_trgm;

select * from (select n1.title, n2.title,similarity(n1.tokens,n2.tokens) AS rank
from news n1, news n2 where n1.id!=n2.id  order by n1.id,n2.id)ben2  where rank > 0.2;

select array_to_string(tsvector_to_array('Dell Black Friday in July deals are back with big savings on its laptops	'::tsvector),' ','');

select title,
max(similarity(tokens,
array_to_string(tsvector_to_array('Dell Black Friday in July deals are '::tsvector),' ',''))) from news
group by title

"select max(similarity(tokens,array_to_string(tsvector_to_array('"+entry.css(feed[:summary]).text+"'::tsvector),' ',''))) from news"





select (count(id)/2)+1
 from news;

alter table news drop column title_tokens;

select * from feeds

alter table news add column tokens text;

update news set tokens=array_to_string(tsvector_to_array(to_tsvector(title)),' ','');

select n1.id, n1.title, similarity(n1.tokens,n2.tokens) from news n1, news n2 where n1.id< (select count(id)/2 from news)


with median as (select (count(id)/2) + 1 as count from news)
, similar_list as( 
select n1.id, n1.title,n2.title, similarity(n1.tokens,n2.tokens) as rank 
from news n1, news n2, median m 
where n1.id< m.count and n2.id> m.count
)
select * from similar_list where rank > 0.2

WITH RECURSIVE t(n) AS (
    VALUES (1)
  UNION ALL
    SELECT n+1 FROM t WHERE n < 100
)
SELECT sum(n) FROM t;


WITH RECURSIVE similar_list(n) AS (
select name from feed 
  UNION ALL
select n1.id, n1.title,n2.title, similarity(n1.tokens,n2.tokens) as rank 
from news n1, news n2, median m 
where n1.id< m.count/2 and n2.id> m.count/2
)
select * from similar_list where rank > 0.2


WITH RECURSIVE search_graph(id, name, url, depth) AS (
        SELECT g.id, g.name, g.url, 1
        FROM feeds g 
      UNION ALL
        SELECT g.id, g.name, g.url, sg.depth + 1
        FROM feeds g, search_graph sg
        WHERE g.id = sg.depth
)
SELECT * FROM search_graph;

WITH RECURSIVE search_graph(id, name, url, depth) AS (
        select n1.id, n1.title,n2.title, similarity(n1.tokens,n2.tokens) as rank 
from news n1, news n2
      UNION ALL
        SELECT g.id, g.name, g.url, sg.depth + 1
        FROM feeds g, search_graph sg
        WHERE g.id = sg.depth
)
SELECT * FROM search_graph;

select * from news

select * from feeds


update feeds 

delete from feeds where id =5