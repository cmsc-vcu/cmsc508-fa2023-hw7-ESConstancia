# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

drop table if exists skills;
drop table if exists people;
drop table if exists peopleskills;
drop table if exists roles;
drop table if exists peopleroles;


SET FOREIGN_KEY_CHECKS=0;



# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

drop table if exists skills;
create table skills(
    skills_id INT NOT NULL,
    name VARCHAR(225) NOT NULL,
    description VARCHAR(225) NOT NULL DEFAULT '(default description)',
    tag VARCHAR(225) NOT NULL,
    url VARCHAR(225),
    time_commitment INT, 
    primary key (skills_id)
);



SELECT * FROM skills;


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!


insert into skills (skills_id,name,description,tag,time_commitment) values 
    (1, 'beat boxing', 'Art of creating music with the mouth', 'Skill 1', 30),
    (2, 'juggling', 'Art of keeping several objects in motion simultaneously', 'Skill 2', 20),
    (3, 'voice mimicry', 'Imitating voices and sounds with precision', 'Skill 3', 25),
    (4, 'parkour', 'Movement art involving efficient traversal of obstacles', 'Skill 4', 40),
    (5, 'rock climbing', 'Scaling natural rock formations or artificial rock walls', 'Skill 5', 50),
    (6, 'foreign languages', 'Learning and using languages other than ones native language', 'Skill 6', 60),
    (7, 'cooking', 'Preparation of food', 'Skill 7', 35),
    (8, 'figure skating', 'Artistic sport involving graceful movements on ice', 'Skill 8', 45);

 select * from skills 


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

drop table if exists people;

create table people(
    people_id INT NOT NULL,
    people_first_name VARCHAR(225),
    people_last_name VARCHAR(225) NOT NULL,
    email VARCHAR(225),
    linkedin_url VARCHAR(225),
    headshot_url VARCHAR(225),
    discord_handle VARCHAR(225),
    brief_bio VARCHAR(225),
    date_joined date NOT NULL,
    primary key (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (people_id, people_first_name, people_last_name, email, date_joined) values
    (11, 'Bruno', 'Person 1', 'email 1', '2021-06-12'),
    (12, 'George', 'Person 2', 'email 2', '2019-10-5'),
    (13, 'Alexia', 'Person 3', 'email 3', '2022-05-10'),
    (14, 'Mary', 'Person 4', 'email 4', '2022-07-3'),
    (15, 'Samuel', 'Person 5', 'email 5', '2020-03-11'),
    (16, 'June', 'Person 6', 'email 6', '2023-05-12'),
    (17, 'Gabby', 'Person 7', 'email 7', '2022-06-11'),
    (18, 'Jean', 'Person 8', 'email 8', '2022-12-12'),
    (19, 'Benji', 'Person 9', 'email 9', '2020-03-01'),
    (20, 'Levi', 'Person 10', 'email 10', '2023-03-03')
    ;

select * from people;


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

drop table if exists peopleskills;

CREATE TABLE peopleskills(
    peopleskills_id INT NOT NULL AUTO_INCREMENT,
    skills_id INT NOT NULL,
    people_id INT NOT NULL,
    date_acquired DATE NOT NULL,
    PRIMARY KEY (peopleskills_id),
    FOREIGN KEY (skills_id) REFERENCES skills(skills_id),
    FOREIGN KEY (people_id) REFERENCES people(people_id)
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

insert into peopleskills (people_id,skills_id,date_acquired) values 
    (11, 1, '2023-11-10'),
    (11, 3, '2023-11-11'),
    (11, 5, '2023-11-12'),
    (12, 3, '2023-11-13'),
    (12, 4, '2023-11-14'),
    (12, 5, '2023-11-15'),
    (13, 1, '2023-11-16'),
    (13, 5, '2023-11-17'),
    (15, 3, '2023-11-18'),
    (15, 6, '2023-11-19'),
    (16, 2, '2023-11-20'),
    (16, 3, '2023-11-21'),
    (16, 4, '2023-11-22'),
    (17, 3, '2023-11-23'),
    (17, 5, '2023-11-24'),
    (17, 6, '2023-11-25'),
    (18, 1, '2023-11-26'),
    (18, 3, '2023-11-27'),
    (18, 5, '2023-11-28'),
    (18, 6, '2023-11-29'),
    (19, 2, '2023-11-30'),
    (19, 5, '2023-12-01'),
    (19, 6, '2023-12-02'),
    (20, 1, '2023-12-03'),
    (20, 4, '2023-12-04'),
    (20, 5, '2023-12-05')
;



 

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

create table roles(
    roles_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    sort_priority INT NOT NULL,
    primary key (roles_id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

insert into roles (roles_id, name, sort_priority) values
    (21, 'Designer', 10),
    (22, 'Developer', 20),
    (23, 'Recruit', 30),
    (24, 'Team Lead', 40),
    (25, 'Boss', 50),
    (26, 'Mentor', 60)
    ;


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    peopleroles_id INT NOT NULL AUTO_INCREMENT,
    people_id INT NOT NULL,
    roles_id INT NOT NULL,
    date_assigned DATE NOT NULL,
    PRIMARY KEY (peopleroles_id),
    FOREIGN KEY (people_id) REFERENCES people(people_id),
    FOREIGN KEY (roles_id) REFERENCES roles(roles_id)
);
select * from peopleroles;


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, roles_id, date_assigned)
VALUES
    (11, 22, '2023-11-10'),
    (12, 25, '2023-11-10'),
    (12, 26, '2023-11-10'),
    (13, 22, '2023-11-10'),
    (13, 24, '2023-11-10'),
    (14, 23, '2023-11-10'),
    (15, 23, '2023-11-10'),
    (16, 22, '2023-11-10'),
    (16, 21, '2023-11-10'),
    (17, 21, '2023-11-10'),
    (18, 21, '2023-11-10'),
    (18, 24, '2023-11-10'),
    (19, 22, '2023-11-10'),
    (20, 22, '2023-11-10'),
    (20, 21, '2023-11-10');






