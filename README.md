---
layout: default
---

|Intermediate Statistics   | 27:202:543  |  
|Friday, 2:00-4:40   | Room: CLJ-574  |
|frank.edwards@rutgers.edu | Office hours by appointment|

## Quick links

[Lecture slides](https://github.com/f-edwards/intermediate_stats/tree/master/slides)

[Data used in class](https://github.com/f-edwards/intermediate_stats/tree/master/data)

[Homeworks](https://github.com/f-edwards/intermediate_stats/tree/master/HW)

## Course description

This is the course syllabus for Intermediate Statistics, Spring 2019. Continuous outcomes that meet the assumptions of ordinary least squares regression are relatively rare in the social sciences. This course focuses our attention on how to estimate regression models for discrete outcomes including binary, categorical, and count variables. We use maximum likelihood estimation to estimate a series of generalized linear models. These flexible tools allow us to more accurately model a wide range of outcomes.

## Communication

I've set up a Slack page for us to communicate about the course. This can be a resource for you to collaborate and ask me questions about homework, and will also be a spot where course announcements are posted. Invites will be circulated before the course begins.

[Course Slack](https://ru-intermed-stats.slack.com)

## Course goals

1. Master maximum likelihood estimation and its application through a variety of generalized linear models
2. Develop expertise in advanced statistical programming and data visualization 
3. Develop the ability to design and conduct quantitative criminological research

## Expectations

- Come prepared. This is a relatively small and advanced course. I expect everyone to participate actively in course discussions.

- Please complete and submit assignments on time. 

- Be respectful and professional. Be mindful of the space you take up in the classroom. Food and drink are allowed, but please keep the cell phone use and non-course related computer use to a minimum. 

- Bring your computer. Most of the work we'll be doing involves writing code, so bring a computer with you to class. Let me know if access to a laptop is an issue.

- Collaborate with your colleagues. I encourage you all to work together to complete assignments. However, I do expect you each to submit your own homework writeups. 

## Prerequisites

A prior graduate-level course in statistics is required. This course assumes students are comfortable with multivariate linear regression, basic probability, and statistical computing.

### Review resources

These [math camp](https://github.com/math-camp/course) materials from UChicago neatly cover the math you need for graduate-level statistics courses.

Jenny Bryan's [STAT 545](http://stat545.com/) course at UBC provides a very comprehensive overview of programming in R and efficient data science workflows.

## Software

All instruction will be conducted in the R statistical programming language. R is free and open-source, and can be downloaded [here](https://cran.r-project.org/).

We will be using the [RStudio integrated development environment](https://www.rstudio.com/products/rstudio/download/). RStudio provides a powerful text editor and a range of very useful utilities. 

In addition to writing code, it is a great tool for writing reports, papers, and slides using [RMarkdown](https://rmarkdown.rstudio.com/lesson-1.html). This syllabus, most of my course materials, and most of my academic papers are based on Markdown and occasionally [LaTeX](https://www.overleaf.com/learn/latex/Learn_LaTeX_in_30_minutes). I strongly recommend that you use RMarkdown to complete course assignments. Other plaintext editors (emacs, vim, sublime, atom, etc) are acceptable substitutes for RStudio, but try to avoid using MS Word or other WSIWYG editors for assignments.  

Lastly, I recommend learning some form of version control to ensure your work is a) backed up, b) easily accessible to collaborators and c) reproducible. Git and GitHub are great and flexible tools for software development that have powerful applications for researchers. Here's a useful [intro to GitHub](https://happygitwithr.com/) for R users.

## Books

We will work primarily from two books. You are not required to purchase either text.

Gelman and Hill's *Data Analysis Using Regression and Multilevel/Hierarchical Models* is a wonderful reference book to have on your shelf as a quantitative researcher, though a second edition is due out soon. I will have a copy available for reference for those of you who prefer not to purchase it.

Wickham's [R for Data Science](https://r4ds.had.co.nz/) is available for free online textbook, though there are print versions available if you prefer to purchase a copy.

These books are also very useful, and some examples are pulled from them:

Healy, [*Data Visualization: A Practical Introduction*](http://socviz.co/index.html) 

McElreath, *Statistical Rethinking: A Bayesian Course with Examples in R and Stan*

## Assignments and grading

Course grading is based on a combination of course participation (20 percent), homework assignments (40 percent) and a final project (40 percent). 

### Homeworks

Problem sets provide you an opportunity to directly apply what we've learned to real-world data analysis and statistical problems. 

I expect to see your code, code output, and your interpretations of the results for each question. RMarkdown is a great way to complete your homeworks, and seamlessly integrates text, code, and code output into a single document. You can submit your compiled homeworks in either .html or .pdf format.

Homework should be submitted to me via email by 10AM on the due date. Late work is penalized according to an exponential decay function where your maximum grade is calculated as *y*=*e*<sup>-*x*/20</sup> where *x* is the number of days an assignment is turned in late. Late work is never worth zero points. Each student is allowed one 3-day extension without penalty for a homework due-date over the semester. 

### Final project

You will design and complete an original empirical criminological paper over the course of the semester. You should seek to write a paper that is of publishable quality. I expect these papers to have a thoughtful theoretical framework, demonstrate a mastery of exploratory data analysis and data visualization, a statistical analysis that uses a generalized linear model, and a clear interpretation of the meaning of the statistical analysis.

Students will propose the topic for their analysis by the second week of class, and are expected to work toward completion of the paper throughout the semester. Work toward the completion of the paper will be included in some homework assignments. 

#### Suggested datasets

While I encourage you to work with any data you like that is appropriate for the assignment, I recognize that at this stage of your graduate career you may not yet have a clear project in mind. Here are a few datasets/archives that I think could lead to strong empirical papers:

The [National Archive of Criminal Justice Data](https://www.icpsr.umich.edu/icpsrweb/content/NACJD/learning-data-guides.html) hosts vast amounts of publicly accessible crime and criminal justice data, along with bibliographies of papers published using each dataset. The National Crime Victimization Survey might be a good place to start.

Here are some newer datasets you could work with. They might require substantial cleaning to get ready for analysis, but haven't been widely used yet in criminology so might present interesting opportunities for new insights.

- [Stanford Open Policing Project](https://openpolicing.stanford.edu/)
- [NJ police use-of-force data](https://www.propublica.org/datastore/dataset/police-use-of-force-new-jersey)
- [NYPD Stop and Frisk data](https://www1.nyc.gov/site/nypd/stats/reports-analysis/stopfrisk.page)
- [Fatal Encounters](https://www.fatalencounters.org/)

For any new dataset you wish to use, I strongly recommend that you seek out prior academic research that has used these data for insights into their potential, structure, and limitations.

## Course topics and schedule

|1/25| Intro to course, review part 1| |
|2/1| The linear model |  |
|2/8| Visualzing data | |
|2/15| Reshaping data Binary outcomes | |
|2/22| Logistic regression |  |
|3/1| Categorical outcomes| Complete paper proposal due|
|3/8| Multinomial regression |  |
|3/15| Count variables |  |
|3/22| Spring Break | |
|3/29| Poisson and negative binomial regression |  |
|4/5| Presentations on research in progress | |
|4/12| Class canceled - PAA | |
|4/19| Introduction to multilevel models (reschedule) | |
|4/26| Missing data and multiple imputation | |
|5/3| Recap | |
|5/10| No class | Final paper due |



