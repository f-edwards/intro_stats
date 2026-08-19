---
layout: default
---

| Introduction to Statistics   | 27:202:542 |  
| Monday, Tuesday 1:00 - 2:20PM | Room: CLJ 574 |
| Instructor: Frank Edwards | frank.edwards@rutgers.edu|
| Office hours: Wednesday 10AM-12PM | Room: CLJ 579B |

## Quick links

[Lecture slides](https://github.com/f-edwards/intro_stats/tree/master/slides)

[Homework assignments](https://github.com/f-edwards/intro_stats_26/tree/master/hw)

## Prerequisites

No prior statistics or programming experience is assumed. Familiarity with algebra and basic calculus is helpful, but we'll be reviewing the foundational math throughout the semester. 

I recommend this [refresher](https://iqss.github.io/prefresher/) if you are feeling shaky on math fundamentals. The 3Blue1Brown series on [linear algebra](https://www.3blue1brown.com/?topic=linear-algebra), [calculus](https://www.3blue1brown.com/?topic=calculus), and [probability](https://www.3blue1brown.com/?topic=probability) are also worth checking out.

If you are new to programming or new to `R`, that is ok! We will take a slow pace throughout. If you'd like some focused support, here is a list how to do [many common tasks with `R`](https://posit.cloud/learn/recipes).

## Course description

This is the course syllabus for Introduction to Statistics, Fall 2026. It is a graduate-level introduction to conducting quantitative social science research, and is the first part of a two-semester sequence. 

We will cover the foundations of statistical computing with a heavy emphasis on data visualization using the `R` programming language and `tidyverse` suite of packages. You will also learn how to write statistical reports using Quarto. 

We will review the core math needed for statistics (some algebra, calculus, and linear algebra), then proceed to build foundations in probability. We will cover the basics of quantifying uncertainty in statistics, and learn how to use and interpret linear regression models.

## Course goals

1. Become comfortable fundamentals of probability and statistics. 

2. Learn how to describe and estimate statistical relationships with linear regression. 

3. Explain basic principles of causal inference and research design.

4. Use command-line interfaces for interacting with a computer and its file structure.

5. Design and write basic data analysis programs using the `R` programming language. 

6. Produce data visualizations using `ggplot2`. 

7. Produce professional-looking reports using Quarto.

## Book

- Required: Gelman, Hill, and Vehtari. Regression and Other Stories (ROS). 2024.  https://avehtari.github.io/ROS-Examples/index.html

- Recommended: Alexander. Telling Stories with Data. 2023. https://tellingstorieswithdata.com/

## Communication

Email is my preferred mode of communication. Announcements will be sent to the class listserv. We won't be using Canvas.

## Expectations

- Attendance is required. 

- Bring a computer.

- Complete homework on time. 

- Keep up with the reading.

- Be respectful and professional. 

- Collaborate with your colleagues. 

- Document your code. 

- Try not to use AI tools.

## AI Policy

Large language models have become incredibly good at writing `R` code. They also have caused tremendous social and environmental harm and have been shown to impede learning. 

I will allow AI usage under the following conditions:

1. You do not ask an LLM to complete an entire assignment or homework question. You are here to learn. Please don't waste my time by having me grade LLM output.
2. You first try to solve a problem yourself. You should expect to struggle with the material, it is hard. But the struggle is where learning happens!
3. Only use LLMs for specific advice on technical problems: i.e. 'how do I compute a z-score for a variable in R?' or 'how do I change an axis label in ggplot?'. 
4. Clearly indicate where you used AI in your assignment with the flag **AI support used**
5. Include a full transcript of your LLM sessions. The following prompt will do it: "provide a transcript of this session". Attach this log to homework submissions as `LLM_log.txt`

Companies like Anthropic and OpenAI want you to become paying users dependent on their platforms. You don't want them to own your workflow. You should build you workflow with open-source tools whenever possible. Open-source and on-device models have several advantages for researchers. They don't cost money, they can produce reproducible output, and they keep your data secure. If you are going to use an LLM, I recommend using [Ollama](https://ollama.com/) with Gemma4 (or similar) on your laptop.  

## Software

All instruction will be conducted in the `R` statistical programming language. R is free and open-source, and can be downloaded [here](https://cran.r-project.org/).

We will be using the [RStudio integrated development environment](https://www.rstudio.com/products/rstudio/download/). RStudio provides a powerful text editor and a range of very useful utilities. Positron is similar and is an acceptable choice if you prefer it.

In addition to writing code, RStudio a great tool for writing reports, papers, and slides using [Quarto](https://quarto.org/), which is a plain text format based on markdown. This syllabus, most of my course materials, and most of my academic papers are written in markdown. 

You are required to submit assignments as rendered Quarto output. 

Lastly, I recommend learning some form of version control to ensure your work is a) backed up, b) easily accessible to collaborators and c) reproducible. Git and GitHub are great and flexible tools for software development that have powerful applications for researchers. Here's a useful [intro to GitHub](https://happygitwithr.com/) for R users.

If you'd like to clone the course repository on your laptop, you can run

```
git clone https://github.com/f-edwards/intro_stats.git
```

To keep it up to date with current slides and homework, just navigate to the course directory (`cd intro_stats`), then run

```
git fetch
```

## Assignments and grading

Grades are based entirely on homework assignments. I grade assignments with a simple 2 point scale, and am generally a forgiving grader. If your work indicates a serious effort to complete the assignment, you can expect to receive full 2 points of credit. If you submit incomplete or sloppy work, you can expect 1 point of credit. Incomplete work will receive a zero.

Statistics is hard, and I prioritize growth and learning over getting correct answers in grading and evaluation.

All students who work hard and complete the assignments can expect to receive an A as their final grade. 

### Homework

I will assign homework each week. Assignments are due on Sunday by 10pm. Email your homework assignments (output and source code) to the instructor.

Don't wait until the last minute to get started. These homeworks should take you on average about 6 hours of work to complete. Space that work out and give yourself time to ask for help from your peers and your instructor. 

Group work is strongly encouraged. I recommend scheduling a time to meet with your classmates to work on the problem sets collectively. Quantitative research is a team sport, but I still do expect you to write your own code and interpretation. Don't just copy/paste from your peers, the internet, or a chatbot. Cheating will make me grumpy, please don't do it. 

Life happens. All students are granted two free extensions on homework, no questions asked. Just email prior to the due date to let me know you'll be taking an extension and when I should expect your submission.

## Course schedule, topics, and readings

**Week 1**

Reading: ROS Ch 1-2, Appendix A A.1 - A.4;

- 9/1: Lab - Course intro and Introduction to R
	- Review the syllabus and course format
	- Installation and FOSS principles
		- Local LLMs and responsible AI usage
	- File paths and structures
	- Working from the terminal, basic commands
    - Install and setup: R and RStudio
    - Introduction to R
		- Vectors, matrices, and data.frames
		- Indexing
		- Vector operations
		- Introducing `tidyverse`
	 
- HW 1 Due 9/6 

**Week 2**

Reading: ROS Ch 3

- 9/7: Labor Day, no class 

- 9/8: Math basics for statistics
	- Algebra: order of operations, exponents and logarithms, polynomials, linear functions
    - Linear algebra: vectors and matrices, scalar operations
	- Functions and limits
	- The basics of derivatives and integrals
	- Basic set operations
	- Marginal, joint, conditional probability
	- Bayes theorem

- HW 2: Due 9/13 (Extension available for Rosh Hashanah)

**Week 3**

Reading: ROS Ch 4-5

- 9/14: Lecture - Generalizing from samples to populations 
	- Measurement: theoretical constructs and operational measures
	- Basic principles of inference: parameters, statistics, validity
	- Random variables
	- Measures of central tendency: mean, median, mode
	- Measures of dispersion: variance, standard deviation, quantiles

- 9/15: Lab - Writing in plain text
	- WYSIWYG vs plain text
	- Quarto 101
	- Markdown 101
	- Writing math with LaTeX

- HW 3: Due 9/20 

**Week 4**

Reading: ROS Ch 6

- 9/21: Lecture - Types of variables and measures of association (absences excused for Yom Kippur)
	- Continuous, integer, binary, categorical, and ordinal measures
	- Correlation
	- Assessing bivariate distributions with crosstabs and scatterplots

- 9/22: Lab - importing data, visualization basics, simulation 101
	- Importing tabular data, `read_csv()`
	- Introduction to `ggplot2`
	- Simulating random variables
	- Simulating a data generating process

- HW 4: Due 9/27 

**Week 5**

Reading: ROS Ch 7

- 9/28: Lecture - Introducing the linear regression model
	- Basic theory of linear regression
	- The structural component of the model
	- Theorizing and visualizing relationships as linear
	- Deterministic predictions

- 9/29: `lm()`
	- Introduction to formula syntax for models in R
	- `group_by` and `summarize()`
	- visuals for more than one variable

- HW 5: Due 10/4

**Week 6**

Reading: ROS Ch 8

- 10/5:  Lecture - The stochastic (random) component of the linear regression model
	- Anatomy of a linear regression model
	- What is error? 
	- Ordinary Least Squares as an estimation approach
	- The meaning of stochastic error
	- Stochastic predictions

- 10/6: Lab - more linear models, Bayesian and frequentist estimation
	- Introducing `brm()`
	- Intrepreting `summary()` output for linear models
	- density functions: `pnorm()` and `dnorm()`

- HW 6: Due 10/11

**Week 7** 

Reading: ROS Ch 9

- 10/12: Inference and prediction with linear regression
	- The law of large numbers
	- The central limit theorem
	- Standard errors of parameters
	- Hypothesis testing
	- Confidence intervals
	- Prediction intervals

- 10/13: Lab - prediction
	- Introducing `predict()`
	- Introducing `tidybayes` 
		- `linpred_draws()`
		- `predicted_draws()`

- HW 7: Due 10/18 

**Week 8** 

Reading: ROS Ch 10

- 10/19: Multiple regression
	- Logic of conditioning
	- Categorical predictors
	- Interpretation of coefficients
	- Interactions

- 10/20: Lab - multiple regression
	- Fitting models with factors
	- Formula syntax for interactions
	- Interpretation of interactions
	- Prediction for interactions

- HW 8: Due 10/25 

**Week 9** 

Reading: ROS Ch 11

- 10/26: Linear regression assumptions, diagnostics, fit
	- Assumptions of OLS 
	- Observed versus fitted
	- Residual plots
	- Replications from fitted
	- Goodness of fit
	- Cross validation

- 10/27: 
	- Visualization for diagnostics
	- Simulation from model fit
	- `BIC()`, `AIC()`
	- `WAIC()`, `loo()`

- HW 9: Due 11/1 

**Week 10** 

Reading: ROS Ch 12

- 11/2: Nonlinear transformations
	- Linear transformations
		- Standardization with *z* scores
	- Nonlinear transformations
		- Logarithms
		- Discretizing continuous measures

- 11/3 Lab - implementing transformations
	- `scale()`, `factor()` and inline transformations
	- `log()`, `exp()`, `log1p()`, `expm1()`
	- Axis transformations in ggplot
	- Conditional transforms
		- `ifelse()`
		- `case_when()`

- HW 10: Due 11/8 

**Week 11** 

Reading: ROS Ch 16 - 17

- 11/9: Design, power, extrapolation, missing data
	- Statistical power
	- Replication crisis and publication bias
	- Post-stratification
	- Deterministic imputation
	- Multiple imputation

- 11/10: Lab - missing data
	- Computing statistical power 
	- Evaluating missing data
	- Basic multiple imputation with `mice`

**Week 12** 

Reading: ROS Ch 18

- 11/16: Lecture - Causal inference in experimental designs
	- Potential outcomes
	- Thinking counterfactually
	- Experimental design and randomization
	- Comparing means and the sample average treatment effect

- 11/17: Lab - Simulation for regression and power
	- Computing power directly
	- Simulating from a regression model
	- Computing power from simulations
	- Prior prediction

- HW 12: Due 11/24 (extended for ASC)

**Week 13** 

Reading: ROS Ch 19

11/23: Causal inference with observational data, part 1
	- Introducing causal graphs
		- Confounding and causal graphs
		- Backdoor criterion and d-separation
		- Good and bad controls
		- Mediation

11/24: Lab - drawing and analyzing causal graphs
	- Introduction to `dagitty` and `ggdag`
	- Drawing a causal model
	- Identifying implications of causal models

- HW 12: Due 11/24 (same hw as week 12)

**Week 14**

Reading: ROS Ch 20

- 11/30: Causal inference with observational data, part 2
	- Ignorability, balance, empirical support
	- Constructing counterfactuals with matching and weighting
		- Propensity score methods
		- Inverse probability of treatment methods

- 12/1: Lab - matching and weighting
	- Implementing propensity scores for linear regression
	- Implementing inverse probability of treatment for linear regression
	- Using weights for regression

- HW 14: Due 12/6 

**Week 15**

Reading: ROS Ch 21

- 12/7: Causal inference with observational data, part 3
	- Defining the estimand clearly
	- Instrumental variables
	- Regression discontinuity
	- Difference in differences

- 12/8: Lab - Visualization for causal inference 
	- Introducing `marginaleffects`
	- Small multiple plots 
	- Posterior visualization with `tidybayes`

- HW 15: Due 12/13
