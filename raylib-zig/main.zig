const c = @cImport({@cInclude("raylib.h");});

pub fn main() void {
    c.InitWindow(800, 600, "Static Raylib???");
    defer c.CloseWindow();
	while (!c.WindowShouldClose()) {
        c.BeginDrawing();
        c.ClearBackground(c.RAYWHITE);
        c.DrawText("Hello, World!", 200, 200, 20, c.BLACK);
        c.EndDrawing();
    }
}

