Total # = 20

1. How many candidates are there?

select count(*)
from candidate

2. Which poll resource provided the most number of candidate info?

select poll_source
from candidate
group by poll_source
order by count(*) desc
limit 1

3. what are the top 3 highest support rates?

select support_rate
from candidate
order by support_rate desc
limit 3

4. Find the id of the candidate who got the lowest oppose rate.

select Candidate_ID
from candidate
order by oppose_rate
limit 1

5. Please list support, consider, and oppose rates for each candidate in the ascending order of the unsure rate.

select Support_rate, Consider_rate, Oppose_rate
from candidate
order by unsure_rate

6. which poll source does the highest oppose rate come from?

select poll_source
from candidate
order by oppose_rate desc
limit 1

7. list all people's names in the order of their date of birth from old to young.

select name
from people
order by date_of_birth

8. Find the average height and weight for all males (sex is M).

select avg(height), avg(weight)
from people
where sex = 'M'

9. find the name of people who are taller than 200 or lower than 190.

select name
from people
where height > 200 or height < 190

10. Find the average and minimum weight for each gender.

select avg(weight), min(weight), sex
from people
group by sex

11. Find the name and gender of the candidate who got the highest support rate.

select t1.name, t1.sex
from people as t1 join candidate as t2 on t1.people_id = t2.people_id
order by t2.support_rate desc
limit 1

12. Find the name of the candidates whose oppose percentage is the lowest for each sex.

select t1.name, t1.sex
from people as t1 join candidate as t2 on t1.people_id = t2.people_id
group by t1.sex
having oppose_rate = min(oppose_rate)

13. which gender did get the highest average uncertain ratio.

select t1.sex
from people as t1 join candidate as t2 on t1.people_id = t2.people_id
group by t1.sex
order by avg(t2.unsure_rate) desc
limit 1

14. what are the names of people who are not participate in the candidate election.

select name
from people
where people_id not in (select people_id from candidate)

15. Find the name of the candidates whose support percentage is lower than their oppose rate.

select t1.name
from people as t1 join candidate as t2 on t1.people_id = t2.people_id
where t2.support_rate < t2.oppose_rate

16. how many people are there whose weight is higher than 85 for each gender?

select count(*), sex
from people
where weight > 85
group by sex

17. find the highest support percentage, lowest consider rate and oppose rate of all candidates.

select max(support_rate), min(consider_rate), min(oppose_rate)
from candidate

18. list all female (sex is F) candidates' names in the alphabetical order.

select t1.name
from people as t1 join candidate as t2 on t1.people_id = t2.people_id
where t1.sex = 'F'
order by t1.name

19. find the name of people whose height is lower than the average.

select name
from people
where height < (select avg(height) from people)

20. List all detailed info about all people.

select *
from people
