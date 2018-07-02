@call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\VsMSBuildCmd.bat"
cd "c:\working\fork\conceal-gui"
del CMakeLists.txt
copy C:\Working\dev\CMakeLists.txt  /Y
mkdir cryptonote
xcopy C:\Working\fork\conceal-cli c:\Working\fork\conceal-gui\cryptonote /E
mkdir build
cd build
xcopy C:\Working\dev\gui\*.dll c:\Working\fork\conceal-gui\build\Release /E
cmake -G "Visual Studio 15 2017 Win64" -DBOOST_LIBRARYDIR:PATH=c:/local/boost_1_67_0 ..
msbuild CONCEAL-GUI.sln /p:Configuration=Release
cd Release
dir 
