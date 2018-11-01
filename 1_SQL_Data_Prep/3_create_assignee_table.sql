-- create table with assignee type data
-- this uses the new (Mar 9th) thesaurus
create table patent_20180528.temp_gi_assignee_type as 
select g.patent_id, a.`type` as assignee_type, a.organization 
	from patent_20180528.temp_patent_level_gi g 
		left join patent_20180528.patent_assignee pa 
			on g.patent_id = pa.patent_id
		left join patent_20180528.assignee a 
			on pa.assignee_id = a.id; #use more recent assignee because the types are correct



-- select assignee_type, count(patent_id) as count from patent_20180528.temp_gi_assignee_type group by assignee_type order by count;

-- create table with assignee information for every patent
create table patent_20180528.all_assignees as 
SELECT a.patent_id, b.id, b.type, b.name_first, b.name_last, b.organization
	FROM patent_20180528.patent_assignee a 
		LEFT JOIN patent_20180528.assignee b
        ON a.assignee_id = b.id;
        
create index patent_ix on patent_20180528.all_assignees(id);

