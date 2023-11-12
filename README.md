# Homework 7 - Database Creation and Query Results

## Description

This repository showcases the creation of a relational database using SQL statements and the resulting tables based on specific queries. The database is designed to manage human resources efficiently, capturing essential details about skills, individuals, acquired skills, roles, and role assignments.

## Files

- **h7-ddl.sql**: This file contains the Data Definition Language (DDL) statements used to create the database tables.

- **h7.qmd**: A QMD (Query Markdown) file demonstrating the resulting tables based on the queries executed on the database as well as crow's foot diagram

## Database Details

### Tables

1. **Skills Table (skills):**
   - Captures information about various skills, including name, description, tag, URL, and time commitment.

2. **People Table (people):**
   - Records details about individuals, such as first name, last name, email, LinkedIn URL, headshot URL, Discord handle, brief bio, and date joined.

3. **PeopleSkills Table (peopleskills):**
   - Establishes the relationship between people and skills, noting the acquisition date for each skill.

4. **Roles Table (roles):**
   - Defines different roles within the system, specifying the name and sort priority.

5. **PeopleRoles Table (peopleroles):**
   - Associates individuals with roles and records the date of role assignment.

## Viewing HTML File on Mac

If you encounter difficulties opening the HTML file, follow these steps:

1. **Locate HTML File:**
   - Navigate to the directory containing the HTML file using the Terminal.

2. **Open in Browser:**
   - Use the `open` command to launch the HTML file in your default browser.
     ```
     open h7.html
     ```









