Predicting male fertility from personal risk factors
========================================================
author: iNLyze
date: 2016-05-12











<img src="father-and-son-silhouette.png" style="background-color:transparent; border:0px; box-shadow:none; width:200px"></img>
<style>
.small-code pre code {
  font-size: 0.8em;
}
</style>

Significance of fertility
========================================================
class: small-code

"Infertility [...] is also a significant clinical problem today, which affects 8–12% of couples worldwide. Of all infertility cases, approximately 40–50% is due to “male factor” infertility and as many as 2% of all men will exhibit suboptimal sperm parameters."
[Kumar et al](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4691969/)
*J Hum Reprod Sci.* 2015 Oct-Dec; 8(4): 191–196. 

*	Direct analysis of sperm quality requires expert knowledge and specialized equipment
*	Sperm quality is often affected by a number of risk factors
*	Predicting male fertility from such factors may give a first indication
*	Could save cost and time by focusing more in-depth analysis on persons who are more likely whose fertility might be altered. 

Data and model building
========================================================
## How the data was obtained:
*	Data was originally created as part of [Gil et al](https://www.researchgate.net/profile/Joaquin_De_Juan/publication/230868076_Predicting_seminal_quality_with_artificial_intelligence_methods/links/09e415058f10cc3081000000.pdf)
*	A subset of the original data (100 x 10) is available at [UCI](https://archive.ics.uci.edu/ml/datasets/Fertility)


## How the model was built:
*	The data set was split into training and a test set (70%/30%, respectively)
*	A random forest model was built using 632 Bootstrapping with 100 iterations and 100 repeats
*	This model achieved an accuracy of 93%
*	About comparable to performance achieved with best model in original publication

Model performance
========================================================
class: small-code
*	Data set imbalanced, classes N, O have 88, 12 occurences 
*	Small data set, only 100 samples
*	10 dimensions, original publication used 34 dimensions

```
Confusion Matrix and Statistics

          Reference
Prediction  N  O
         N 26  2
         O  0  1
                                          
               Accuracy : 0.931           
                 95% CI : (0.7723, 0.9915)
    No Information Rate : 0.8966          
    P-Value [Acc > NIR] : 0.4109          
                                          
                  Kappa : 0.4727          
 Mcnemar's Test P-Value : 0.4795          
                                          
            Sensitivity : 0.33333         
            Specificity : 1.00000         
         Pos Pred Value : 1.00000         
         Neg Pred Value : 0.92857         
             Prevalence : 0.10345         
         Detection Rate : 0.03448         
   Detection Prevalence : 0.03448         
      Balanced Accuracy : 0.66667         
                                          
       'Positive' Class : O               
                                          
```

How to use the application
====
*	Type in require information and press submit
*	Data is normalized to match format of data set
*	To save time model is loaded from file, only prediction is made
*	Output has been chosen to be as neutral as possible due to the very personal nature of the matter. 

* Note: Age is confined to inputs only between 18 - 36 years due to nature of study (and relavent age when fatherhood is desired by large proportion of men). Predicting outside this age interval is potentially unreliable. 
