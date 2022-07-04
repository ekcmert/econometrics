//open AIRFARE.DTA
use "C:\Users\LENOVO\Desktop\airfare.dta"

//price elasticity of air travel demand (controlling year specific effects and the route distance (ldist and  ldistsq))
reg lpassen lfare ldist ldistsq y98 y99 y00

//fixed effects model version of the previous model
xtreg lpassen lfare ldist ldistsq y98 y99 y00, fe

//check the relevance assumption lfare concen
reg lfare concen

//2SLS --> two stage version manual

//estimate endogeneous lfare by exogeneous variables and instrumental variable
reg lfare ldist ldistsq y98 y99 y00 concen

//predict new lfare by the previous model
predict lfarehat

//Main OLS model with lfare replaced with predicted lfarehat
reg lpassen lfarehat ldist ldistsq y98 y99 y00

//2SLS ivreg version
ivreg lpassen ldist ldistsq y98 y99 y00 (lfare=concen) 

//close the log file
log close