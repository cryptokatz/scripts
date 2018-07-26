@call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\VsMSBuildCmd.bat"
cd "c:\working\conceal-classic"
del CMakeLists.txt
copy C:\Working\dev\CMakeLists.txt  /Y
mkdir build
cd build
xcopy C:\Working\dev\gui\*.dll c:\Working\conceal-classic\build\Release /E /y
cmake -G "Visual Studio 15 2017 Win64" -DBOOST_LIBRARYDIR:PATH=c:/local/boost_1_67_0 ..
msbuild conceal-classic.sln /p:Configuration=Release
cd Release
dir 
