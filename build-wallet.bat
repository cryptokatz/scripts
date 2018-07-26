@call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\VsMSBuildCmd.bat"
cd "c:\working\conceal-wallet"
del CMakeLists.txt
copy C:\Working\dev\CMakeLists.txt  /Y
mkdir cryptonote
xcopy C:\Working\conceal-core c:\Working\conceal-wallet\cryptonote /E /y
mkdir build
cd build
xcopy C:\Working\dev\gui\*.dll c:\Working\conceal-wallet\build\Release /E /y
cmake -G "Visual Studio 15 2017 Win64" -DBOOST_LIBRARYDIR:PATH=c:/local/boost_1_67_0 ..
msbuild conceal-classic.sln /p:Configuration=Release /m
cd Release
copy C:\Working\scripts\build-new-gui.bat  /Y
dir 
