@echo on

set currFld="%cd%"
echo %currFld%
set slnFldr="C:\projects\repos\"
set slnName=testproj2
 
cd %slnFldr%
 
:: Setup VUE Spa
call vue create %slnName%.spa -p Vue2TSGood
 
cd %slnName%.spa
 
:: Fontawesome - Great Free Icons
call npm install @fortawesome/fontawesome-free -D
 
:: Axios - Rest Library    
call npm add axios
 
:: vee-validate - Validation
call npm add vee-validate

:: npm audit fix
call npm audit fix

:: Do Git stash to avoicd warning stop
call git stash create initialvue

REM Vuetify - our FE Framework of Choice    
call vue add vuetify
 

echo %currFld%
cd %currFld%