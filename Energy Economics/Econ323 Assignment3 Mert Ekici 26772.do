//open curse.dta
use "C:\Users\LENOVO\Desktop\Resource curse.dta"

//browse the data
browse

//table 1 regression models (gradually controlling external factors)
reg gea7090 lgdpea70 sxp if country != "CHAD" & country != "GABON" & country != "GUYANA" & country !=  "MALAYSIA" & excl1 == 0
reg gea7090 lgdpea70 sxp sopen if country != "CHAD" & country != "GABON" & country != "GUYANA" & country !=  "MALAYSIA" & excl1 == 0
reg gea7090 lgdpea70 sxp sopen linv7089 if country != "CHAD" & country != "GABON" & country != "GUYANA" & country !=  "MALAYSIA" & excl1 == 0
reg gea7090 lgdpea70 sxp sopen linv7089 rl if country != "CHAD" & country != "GABON" & country != "GUYANA" & country !=  "MALAYSIA" & excl1 == 0
reg gea7090 lgdpea70 sxp sopen linv7089 rl dtt7090 if country != "CHAD" & country != "GABON" & country != "GUYANA" & country !=  "MALAYSIA" & excl1 == 0

cd "C:\Users\LENOVO\desktop"

//extract the table of the model to tables.doc
 
//table 3 regs (replacing the natural resource intensity measurements)
reg gea7090 lgdpea70 sopen rl dtt7090 linv7089 sxp if excl1 == 0
outreg2 using tables.doc, replace seeout
reg gea7090 lgdpea70 sopen rl dtt7090 linv7089 snr if excl1 == 0
outreg2 using tables.doc, append seeout
reg gea7090 lgdpea70 sopen rl dtt7090 linv7089 pxi70 if excl1 == 0
outreg2 using tables.doc, append seeout
reg gea7090 lgdpea70 sopen rl dtt7090 linv7089 land if excl1 == 0
outreg2 using tables.doc, append seeout



//close log fil
log close