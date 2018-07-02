@call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\VsMSBuildCmd.bat"
cd "c:\working\fork\conceal-cli" 
mkdir build
cd build
cmake -G "Visual Studio 15 2017 Win64" -DBOOST_LIBRARYDIR:PATH=c:/local/boost_1_67_0 ..
msbuild concealX.sln /p:Configuration=Release
cd src
cd Release
dir *.exe
