@echo on
 
set slnFldr="C:\projects\repos\test"
set slnName=vcsnew
 
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
 
dotnet add %slnName%.Util\%slnName%.DTO.csproj package package AutoMapper
 
dotnet add %slnName%.Model\%slnName%.Services.csproj package Microsoft.EntityFrameworkCore --version 3.1.18
dotnet add %slnName%.Model\%slnName%.Services.csproj package Microsoft.EntityFrameworkCore.Design --version 3.1.18
dotnet add %slnName%.Model\%slnName%.Services.csproj package Microsoft.EntityFrameworkCore.SqlServer --version 3.1.18
dotnet add %slnName%.Model\%slnName%.Services.csproj AutoMapper
dotnet add %slnName%.Model\%slnName%.Services.csproj AutoMapper.Extensions.Microsoft.DependencyInjection
 
dotnet add %slnName%.Util\%slnName%.Util.csproj package Newtonsoft.Json
dotnet add %slnName%.Util\%slnName%.Util.csproj package Bogus
dotnet add %slnName%.Util\%slnName%.Util.csproj package YamlDotNet
dotnet add %slnName%.Util\%slnName%.Util.csproj package CsvHelper
 
@REM To Setup GIT in Spork
@REM
@REM 1.  Clear .git and .gitignore from SPA Folder
@REM 2.  Open Solution in VS 
@REM 3.  Right Click Solution, and "Add to Source Control" - this creates a good GitIgnore for Core Api
@REM 4.  Add SPA Section of GitIgnore - Borrow from CORTA - may want to look at and edit
@REM 5.  Go Through Spork Directions for New Repo - https://wiki.navair1.navy.mil/display/~dmwilson/HOWTO+-+Push+a+project+to+SPORK
 
@REM SARA -ignore for now
@REM dotnet new classlib -f netcoreapp3.1 -o corta.DBRev
 
@REM dotnet sln corta.sln add corta.DBRev\corta.DBRev.csproj
 
@REM dotnet add package Microsoft.EntityFrameworkCore.Tools
 
@REM dotnet add package Microsoft.EntityFrameworkCore.SqlServer
 
@REM dotnet ef dbcontext scaffold "Data Source=(localdb)\MSSQLLocalDB; Integrated Security=SSPI;Initial Catalog=CORTrackingPhil;MultipleActiveResultSets=true" Microsoft.EntityFrameworkCore.SqlServer -p corta.DBRev.csproj -o RevEng -f -c CORTAContext --use-database-names
@REM dotnet ef dbcontext scaffold "Data Source=(localdb)\MSSQLLocalDB; Integrated Security=SSPI;Initial Catalog=CORTrackingOrig;MultipleActiveResultSets=true" Microsoft.EntityFrameworkCore.SqlServer -p corta.DBRev.csproj -o RevEngOrig -f -c CORTAContext --use-database-names
 
@REM dotnet ef dbcontext scaffold "Data Source=PDSQLT01.apps.navair1.navy.mil\tst01; Integrated Security=SSPI;Initial Catalog=OPCOS; MultipleActiveResultSets=true" Microsoft.EntityFrameworkCore.SqlServer -p vcsnew.DBRev.csproj -o RevEng -f -c VCSContext --use-database-names
 
@REM dotnet ef dbcontext scaffold "Data Source=PDSQLT01.apps.navair1.navy.mil\tst01; Integrated Security=SSPI;Initial Catalog=OPCOS; MultipleActiveResultSets=true" Microsoft.EntityFrameworkCore.SqlServer -p tmpRevEng.csproj -o vcs -f -c VCSContext --use-database-names
