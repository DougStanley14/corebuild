@echo on

set currFld="%cd%"
echo %currFld%
set slnFldr="C:\projects\repos\"
set slnName=testproj2
 
cd %slnFldr%
 
@REM Setup VUE Spa
call vue create %slnName%.spa -p Vue2TSGood
 
cd %slnName%.spa
 
REM Fontawesome - Great Free Icons
call npm install @fortawesome/fontawesome-free -D
 
REM Axios - Rest Library    
call npm add axios
 
REM vee-validate - Validation
call npm add vee-validate

REM Vuetify - our FE Framework of Choice    
call vue add vuetify
 

echo %currFld%
cd %currFld%