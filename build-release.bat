:: This is the scrip to build releases
:: for:
:: Win CLI
:: Win 64 GUI
:: Win 64 Classic


:: START WITH GLOBAL CALLS
@call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\VsMSBuildCmd.bat"

:: CLEANUP
rmdir "c:\working\Release" /s /q

:: CLI
cd "c:\working\conceal-core"
mkdir build
cd build
cmake -G "Visual Studio 15 2017 Win64" -DBOOST_LIBRARYDIR:PATH=c:/local/boost_1_67_0 ..
msbuild concealX.sln /p:Configuration=Release /m
cd src
cd Release
mkdir c:\Working\Release\CLI
xcopy *.exe c:\Working\Release\CLI /E /y
"c:\program files\7-zip\7z.exe" a -tzip c:\working\release\ccx-cli-win64-v.zip c:\working\release\cli\*.exe
cd "c:\working\conceal-core"
rmdir build /s /q

:: Wallet x64
cd "c:\working\conceal-wallet"
del CMakeLists.txt
copy C:\Working\dev\CMakeLists.txt  /Y
mkdir cryptonote
xcopy C:\Working\conceal-core c:\Working\conceal-wallet\cryptonote /E /y
mkdir build
cd build
cmake -G "Visual Studio 15 2017 Win64" -DBOOST_LIBRARYDIR:PATH=c:/local/boost_1_67_0 ..
msbuild conceal-gui.sln /p:Configuration=Release /m
cd Release
xcopy *.exe c:\Working\Release\Wallet\x64 /E /y
mkdir c:\Working\Release\Wallet\x64
xcopy C:\Working\dev\gui\* c:\Working\Release\Wallet\x64 /E /y
"c:\program files\7-zip\7z.exe" a -tzip c:\working\release\ccx-wallet-win64-v.zip c:\working\release\wallet\x64\*

:: Classic Wallet x64
cd "c:\working\conceal-classic"
del CMakeLists.txt
copy C:\Working\dev\CMakeLists.txt  /Y
mkdir cryptonote
xcopy C:\Working\conceal-core c:\Working\conceal-classic\cryptonote /E /y
mkdir build
cd build
cmake -G "Visual Studio 15 2017 Win64" -DBOOST_LIBRARYDIR:PATH=c:/local/boost_1_67_0 ..
msbuild conceal-gui.sln /p:Configuration=Release /m
cd Release
xcopy *.exe c:\Working\Release\Classic\x64 /E /y
mkdir c:\Working\Release\Classic\x64
xcopy C:\Working\dev\gui\* c:\Working\Release\Classic\x64 /E /y
"c:\program files\7-zip\7z.exe" a -tzip c:\working\release\ccx-classic-win64-v.zip c:\working\release\classic\x64\*