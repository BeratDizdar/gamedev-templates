const gl = @import("z_gl.zig");

fn update(dt: f32) void {
    _ = dt;
}
fn display() void {}

pub fn main() !void {
	var state = gl.GLState.new();
	try state.init("ラストエグザイル", 800, 600, 4, 6);
	defer state.deinit();
	state.run(update, display);
}
