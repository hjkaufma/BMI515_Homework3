/** 1. The following data come from a study that examines 
the efficacy of saliva cotinine as an indicator for exposure 
to tobacco smoke. In one part of the study, seven subjects—none 
of whom were heavy smokers and all of whom had abstained from 
smoking for at least one week prior to the study—were each 
required to smoke a single cigarette. Samples of saliva were 
taken from all individuals 2, 12, 24, and 48 hours after 
smoking the cigarette. The cotinine levels at 12 hours and 
at 24 hours are shown below. Assume data follow normal 
distribution. (60 points) **/

PROC sql;
	create table work.data
	(subject num, 
	after12 num, 
	after24 num);

insert into work.data
	values (1, 73, 24)
	values(2, 58, 27)
	values(3, 67, 49)
	values(4, 93, 59)
	values(5, 33, 0)
	values(6, 18, 11)
	values(7, 147, 43);

select * 
	from work.data;

proc printto; run;

/** (a) Are the two samples of data paired or independent? (10 points) **/

/** Since the subjects are measured twice, the samples are paired **/ 

/** (b) What are the appropriate null and alternative hypotheses? (25 points) **/

/** The null hypothesis of this experiment would be that there is no relationship between
the saliva samples acting as an indicator of exposure to smoking tobacco. /**

/** The alternative hypothesis of this experiment is that there is a relationship between
the saliva samples acting as an indicator of exposure to smoking tobacco. /**


/** (d) Conduct the test at the 0.05 level of significance (by hand or SAS). 
What do you conclude? (25 points) **/

proc ttest data=work.data;
	paired after12*after24;
run;

/** There is evidence to conclude that the null hypothesis can be rejected **/

/** 2. In the BoneMarrow.xls, each row is patient, where “T” indicates the 
disease-free survival time since bone marrow transplant (the time in days to 
death, relapse, or the end of the study), “Group” indicates three risk 
categories: ALL (acute lymphoblastic leukemia), AML-Low Risk (acute myelocytic 
leukemia, low risk), and AML-High Risk. (40 points) **/

/** (a) Produce some descriptive statistics and plots. Do you think data follow 
normal distributions? Does variances are equal across the three groups based on 
the descriptive statistics or plots? (20 points) **/
PROC IMPORT datafile = "/home/u62107656/bmi515/homework3/BoneMarrow.xlsx"
			out = data1
			DBMS = XLSX
			replace;
run;

proc univariate data= work.data1 normal;
	var T;
run;

proc npar1way data = work.data1 wilcoxon dcsf; 
	class Group;
	var T;
	exact;
run;

/** (b) Conduct ANOVA. What are the appropriate null and alternative hypotheses? 
If needed, conduct post-hoc tests. What do you conclude? (20 points) **/

/** The null hypothesis would be that **/

/** non parametic post doc to find out why normal distribution to drive variability **/
/** stars are important 43 last slide last output is what group is driving that **/

PROC ANOVA data=work.data1;
	class Group;
	model T = Group;
	means group/bon;
RUN;

/** 3. Repeat 2. (b), assuming data does not follow normal distribution. (40 points) **/
/** Wilcocks **/

/** 4. What are the advantages and disadvantages of nonparametric tests 
over parametric tests? (10 points) **/

/** Parametric tests assume the given parameters **/


