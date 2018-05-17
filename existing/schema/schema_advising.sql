CREATE TABLE `AREA` (
  `course_id` integer DEFAULT NULL
,  `area` varchar(30) DEFAULT NULL
,  PRIMARY KEY (`course_id`,`area`)
);
CREATE TABLE `COMMENT_INSTRUCTOR` (
  `instructor_id` integer NOT NULL DEFAULT '0'
,  `student_id` integer NOT NULL DEFAULT '0'
,  `score` integer DEFAULT NULL
,  `comment_text` varchar(400) DEFAULT NULL
,  PRIMARY KEY (`instructor_id`,`student_id`)
);
CREATE TABLE `COURSE` (
  `COURSE_ID` integer NOT NULL DEFAULT '0'
,  `NAME` varchar(255) DEFAULT NULL
,  `DEPARTMENT` varchar(255) DEFAULT NULL
,  `NUMBER` varchar(255) DEFAULT NULL
,  `CREDITS` varchar(255) DEFAULT NULL
,  `ADVISORY_REQUIREMENT` varchar(255) DEFAULT NULL
,  `ENFORCED_REQUIREMENT` varchar(255) DEFAULT NULL
,  `DESCRIPTION` varchar(16384) DEFAULT NULL
,  `NUM_SEMESTERS` integer DEFAULT NULL
,  `NUM_ENROLLED` integer DEFAULT NULL
,  `HAS_DISCUSSION` varchar(1) DEFAULT NULL
,  `HAS_LAB` varchar(1) DEFAULT NULL
,  `HAS_PROJECTS` varchar(1) DEFAULT NULL
,  `HAS_EXAMS` varchar(1) DEFAULT NULL
,  `NUM_REVIEWS` integer DEFAULT NULL
,  `CLARITY_SCORE` integer DEFAULT NULL
,  `EASINESS_SCORE` integer DEFAULT NULL
,  `HELPFULNESS_SCORE` integer DEFAULT NULL
,  PRIMARY KEY (`COURSE_ID`)
);
CREATE TABLE `COURSE_OFFERING` (
  `OFFERING_ID` integer NOT NULL DEFAULT '0'
,  `COURSE_ID` integer DEFAULT NULL
,  `SEMESTER` integer DEFAULT NULL
,  `SECTION_NUMBER` integer DEFAULT NULL
,  `START_TIME` time DEFAULT NULL
,  `END_TIME` time DEFAULT NULL
,  `MONDAY` varchar(1) DEFAULT NULL
,  `TUESDAY` varchar(1) DEFAULT NULL
,  `WEDNESDAY` varchar(1) DEFAULT NULL
,  `THURSDAY` varchar(1) DEFAULT NULL
,  `FRIDAY` varchar(1) DEFAULT NULL
,  `SATURDAY` varchar(1) DEFAULT NULL
,  `SUNDAY` varchar(1) DEFAULT NULL
,  `HAS_FINAL_PROJECT` varchar(1) DEFAULT 'N'
,  `HAS_FINAL_EXAM` varchar(1) DEFAULT 'N'
,  `TEXTBOOK` varchar(30) DEFAULT NULL
,  `CLASS_ADDRESS` varchar(30) DEFAULT NULL
,  `ALLOW_AUDIT` varchar(1) DEFAULT 'N'
,  PRIMARY KEY (`OFFERING_ID`)
,  FOREIGN KEY (`COURSE_ID`) REFERENCES `COURSE` (`COURSE_ID`)
);
CREATE TABLE `COURSE_PREREQUISITE` (
  `pre_course_id` integer NOT NULL
,  `course_id` integer NOT NULL
,  PRIMARY KEY (`course_id`,`pre_course_id`)
);
CREATE TABLE `COURSE_TAGS_COUNT` (
  `COURSE_ID` integer NOT NULL DEFAULT '0'
,  `CLEAR_GRADING` integer DEFAULT '0'
,  `POP_QUIZ` integer DEFAULT '0'
,  `GROUP_PROJECTS` integer DEFAULT '0'
,  `INSPIRATIONAL` integer DEFAULT '0'
,  `LONG_LECTURES` integer DEFAULT '0'
,  `EXTRA_CREDIT` integer DEFAULT '0'
,  `FEW_TESTS` integer DEFAULT '0'
,  `GOOD_FEEDBACK` integer DEFAULT '0'
,  `TOUGH_TESTS` integer DEFAULT '0'
,  `HEAVY_PAPERS` integer DEFAULT '0'
,  `CARES_FOR_STUDENTS` integer DEFAULT '0'
,  `HEAVY_ASSIGNMENTS` integer DEFAULT '0'
,  `RESPECTED` integer DEFAULT '0'
,  `PARTICIPATION` integer DEFAULT '0'
,  `HEAVY_READING` integer DEFAULT '0'
,  `TOUGH_GRADER` integer DEFAULT '0'
,  `HILARIOUS` integer DEFAULT '0'
,  `WOULD_TAKE_AGAIN` integer DEFAULT '0'
,  `GOOD_LECTURE` integer DEFAULT '0'
,  `NO_SKIP` integer DEFAULT '0'
,  PRIMARY KEY (`COURSE_ID`)
);
CREATE TABLE `GSI` (
  `course_offering_id` integer NOT NULL DEFAULT '0'
,  `student_id` integer NOT NULL
,  PRIMARY KEY (`course_offering_id`,`student_id`)
);
CREATE TABLE `INSTRUCTOR` (
  `INSTRUCTOR_ID` integer NOT NULL DEFAULT '0'
,  `NAME` varchar(255) DEFAULT NULL
,  `UNIQNAME` varchar(255) DEFAULT NULL
,  PRIMARY KEY (`INSTRUCTOR_ID`)
);
CREATE TABLE `OFFERING_INSTRUCTOR` (
  `OFFERING_INSTRUCTOR_ID` integer NOT NULL DEFAULT '0'
,  `OFFERING_ID` integer DEFAULT NULL
,  `INSTRUCTOR_ID` integer DEFAULT NULL
,  PRIMARY KEY (`OFFERING_INSTRUCTOR_ID`)
,  FOREIGN KEY (`OFFERING_ID`) REFERENCES `COURSE_OFFERING` (`OFFERING_ID`)
,  FOREIGN KEY (`INSTRUCTOR_ID`) REFERENCES `INSTRUCTOR` (`INSTRUCTOR_ID`)
);
CREATE TABLE `PROGRAM` (
  `program_id` integer NOT NULL
,  `name` varchar(255) DEFAULT NULL
,  `college` varchar(255) DEFAULT NULL
,  `introduction` varchar(255) DEFAULT NULL
,  PRIMARY KEY (`program_id`)
);
CREATE TABLE `PROGRAM_COURSE` (
  `program_id` integer NOT NULL DEFAULT '0'
,  `course_id` integer NOT NULL DEFAULT '0'
,  `workload` integer DEFAULT NULL
,  `category` varchar(11) NOT NULL DEFAULT ''
,  PRIMARY KEY (`program_id`,`course_id`,`category`)
);
CREATE TABLE `PROGRAM_REQUIREMENT` (
  `program_id` integer NOT NULL
,  `category` varchar(11) NOT NULL
,  `min_credit` integer DEFAULT NULL
,  `additional_req` varchar(100) DEFAULT NULL
,  PRIMARY KEY (`program_id`,`category`)
);
CREATE TABLE `SEMESTER` (
  `semester_id` integer NOT NULL
,  `semester` varchar(4) DEFAULT NULL
,  `year` integer DEFAULT NULL
,  PRIMARY KEY (`semester_id`)
);
CREATE TABLE `STUDENT` (
  `student_id` integer NOT NULL
,  `lastname` varchar(255) DEFAULT NULL
,  `firstname` varchar(255) DEFAULT NULL
,  `program_id` integer DEFAULT NULL
,  `declare_major` varchar(255) DEFAULT NULL
,  `total_credit` integer DEFAULT NULL
,  `total_gpa` float(3,2) DEFAULT NULL
,  `entered_as` varchar(11) DEFAULT 'FirstYear'
,  `admit_term` integer DEFAULT NULL
,  `predicted_graduation_semester` integer DEFAULT NULL
,  `degree` varchar(10) DEFAULT NULL
,  `minor` varchar(10) DEFAULT NULL
,  `internship` varchar(10) DEFAULT NULL
,  PRIMARY KEY (`student_id`)
);
CREATE TABLE `STUDENT_RECORD` (
  `student_id` integer NOT NULL
,  `course_id` integer NOT NULL
,  `semester` integer NOT NULL
,  `grade` varchar(10) DEFAULT NULL
,  `how` varchar(10) DEFAULT NULL
,  `transfer_source` varchar(10) DEFAULT NULL
,  `earn_credit` varchar(1) NOT NULL DEFAULT 'Y'
,  `repeat_term` varchar(10) DEFAULT NULL
,  `test_id` varchar(10) DEFAULT NULL
,  `offering_id` integer DEFAULT NULL
,   PRIMARY KEY (`student_id`,`course_id`,`earn_credit`)
,   FOREIGN KEY (`student_id`) REFERENCES `STUDENT` (`student_id`)
,   FOREIGN KEY (`course_id`) REFERENCES `COURSE` (`COURSE_ID`)
);
