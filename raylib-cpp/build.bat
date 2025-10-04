@echo off
set SRC=main.cpp
set EXE=main.exe
set INCLUDE=-I"."
set LIBS=-L"./libs"
set GRAPHIC_LIB=-lopengl32 -lgdi32 -lwinmm
rem GRAPHIC_LIB_LINUX = -lGL -lm -lpthread -ldl -lrt
set STATIC_LIB=-static -static-libgcc -static-libstdc++

g++ %SRC% -o %EXE% %INCLUDE% %LIBS% %STATIC_LIB% -lraylib %GRAPHIC_LIB%
strip %EXE%

echo.
