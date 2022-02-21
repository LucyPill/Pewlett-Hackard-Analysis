# Pewlett-Hackard-Analysis

## Overview

### Backdground/Purpose: 
Pewlett Hackard, a large company with several thousands of employees, has thousans of baby boommers who are approcaching retirement age. Hewlett Hackard is looking towars the future in two ways:
1. Offering retiremennt packages for those employees that meet certain criteria 
2. Looking into which positions need to be filled in the near future

The number of upcoming employees retiring will leave thousands of job openings and they need to figure out the the employees that will be retiring in the near future and how many positions Pewlett Hackard will need to fill. 

The purpose of this project is to use pgAdm, create an employee database, and use queries to extract the number of employees retiring by title and the number of employees who are elegible for the company's mentoship program.

## Results:
### Deliverable 1: The Number of Retiring Employees by Title
When applying COUNT (*) to retirement_by_titles table, we can see that the number of employees that will be retiring is very high 133,776; However, this number does not reflect the actual number because this table contains duplicates. Several of the employees in this table have been with the company for many years and have gotten promotions which means that these employees had held several titles within the company. After using the SELECT DISTICNT ON, we were ble to remove duplicates and see that the actual number of employees retiring is 72,458 and not 133,776.

When we do a count by title we can see that the majority of employees retiring are Senior Engineer follow by Senior Staff and Engineer, etc. In addtion 40% of managers will be retiring.

![unique_titles.png](https://github.com/LucyPill/Pewlett-Hackard-Analysis/blob/main/Table%20Images%20/unique_titles.png):|:![retiring_titles_count.png](https://github.com/LucyPill/Pewlett-Hackard-Analysis/blob/main/Table%20Images%20/retiring_titles_count.png)

### Deliverable 2: The Employees Eligible for the Mentorship Program
when applying the SELECT count (*) FROM mentorship_eligibility, we can see that there is a total of 1,549 employees that are eligible to participate in the mentorship proram. This number is low when compared to the employees retiring in the coming years (see querie in the querie folder).

![mentorship_eligibility.png](https://github.com/LucyPill/Pewlett-Hackard-Analysis/blob/main/Table%20Images%20/Mentorship_eligibility.png)

### Deliverable 3: Provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."

#### How many roles will need to be filled as the "silver tsunami" begins to make an impact?

Knowing the number of employees that are eligible to partcicpate in the mentorship program and the numbers of employees retiring is very important because it allows for planning ahead of time and find the resources necessary to overcome the massive number of employees retiring in the near future. As of now, we can see that they are not sufficent mentors by titles that can be able to mentor all the new employees coming in once the company start hiring. Take a look at the table below we can see that 25,916 Senior Engineer will be retiring but there are only 286 that can mentor new employees in this area. The same apply to Senior Staff with a retiring number of 24,926 but only 403 avaible to mentor, and the same case applies to Engineers, Staff, Technique Leader and Assistant Engineer where the number retiring surpasses the number or avaliable mentors.

![retiring_vs_mentor_by_titles.png](https://github.com/LucyPill/Pewlett-Hackard-Analysis/blob/main/Table%20Images%20/retiring_vs_mentor_by_titles.png)

#### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

The answer to this question is no, there are no. The following table shows the number of qualify mentors and the number of employees retiring by departments. Every single departemnt has more employees retiring thang qualify mentors. This means that the company will need to find solutions in order prepare more employees for mentoship programs of find alternatives solutions such a having a group leader for each department that can mentor several employees instead of one of just a couple.

![Mentors_vs_retiring_by_dept.png](https://github.com/LucyPill/Pewlett-Hackard-Analysis/blob/main/Table%20Images%20/Mentors_vs_retiring_by_dept.png)

## Summary:
Pewlet Hackard in facing a massive retirement wave where many employees will be retiring in the near future. The company has a mentorship program where current employees that qualify to be mentor will mentor new employees; However, based on th employees database it looks like that the number of employees qualify to mentor is inversely proportional to the number of employees retiring. The company has to implement new metodolgy to overcome this problem.
