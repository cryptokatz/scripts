@call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\VsMSBuildCmd.bat"
cd "c:\working\testnet-wallet"
del CMakeLists.txt
copy C:\Working\dev\CMakeLists.txt  /Y
mkdir cryptonote
xcopy c:\working\testnet-core c:\working\testnet-wallet\cryptonote /E /y
cd "c:\working\testnet\testnet-wallet"
mkdir build
cd build
xcopy C:\Working\dev\gui\*.dll c:\working\testnet-wallet\build\Release /E /y
cmake -G "Visual Studio 15 2017 Win64" -DBOOST_LIBRARYDIR:PATH=c:/local/boost_1_67_0 ..
msbuild testnet-gui.sln /p:Configuration=Release /m
cd Release
dir 
