@call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\VsMSBuildCmd.bat"
cd "c:\working\conceal-wallet"
rmdir build /s
del CMakeLists.txt
copy C:\Working\dev\CMakeLists32.txt CMakeLists.txt /Y
mkdir cryptonote
xcopy C:\Working\conceal-core c:\Working\conceal-wallet\cryptonote /E /Y
mkdir build
cd build
cmake -G "Visual Studio 15 2017" -DBOOST_LIBRARYDIR:PATH=c:/local/boost_1_67_0 ..
msbuild conceal-gui.sln /p:Configuration=Release /m
cd Release
xcopy C:\Working\dev\gui\* /E /Y