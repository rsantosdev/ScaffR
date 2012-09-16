@echo off

:: Set repository info
set NUGET="nuget/nuget.exe"
set key={your-api-key}
set url={nuget-gallery-url}
set path=c:\development\localnuget

attrib -R %NUGET%
cmd /c %NUGET% update -self

IF not exist %path% mkdir %path%

for /R %%i in (*.nuspec) do (

 SET NUSPEC=%%i
 echo %%i

 %NUGET% pack %%i -o %path% -Version 1.1.3

)

pause