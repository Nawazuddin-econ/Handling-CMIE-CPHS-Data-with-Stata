*****************Income Memebr*********************************************
*****Save all the month-wise zipped file you have downloaded from CMIE in a folder named "Member"
*********Unzipp files in one go
local filepath "F:\old_laptop\Pyramids\INcome\Member"
local myfiles: dir "`filepath'" files "*.zip"
foreach f of local myfiles {
        unzipfile "`f'",replace
}

*********Copy files in a seperate folder: from folder 'Member' to 'common_income_member'
local source "F:\old_laptop\Pyramids\INcome\Member\"
local destination "F:\old_laptop\Pyramids\INcome\common_income_member\"
local myfiles : dir "`source'" files "*.csv"
foreach file of local myfiles {
    copy "`source'\`file'" "`destination'\`f'",replace
	erase "`source'\`file'" //delete from source folder
}

****Shorten file names: e.g.  member_income_20201231_MS_rev.csv will become  member_income_202012
local filepath  "F:\old_laptop\Pyramids\INcome\common_income_member"
local myfiles: dir "`filepath'" files "*.csv"
foreach file of local myfiles {
	local subfile = substr("`file'", 1, 20) + ".csv"
	!rename "`file'" "`subfile'"
}
**Check
dir *.csv

**Convert Csv files in .dta files

** Define the source and destination folders
local source "F:\old_laptop\Pyramids\INcome\common_income_member\"
local destination "F:\old_laptop\Pyramids\INcome\common_income_member\statafiles\"

forvalues year = 2014/2024 {
    
   forvalues month = 1/12 {                
        local month_1 = string(`month', "%02.0f")        
        local csvfile = "member_income_`year'`month_1'.csv"
        local dtafile = "member_income_`year'_`month_1'.dta"                           
            import delimited "`source'\`csvfile'", clear
            save "`destination'\`dtafile'", replace                                  
    } 
} 

**Append all .dta files in one grand file

clear
cd "F:\old_laptop\Pyramids\INcome\common_income_member\statafiles"

**Appending the big .dta files would take a lot of time. For learning purpose I am keeping few vraiables only
local keep_vars hh_id mem_id region_type month gender education income_of_member_from_wages
forval year = 2014/2024 {
    forval month = 1/12 {
        local month_str: display %02.0f `month'
        local file_name = "member_income_`year'_`month_str'.dta"
        if `year' == 2014 & `month' == 1 {
            use `keep_vars' using `file_name', clear
        }
        else {
            append using `file_name', keep(`keep_vars')
        }
    }
}
save "F:\old_laptop\Pyramids\INcome\common_income_member\statafiles\member_income_14_24.dta"

*********************Repeat the same steps on the other folder of Income module*************************************************

************Income_Household******************************************
*****Save all the month-wise zipped file you have downloaded from CMIE in a folder named "Household"
*********Unzipp files in one go
cd "F:\old_laptop\Pyramids\INcome\Household"
local filepath "F:\old_laptop\Pyramids\INcome\Household"
local myfiles: dir "`filepath'" files "*.zip"
foreach f of local myfiles {
        unzipfile "`f'",replace
}

*********Copy files in a seperate folder: from 'Household' to 'common_Income_HH'
local source "F:\old_laptop\Pyramids\INcome\Household\"
local destination "F:\old_laptop\Pyramids\INcome\common_Income_HH\"
local myfiles : dir "`source'" files "*.csv"
foreach file of local myfiles {
    copy "`source'\`file'" "`destination'\`f'",replace
	erase "`source'\`file'" //delete from source folder
}

****Shorten file names: e.g.  household_income_20201231_MS_rev.csv will become  household_income_202012
cd "F:\old_laptop\Pyramids\INcome\common_Income_HH"
local filepath  "F:\old_laptop\Pyramids\INcome\common_Income_HH"
local myfiles: dir "`filepath'" files "*.csv"
foreach file of local myfiles {
	local subfile = substr("`file'", 1, 23) + ".csv"
	!rename "`file'" "`subfile'"
}
**Check
dir *.csv

**Convert Csv files in .dta files

**Define the source and destination folders
local source "F:\old_laptop\Pyramids\INcome\common_Income_HH\"
local destination "F:\old_laptop\Pyramids\INcome\common_Income_HH\statafiles_hh_inc\"

forvalues year = 2014/2024 {   
   forvalues month = 1/12 {                
        local month_1 = string(`month', "%02.0f")        
        local csvfile = "household_income_`year'`month_1'.csv"        
        local dtafile = "hh_income_`year'_`month_1'.dta"                          
            import delimited "`source'\`csvfile'", clear           
            save "`destination'\`dtafile'", replace                                  
    } 
} 

**Append all .dta files in one grand file

clear
cd "F:\old_laptop\Pyramids\INcome\common_Income_HH\statafiles_hh_inc"

**Appending the big .dta files would take a lot of time. For learning purpose I am keeping few vraiables only
local keep_vars hh_id region_type month gender_group education_group income_of_all_members_from_wages
forval year = 2014/2024 {
    forval month = 1/12 {
        local month_1 = string(`month', "%02.0f") 
        local file_name = "hh_income_`year'_`month_1'.dta"
        if `year' == 2014 & `month' == 1 {
            use `keep_vars' using `file_name', clear
        }
        else {
            append using `file_name', keep(`keep_vars')
        }
    }
}
save "F:\old_laptop\Pyramids\INcome\common_Income_HH\statafiles_hh_inc\hh_income_14_24.dta"
