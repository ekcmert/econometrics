use "C:\Users\Gamegaraj\Desktop\gedu2.dta"
merge 1:1 countrycode timecode using "C:\Users\Gamegaraj\Desktop\ed2.dta"
merge 1:1 countrycode timecode using "C:\Users\Gamegaraj\Desktop\ll2.dta"
drop _merge 
save "C:\Users\Gamegaraj\Desktop\gedu2.dta", replace
merge 1:1 countrycode timecode using "C:\Users\Gamegaraj\Desktop\ll2.dta"
browse
edit
drop _merge 
tab countryname
g quality = ( pısameanperformanceonthesciences+ pısameanperformanceonthereadings+ pısameanperformanceonthemathemat)/3
. threshold gdpgrowthannualnygdpmktpkdzg , threshvar( quality ) regionvars( gdpconstant2015usnygdpmktpkd humancapitalindexhcıscale01hdhcı adjustedsavingseducationexpendit tradeofgdpnetrdgnfszs netinvestmentinnonfinancialasset liquidliabilitiestogdpgfdddı05 )
. threshold gdpgrowthannualnygdpmktpkdzg , threshvar( quality ) regionvars( gdpconstant2015usnygdpmktpkd humancapitalindexhcıscale01hdhcı adjustedsavingseducationexpendit tradeofgdpnetrdgnfszs  )
. threshold gdpgrowthannualnygdpmktpkdzg , threshvar( quality ) regionvars( gdpconstant2015usnygdpmktpkd adjustedsavingseducationexpendit tradeofgdpnetrdgnfszs  )
. threshold gdpgrowthannualnygdpmktpkdzg , threshvar( quality ) regionvars( gdpconstant2015usnygdpmktpkd adjustedsavingseducationexpendit  )
. threshold gdpgrowthannualnygdpmktpkdzg , threshvar( quality ) regionvars( gdpconstant2015usnygdpmktpkd adjustedsavingseducationexpendit lifeexpectancyatbirthtotalyearss )
. threshold gdpgrowthannualnygdpmktpkdzg , threshvar( quality ) regionvars( gdpconstant2015usnygdpmktpkd adjustedsavingseducationexpendit lifeexpectancyatbirthtotalyearss ) trim(1)
. threshold gdpgrowthannualnygdpmktpkdzg , threshvar( quality ) regionvars( gdpconstant2015usnygdpmktpkd adjustedsavingseducationexpendit tradeofgdpnetrdgnfszs  ) trim(1)
. threshold gdpgrowthannualnygdpmktpkdzg , threshvar( quality ) regionvars( gdpconstant2015usnygdpmktpkd humancapitalindexhcıscale01hdhcı adjustedsavingseducationexpendit tradeofgdpnetrdgnfszs  ) trim(1)
rename gdpgrowthannualnygdpmktpkdzg growth
rename gdpconstant2015usnygdpmktpkd initialGDP
rename adjustedsavingseducationexpendit educexp
rename initialGDP initgdp
g linitgdp = ln(initgdp)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp  )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp ınflationconsumerpricesannualfpc )
. threshold growth , threshvar( quality ) regionvars( lifeexpectancyatbirthtotalyearss educexp tradeofgdpnetrdgnfszs humancapitalindexhcıscale01hdhcı )
. threshold growth , threshvar( quality ) regionvars( lifeexpectancyatbirthtotalyearss educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc netinvestmentinnonfinancialasset )
. threshold growth , threshvar( quality ) regionvars( lifeexpectancyatbirthtotalyearss educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc liquidliabilitiestogdpgfdddı05 )
. threshold growth , threshvar( quality ) regionvars( lifeexpectancyatbirthtotalyearss educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc liquidliabilitiestogdpgfdddı05 ) trim(0)
. threshold growth , threshvar( quality ) regionvars( lifeexpectancyatbirthtotalyearss educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc liquidliabilitiestogdpgfdddı05 ) trim(49)
. threshold growth , threshvar( quality ) regionvars( lifeexpectancyatbirthtotalyearss educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc liquidliabilitiestogdpgfdddı05 ) trim(1)
replace quality = quality[_n-1] if missing quality
replace quality = missing if quality == "."
replace quality = missing if quality == .
replace quality = quality[_n-1] if quality == .
drop quality 
g quality = ( pısameanperformanceonthesciences+ pısameanperformanceonthereadings+ pısameanperformanceonthemathemat)/3
replace quality = quality[_n-1] if quality == . & country[_n-1] == country[_n]
replace quality = quality[_n-1] if quality == . & countryname[_n-1] == countryname[_n]
drop quality 
g quality = ( pısameanperformanceonthesciences+ pısameanperformanceonthereadings+ pısameanperformanceonthemathemat)/3
replace quality = quality[_n+1] if quality == . & country[_n+1] == country[_n]
replace quality = quality[_n+1] if quality == . & countryname[_n+1] == countryname[_n]
drop quality 
g quality = ( pısameanperformanceonthesciences+ pısameanperformanceonthereadings+ pısameanperformanceonthemathemat)/3
replace quality = quality[_n-1] if quality == . & countryname[_n-1] == countryname[_n] & quality[_n-1] != .
sum humancapitalindexhcıscale01hdhcı
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs netinvestmentinnonfinancialasset lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc barroleeaverageyearsoftotalschoo liquidliabilitiestogdpgfdddı05 )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs netinvestmentinnonfinancialasset lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc liquidliabilitiestogdpgfdddı05 )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs netinvestmentinnonfinancialasset liquidliabilitiestogdpgfdddı05 )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  liquidliabilitiestogdpgfdddı05 )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc barroleeaverageyearsoftotalschoo )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc)
rename initgdp gdp
drop linitgdp 
g initgdp = gdp[_n-1] if countryname[n] == countryname[n-1]
sum initgdp
drop initgdp 
g initgdp = gdp[_n-1] if countrycode[n] == countrycode[n-1]
drop initgdp 
g initgdp = gdp[_n-1] if year[n] - 1 == year[n-1]
g initgdp = gdp[_n-1] if time[n] - 1 == time[n-1]
g initgdp = gdp[_n-1] if initgdp == . & countryname[n] == countryname[n-1]
replace initgdp = gdp[_n-1] if initgdp == . & countryname[n] == countryname[n-1]
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc)
g linitgdp = ln(initgdp)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs barroleeaverageyearsoftotalschoo ınflationconsumerpricesannualfpc)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss netinvestmentinnonfinancialasset humancapitalındexhcıexpectedyear )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss netinvestmentinnonfinancialasset)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  netinvestmentinnonfinancialasset)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  ınflationconsumerpricesannualfpc)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc netinvestmentinnonfinancialasset )
merge 1:1 countryname timecode using "C:\Users\Gamegaraj\Desktop\po.dta"
merge 1:1 countryname timecode using "C:\Users\Gamegaraj\Desktop\po.dta"
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss unemploymenttotaloftotallaborfor populationtotalsppoptotl )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss unemploymenttotaloftotallaborfor  )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss  populationtotalsppoptotl )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss unemploymenttotaloftotallaborfor populationtotalsppoptotl ) trim(1)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss unemploymenttotaloftotallaborfor populationtotalsppoptotl ) trim(5)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss  populationtotalsppoptotl )
g lpop = ln( populationtotalsppoptotl )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss  lpop )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss unemploymenttotaloftotallaborfor  )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss   )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss unemploymenttotaloftotallaborfor lpop )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs unemploymenttotaloftotallaborfor lpop )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs unemploymenttotaloftotallaborfor )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs liquidliabilitiestogdpgfdddı05 unemploymenttotaloftotallaborfor )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc netinvestmentinnonfinancialasset unemploymenttotaloftotallaborfor )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lpop unemploymenttotaloftotallaborfor )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc unemploymenttotaloftotallaborfor )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs unemploymenttotaloftotallaborfor )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs unemploymenttotaloftotallaborfor ınflationconsumerpricesannualfpc )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss   )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lpop )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc unemploymenttotaloftotallaborfor )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs netinvestmentinnonfinancialasset )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs netinvestmentinnonfinancialasset ) tr
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs netinvestmentinnonfinancialasset ) trim(1)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs humancapitalindexhcıscale01hdhcı ) trim(1)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs liquidliabilitiestogdpgfdddı05 ) trim(1)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs netinvestmentinnonfinancialasset harmonizedtestscorestotalhdhcıhl ) trim(1)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs unemploymenttotaloftotallaborfor )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss   )
drop in 977/978
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss   )
. threshold growth linitgdp, threshvar( quality ) regionvars(  educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss   )
. threshold growth linitgdp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss unemploymenttotaloftotallaborfor lpop netinvestmentinnonfinancialasset liquidliabilitiestogdpgfdddı05 , threshvar( quality ) regionvars(  educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss   )
. threshold growth linitgdp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss unemploymenttotaloftotallaborfor lpop netinvestmentinnonfinancialasset liquidliabilitiestogdpgfdddı05 , threshvar( quality ) regionvars(  educexp   )
. threshold growth linitgdp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss unemploymenttotaloftotallaborfor lpop netinvestmentinnonfinancialasset liquidliabilitiestogdpgfdddı05 , threshvar( quality ) regionvars(  educexp   ) trim(1)
. threshold growth linitgdp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss unemploymenttotaloftotallaborfor lpop  , threshvar( quality ) regionvars(  educexp   )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss unemploymenttotaloftotallaborfor lpop )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss unemploymenttotaloftotallaborfor lpop ) trim(1)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc  unemploymenttotaloftotallaborfor lpop )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss unemploymenttotaloftotallaborfor)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc unemploymenttotaloftotallaborfor)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  unemploymenttotaloftotallaborfor)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs )
g hk
g hk = humancapitalindexhcıscale01hdhcı
replace hk = hk[_n-1] if hk == . & countryname[_n-1] == countryname[_n] & hk[_n-1] != .
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp hk tradeofgdpnetrdgnfszs )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs netinvestmentinnonfinancialasset liquidliabilitiestogdpgfdddı05 )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc unemploymenttotaloftotallaborfor  )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc unemploymenttotaloftotallaborfor  )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc unemploymenttotaloftotallaborfor  )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  unemploymenttotaloftotallaborfor  )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  liquidliabilitiestogdpgfdddı05  )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  liquidliabilitiestogdpgfdddı05  netinvestmentinnonfinancialasset )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  liquidliabilitiestogdpgfdddı05  ınflationconsumerpricesannualfpc )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  liquidliabilitiestogdpgfdddı05  unemploymenttotaloftotallaborfor )
replace initgdp = 6.595e+10 in 956
replace initgdp = 6.984e+10 in 957
replace initgdp = 7.598e+10 in 958
replace initgdp = 8.004e+10 in 959
replace initgdp = 8.766e+10 in 960
save "C:\Users\Gamegaraj\Desktop\gedu2.dta", replace
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  liquidliabilitiestogdpgfdddı05   )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs     )
drop linitgdp 
g linitgdp = ln(initgdp)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs     )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  netinvestmentinnonfinancialasset lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc liquidliabilitiestogdpgfdddı05 unemploymenttotaloftotallaborfor lpop )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  netinvestmentinnonfinancialasset lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc liquidliabilitiestogdpgfdddı05 unemploymenttotaloftotallaborfor lpop ) tr
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  netinvestmentinnonfinancialasset lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc liquidliabilitiestogdpgfdddı05 unemploymenttotaloftotallaborfor lpop ) trim(1)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  netinvestmentinnonfinancialasset lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc liquidliabilitiestogdpgfdddı05 unemploymenttotaloftotallaborfor  ) trim(1)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  netinvestmentinnonfinancialasset lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc liquidliabilitiestogdpgfdddı05 unemploymenttotaloftotallaborfor lpop )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  netinvestmentinnonfinancialasset lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc liquidliabilitiestogdpgfdddı05  lpop )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  netinvestmentinnonfinancialasset lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc  unemploymenttotaloftotallaborfor lpop )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc liquidliabilitiestogdpgfdddı05 unemploymenttotaloftotallaborfor lpop )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc liquidliabilitiestogdpgfdddı05 unemploymenttotaloftotallaborfor  )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc unemploymenttotaloftotallaborfor lpop )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc liquidliabilitiestogdpgfdddı05 unemploymenttotaloftotallaborfor lpop )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc liquidliabilitiestogdpgfdddı05 unemploymenttotaloftotallaborfor  )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss liquidliabilitiestogdpgfdddı05 unemploymenttotaloftotallaborfor  )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc lifeexpectancyatbirthtotalyearss liquidliabilitiestogdpgfdddı05   )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  lifeexpectancyatbirthtotalyearss liquidliabilitiestogdpgfdddı05   )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs   )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  liquidliabilitiestogdpgfdddı05  netinvestmentinnonfinancialasset )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  liquidliabilitiestogdpgfdddı05  netinvestmentinnonfinancialasset hk )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  liquidliabilitiestogdpgfdddı05  netinvestmentinnonfinancialasset ınflationconsumerpricesannualfpc )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs  liquidliabilitiestogdpgfdddı05   ınflationconsumerpricesannualfpc )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs ınflationconsumerpricesannualfpc )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs unemploymenttotaloftotallaborfor )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs unemploymenttotaloftotallaborfor lifeexpectancyatbirthtotalyearss )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs unemploymenttotaloftotallaborfor lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs unemploymenttotaloftotallaborfor lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc lpop )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs unemploymenttotaloftotallaborfor lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs unemploymenttotaloftotallaborfor lifeexpectancyatbirthtotalyearss )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs unemploymenttotaloftotallaborfor lifeexpectancyatbirthtotalyearss liquidliabilitiestogdpgfdddı05 )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs unemploymenttotaloftotallaborfor lifeexpectancyatbirthtotalyearss netinvestmentinnonfinancialasset )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs unemploymenttotaloftotallaborfor lifeexpectancyatbirthtotalyearss  )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs unemploymenttotaloftotallaborfor lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszst )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs unemploymenttotaloftotallaborfor lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs unemploymenttotaloftotallaborfor liquidliabilitiestogdpgfdddı05 ınflationconsumerpricesannualfpc )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs unemploymenttotaloftotallaborfor netinvestmentinnonfinancialasset ınflationconsumerpricesannualfpc )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs unemploymenttotaloftotallaborfor netinvestmentinnonfinancialasset  )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs unemploymenttotaloftotallaborfor netinvestmentinnonfinancialasset  )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs unemploymenttotaloftotallaborfor netinvestmentinnonfinancialasset lifeexpectancyatbirthtotalyearss )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs unemploymenttotaloftotallaborfor lifeexpectancyatbirthtotalyearss  )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc  )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc unemploymenttotaloftotallaborfor  )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc unemploymenttotaloftotallaborfor lpop )
g mpop = populationtotalsppoptotl/1000000
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc unemploymenttotaloftotallaborfor mpop )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc unemploymenttotaloftotallaborfor  )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc unemploymenttotaloftotallaborfor lpop )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc unemploymenttotaloftotallaborfor  )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc )
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc unemploymenttotaloftotallaborfor  )
doedit "C:\MertDocs\DESKTOP\SU\3.1\ECON323\econ323 ass3\Econ323 Assignment3 Mert Ekici 26772.do"
outreg2 using tables.doc, replace seeout
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc unemploymenttotaloftotallaborfor  )
outreg2 using tables.doc, replace seeout
outreg2 using tables.doc, replace seeout
outreg2 using tables.doc, replace seeout
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc unemploymenttotaloftotallaborfor  )
outreg2 using tables.doc, replace seeout
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc unemploymenttotaloftotallaborfor  )
outreg2 using tables.doc, replace seeout
outreg2 using tables.docx, replace seeout
reg growth humancapitalindexhcıscale01hdhcı
outreg2 using tables.doc, replace seeout
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc unemploymenttotaloftotallaborfor  )
outreg2 using tables.doc, replace seeout
outreg2 using tables.doc, replace seeout
cd "C:\Users\Gamegaraj\Desktop"
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc unemploymenttotaloftotallaborfor  )
outreg2 using tables.doc, replace seeout
reg growth linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc unemploymenttotaloftotallaborfor
reg growth linitgdp educexp tradeofgdpnetrdgnfszs lifeexpectancyatbirthtotalyearss ınflationconsumerpricesannualfpc unemploymenttotaloftotallaborfor
rename tradeofgdpnetrdgnfszs trade
rename lifeexpectancyatbirthtotalyearss lexpect
rename ınflationconsumerpricesannualfpc inflation
rename unemploymenttotaloftotallaborfor unemp
rename lexpect lifeexpect
g lexpect = ln(lifeexpect)
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp trade lexpect inflation unemp  )
drop lexpect 
rename lifeexpect lexpect
save "C:\Users\Gamegaraj\Desktop\gedu2.dta", replace
. threshold growth , threshvar( quality ) regionvars( linitgdp educexp trade lexpect inflation unemp  )
outreg2 using tables.doc, replace seeout
outreg2 using tables.doc, replace seeout
outreg2 using tables.doc, replace seeout
tab country, sum(gdp)
tab countryname, sum(gdp)
tab countryname if year>=1995, sum(gdp)
tab countryname if time>=1995, sum(gdp)
reg growthlinitgdp educexp trade lexpect inflation unemp
reg growth linitgdp educexp trade lexpect inflation unemp
outreg2 using tables.doc, replace seeout