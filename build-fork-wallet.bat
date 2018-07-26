@call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\VsMSBuildCmd.bat"
cd "c:\working\fork\conceal-classic"
del CMakeLists.txt
copy C:\Working\dev\CMakeLists.txt  /Y
mkdir cryptonote
xcopy C:\Working\fork\conceal-core c:\Working\fork\conceal-classic\cryptonote /E /y
mkdir build
cd build
xcopy C:\Working\dev\gui\*.dll c:\Working\fork\conceal-classic\build\Release /E /y
cmake -G "Visual Studio 15 2017 Win64" -DBOOST_LIBRARYDIR:PATH=c:/local/boost_1_67_0 ..
msbuild conceal-classic.sln /p:Configuration=Release /m
cd Release
dir 
