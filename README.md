# Handling-CMIE-CPHS-Data-with-Stata
The Centre for Monitoring Indian Economy (CMIE) conducts Consumer Pyramid Household Surveys (CPHS). https://consumerpyramidsdx.cmie.com/
The data is available from 2014 to the present day. The CPHS has the following four modules: Aspiration, Income, Consumption, and People.

I have demonstrated how to work with the Income module. However, the same steps can be followed to work with Aspiration, Consumption, and People data. We just need to be mindful of the fact that the Income and Consumption modules have monthly data, while the Aspiration and People modules have quarterly data. Necessary changes (in loops) should be made when using these codes for Aspiration or People data.

Further, I have appended all monthly files with a few variables. You can do this with all variables if needed. The Income module has two sub-folders: Household and Member. I have provided codes for both folders.

I have purposefully segregated all the tasks (unzipping, copying, .csv to .dta, and appending). This way, the same codes can also be used for Stata learning or for other purposes, such as unzipping multiple files with Stata or copying multiple files from one folder to another with Stata. If anybody wants all the mentioned tasks can easily be done in one or two loops

You only need to download the data from CMIE into a single folder (I mentioned this at the top of the do file). After that, everything flows seamlessly—there’s no need for any manual effort. Every step has been woven into the code, freeing you from repetitive tasks.

Moreover, I have run all the codes before posting here. If you encounter any errors, feel free to write to me.

For feedback, gratitude, or any help in this regard, reach out to me at: nawazuddin.econ@gmail.com




