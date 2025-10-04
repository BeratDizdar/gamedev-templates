#include "include/raylib.h"

int main() {
    InitWindow(800, 600, "Static Raylib???");
    while (!WindowShouldClose()) {
        BeginDrawing();
        ClearBackground(RAYWHITE);
        DrawText("Hello, World!", 200, 200, 20, BLACK);
        EndDrawing();
    }
    CloseWindow();
    return 0;
}

