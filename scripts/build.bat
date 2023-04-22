@echo off

REM Usage:
REM ---------------------------------
REM build [mapname] [startengine]
REM mapname: name of the map createin TB without the extension
REM startengine: 1: copy the bsp to the quake2repo and start the game, otherwise do nothing.
REM ---------------------------------

REM Change this variable to whatever directory you cloned the
REM Quake 2 source code into:
set quake2repo="G:\repos\Quake2modding"

set map=%1
set startengine=%2

REM pushd tools\mapcompilers2\Windows64

copy .\baseq2\maps\%map%.map .\working
echo --------------QBSP--------------
tools\mapcompilers2\Windows64\4bsp.exe working\%map%

echo --------------VIS---------------
tools\mapcompilers2\Windows64\4vis.exe working\%map%

echo -------------LIGHT--------------
tools\mapcompilers2\Windows64\4rad.exe working\%map%

copy .\working\%map%.bsp .\baseq2\maps

if "%startengine%" == "1" (
	echo --------------RUN---------------
	pushd baseq2\maps
	if not exist %quake2repo%\baseq2\maps mkdir %quake2repo%\baseq2\maps
	copy %map%.bsp %quake2repo%\baseq2\maps
	pushd %quake2repo%
	call debug\Quake2.exe +map %1
	popd 
)

popd



