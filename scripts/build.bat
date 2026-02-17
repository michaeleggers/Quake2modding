@echo off

REM Usage:
REM ---------------------------------
REM build [mapname] [startengine]
REM mapname: name of the map createin TB without the extension
REM startengine: 1: copy the bsp to the quake2repo and start the game, otherwise do nothing.
REM ---------------------------------

REM Change this variable to whatever directory you cloned the
REM Quake 2 source code into:
set quake2repo="C:\Users\msegg\Desktop\quake\Quake2modding"

set map=%1
set startengine=%2

REM pushd tools\mapcompilers2\Windows64

REM copy .\baseq2\maps\%map%.map .\working
echo --------------QBSP--------------
tools\ericw-tools\bin\qbsp.exe -q2bsp .\baseq2\maps\%map%

echo --------------VIS---------------
tools\ericw-tools\bin\vis.exe .\baseq2\maps\%map%

echo -------------LIGHT--------------
tools\ericw-tools\bin\light.exe .\baseq2\maps\%map%

@REM copy .\working\%map%.bsp .\baseq2\maps

pushd baseq2\maps
if not exist %quake2repo%\baseq2\maps mkdir %quake2repo%\baseq2\maps
copy %map%.bsp %quake2repo%\baseq2\maps

if "%startengine%" == "1" (
	echo --------------RUN---------------
	pushd %quake2repo%
	call debug\Quake2.exe +map %1
	popd 
)

popd



