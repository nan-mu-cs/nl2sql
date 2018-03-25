1. (INTERSECT) What is the student biographical data of the students who have achieved both athletic type achievements
and scholastic type achievements.

select T1.bio_data
from Students as T1 JOIN Achievements as T2
on T1.student_id = T2.student_id
where achievement_type_code = 'Athletic'
INTERSECT
select T1.bio_data
from Students as T1 JOIN Achievements as T2
on T1.student_id = T2.student_id
where achievement_type_code = 'Scholastic';


2. (INTERSECT, and) What is the student details of the students who have both won a scholastic medal detailed as Gold
and have won a medel in 2016?

select T1.student_details
from Students as T1 JOIN Achievements as T2
on T1.student_id = T2.student_id
where achievement_type_code = 'Scholastic' and achievement_details = 'Gold'
INTERSECT
select T1.student_details
from Students as T1 JOIN Achievements as T2
on T1.student_id = T2.student_id
where date_achievement = 2016;



3. (Aggregators) What is the average amount of a student loan?

select avg(amount_of_loan)
from Student_Loans;



4. (UNION) List the biographical data and student id of the students who take 2 or more classes and the students who have less than 2 detentions.


select T1.bio_data, T1.student_id
from Students as T1 JOIN Classes as T2
on T1.student_id = T2.student_id
group by T1.student_id
having count(*) >= 2
UNION
select T1.bio_data, T1.student_id
from Students as T1 JOIN Detention as T2
on T1.student_id = T2.student_id
group by T1.student_id
having count(*) < 2;


5. (EXCEPT) List the details of the teachers who teach some class whose detail has the substring 'data' 
but does not teach a class whose detail contains the prefix 'net'

select T1.teacher_details
from Teachers as T1 JOIN Classes as T2
on T1.teacher_id = T2.teacher_id
where T2.calss_details LIKE '%data%'
EXCEPT
select T1.teacher_details
from Teachers as T1 JOIN Classes as T2
on T1.teacher_id = T2.teacher_id
where T2.calss_details LIKE 'net%';


6. (EXCEPT) List the biographical data of the students who never had a detention or student loan. 

select bio_data
from Students
EXCEPT 
select T1.bio_data
from Students as T1 JOIN Detention as T2
on T1.student_id = T2.student_id 
EXCEPT 
select T1.bio_data
from Students as T1 JOIN Student_Loans as T2
on T1.student_id = T2.student_id;



7. (GROUP BY, having, >=) What are the loan amounts and dates of the students who have at least 2 achievements.

select amount_of_loan, date_of_loan
from Student_Loans
where student_id in (
	select student_id
	from Achievements
	group by student_id
	having count(*) >= 2
);


8. (GROUP BY, order by)List the detail and id of the teacher who teaches the most number of courses.

select T1.teacher_details, T1.teacher_id
from Teachers as T1 JOIN Classes as T2
on T1.teacher_id = T2.teacher_id
group by T1.teacher_id
order by count(*) desc limit 1;


9. (distinct) What are all the distint descriptions the detentions which started before '2012-03-18 09:49:33.000'?

select distinct(T1.detention_type_description)
from Ref_Detention_Type as T1 JOIN Detention as T2
on T1.detention_type_code = T2.detention_type_code
where T2.datetime_detention_start < '2012-03-18 09:49:33.000';


10. List the details of the student who has an address type described as Home.


select distinct T1.student_details
from Students as T1 JOIN Students_Addresses as T2
on T1.student_id = T2.student_id
JOIN Ref_Address_Types as T3
on T2.address_type_code = T2.address_type_code
where T3.address_type_description = 'Home';


11. List the details of the address of the student whose biographical data is 'Camila'.

select T1.address_details
from Addresses as T1 JOIN Students_Addresses as T2
on T1.address_id = T2.address_id
JOIN Students as T3
ont T2.student_id = T3.student_id
where T3.bio_data = 'Camila';


12. List the biographical data and the date of the transcript of the students who got a transcript detailed as Good.

select T1.bio_data, T2.date_of_transcript
from Students as T1 JOIN Transcripts as T2
on T1.student_id = T2.student_id
where T2.transcript_details = 'Good';


13. How many students got an 'C' in the behavioral monitoring details?

select count(distinct student_id)
from Behaviour_Monitoring
where behaviour_monitoring_details = 'C';


14. Which students not only got an 'A' but also got an 'C' in behaviour monitoring details? List the student's biographical data and details.


select T1.bio_data, T1.student_details
from Students as T1 JOIN Behaviour_Monitoring as T2
on T1.student_id = T2.student_id
where T2.behaviour_monitoring_details = 'A'
INTERSECT 
select T1.bio_data, T1.student_details
from Students as T1 JOIN Behaviour_Monitoring as T2
on T1.student_id = T2.student_id
where T2.behaviour_monitoring_details = 'C';


15. Which students got straight 'A' for his or her all behaviour monitoring details? List the student's biographical information.


select T1.bio_data
from Students as T1 JOIN Behaviour_Monitoring as T2
on T1.student_id = T2.student_id
where T2.behaviour_monitoring_details = 'A'
EXCEPT
select T1.bio_data
from Students as T1 JOIN Behaviour_Monitoring as T2
on T1.student_id = T2.student_id
where T2.behaviour_monitoring_details != 'A';


16. Which students have gone through an Registration event? List the student biographical data and the event date.

select T1.bio_data, T2.event_date
from Students as T1 JOIN Student_Events as T2
on T1.student_id = T2.student_id
where T2.event_type_code = 'Registration';


17. How many students have joined in the event described as an Exam?

select count(*)
from Students as T1 JOIN Student_Events as T2
on T1.student_id = T2.student_id
JOIN Ref_Event_Types as T3
on T2.event_type_code = T3.event_type_code
where T3.event_type_description = 'Exam';



18. How many achievements detailed as Gold medal are described as the Athletic type?

select count(*)
from Achievements as T1 JOIN Ref_Achievement_Type as T2
on T1.achievement_type_code = T2.achievement_type_code
where T2.achievement_type_description = 'Athletic';



19. How many students taught by the teacher detailed as Wilfredo have not won a achievements 
with the detail gold medal ?


select count(*)
from Teachers as T1 JOIN Classes as T2 
on T1.teacher_id = T2.teacher_id
where T1.teacher_details = 'Wilfredo' and T2.student_id
not in (
select student_id
from Achievements
where achievement_details = 'Gold'
);


20. List the date of the transcripts with the detail Pass or Good.

select date_of_transcript
from Transcripts
where transcript_details = 'Pass' or transcript_details = 'Good';


21. List the achievement type code of the achievements which has the detail Bronze or achieved in the year of 2014? 

select achievement_type_code
from Achievements
where achievement_details = 'Bronze' or date_achievement = '2014';

22. Show the detention start time and end time of the detentions with the Lunch type.

select datetime_detention_start, datetime_detention_end
from Detention
where detention_type_code = 'Lunch';

23. Show the biographical information of the students whose details includes the substring 'Suite'.

select bio_data
from Students
where student_details LIKE '%Suite%'

24. 

























