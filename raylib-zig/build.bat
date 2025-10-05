@echo off
set SRC=main.zig
set INCLUDE=-I"." -I"./include"
set LIBS=libs/libraylib.a
set WIN_LIBS=-lopengl32 -lgdi32 -lwinmm
rem LINUX_LIBS = -lGL -lm -lpthread -ldl -lrt

zig build-exe %SRC% --name main %INCLUDE% %LIBS% -static %WIN_LIBS% -lc -O ReleaseSmall
strip %EXE%

echo.
