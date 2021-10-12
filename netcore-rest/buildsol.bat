@echo on

set currFld="%cd%"
echo %currFld%
set slnFldr="C:\projects\repos\"
set slnName=testproj3
 
cd %slnFldr%
 
dotnet new sln -o %slnName%
cd %slnName%
 
@REM Sub Projects
dotnet new webapi -o  %slnName%.App
dotnet new classlib -o %slnName%.Data -f netcoreapp3.1
dotnet new classlib -o %slnName%.Model -f netcoreapp3.1
dotnet new classlib -o %slnName%.DTO -f netcoreapp3.1
dotnet new classlib -o %slnName%.Services -f netcoreapp3.1
dotnet new classlib -o %slnName%.Util -f netcoreapp3.1
 
@REM Add Projects to Solution
dotnet sln %slnName%.sln add %slnName%.App\%slnName%.App.csproj
dotnet sln %slnName%.sln add %slnName%.Data\%slnName%.Data.csproj
dotnet sln %slnName%.sln add %slnName%.Model\%slnName%.Model.csproj
dotnet sln %slnName%.sln add %slnName%.DTO\%slnName%.DTO.csproj
dotnet sln %slnName%.sln add %slnName%.Services\%slnName%.Services.csproj
dotnet sln %slnName%.sln add %slnName%.Util\%slnName%.Util.csproj

@REM Add Projects to References
dotnet add %slnName%.App\%slnName%.App.csproj reference %slnName%.Services\%slnName%.Services.csproj
dotnet add %slnName%.App\%slnName%.App.csproj reference %slnName%.Util\%slnName%.Util.csproj
dotnet add %slnName%.Services\%slnName%.Services.csproj reference %slnName%.Data\%slnName%.Data.csproj
dotnet add %slnName%.Services\%slnName%.Services.csproj reference %slnName%.Model\%slnName%.Model.csproj
dotnet add %slnName%.Services\%slnName%.Services.csproj reference %slnName%.Util\%slnName%.Util.csproj
dotnet add %slnName%.Services\%slnName%.Services.csproj reference %slnName%.DTO\%slnName%.DTO.csproj
dotnet add %slnName%.Data\%slnName%.Data.csproj reference %slnName%.Model\%slnName%.Model.csproj
dotnet add %slnName%.Data\%slnName%.Data.csproj reference %slnName%.Util\%slnName%.Util.csproj
dotnet add %slnName%.DTO\%slnName%.DTO.csproj reference %slnName%.Model\%slnName%.Model.csproj
dotnet add %slnName%.DTO\%slnName%.DTO.csproj reference %slnName%.Util\%slnName%.Util.csproj

@REM Add Base Package Set
dotnet add %slnName%.App\%slnName%.App.csproj package Microsoft.EntityFrameworkCore --version 3.1.18
dotnet add %slnName%.App\%slnName%.App.csproj package Microsoft.EntityFrameworkCore.SqlServer --version 3.1.18
dotnet add %slnName%.App\%slnName%.App.csproj package AutoMapper
dotnet add %slnName%.App\%slnName%.App.csproj package AutoMapper.Extensions.Microsoft.DependencyInjection
 
dotnet add %slnName%.Data\%slnName%.Data.csproj package Microsoft.EntityFrameworkCore --version 3.1.18
dotnet add %slnName%.Data\%slnName%.Data.csproj package Microsoft.EntityFrameworkCore.Design --version 3.1.18
dotnet add %slnName%.Data\%slnName%.Data.csproj package Microsoft.EntityFrameworkCore.SqlServer --version 3.1.18
dotnet add %slnName%.Data\%slnName%.Data.csproj package Newtonsoft.Json
dotnet add %slnName%.Data\%slnName%.Data.csproj package Bogus
 
dotnet add %slnName%.Model\%slnName%.Model.csproj package Microsoft.EntityFrameworkCore --version 3.1.18
dotnet add %slnName%.Model\%slnName%.Model.csproj package Microsoft.EntityFrameworkCore.Design --version 3.1.18
dotnet add %slnName%.Model\%slnName%.Model.csproj package Microsoft.EntityFrameworkCore.SqlServer --version 3.1.18
dotnet add %slnName%.Model\%slnName%.Model.csproj package Newtonsoft.Json
dotnet add %slnName%.Model\%slnName%.Model.csproj package Bogus
 
dotnet add %slnName%.DTO\%slnName%.DTO.csproj package AutoMapper
 
dotnet add %slnName%.Services\%slnName%.Services.csproj package Microsoft.EntityFrameworkCore --version 3.1.18
dotnet add %slnName%.Services\%slnName%.Services.csproj package Microsoft.EntityFrameworkCore.Design --version 3.1.18
dotnet add %slnName%.Services\%slnName%.Services.csproj package Microsoft.EntityFrameworkCore.SqlServer --version 3.1.18
dotnet add %slnName%.Services\%slnName%.Services.csproj package AutoMapper
dotnet add %slnName%.Services\%slnName%.Services.csproj package AutoMapper.Extensions.Microsoft.DependencyInjection
 
dotnet add %slnName%.Util\%slnName%.Util.csproj package Newtonsoft.Json
dotnet add %slnName%.Util\%slnName%.Util.csproj package Bogus
dotnet add %slnName%.Util\%slnName%.Util.csproj package YamlDotNet
dotnet add %slnName%.Util\%slnName%.Util.csproj package CsvHelper

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

cd %currFld%