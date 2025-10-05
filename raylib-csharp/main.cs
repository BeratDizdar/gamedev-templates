/*
    depen:
        dotnet add package Raylib-cs --version 7.0.1
    min target .net:
        net6.0
*/
using Raylib_cs;

class Program
{
    static void Main()
    {
        Raylib.InitWindow(800, 600, "Raylib C#");
        while (!Raylib.WindowShouldClose())
        {
            Raylib.BeginDrawing();
            Raylib.ClearBackground(Color.White);
            Raylib.DrawText("Hello, World!", 190, 200, 20, Color.Black);
            Raylib.EndDrawing();
        }
        Raylib.CloseWindow();
    }
}
