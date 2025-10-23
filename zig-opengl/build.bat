@echo off
zig build-exe main.zig libs/glad.c --name main -I"./libs" -I"." -L"./libs" -lglfw3 -lopengl32 -lgdi32 -luser32 -lkernel32 -lc -O ReleaseSmall
main.exe
del main.exe
