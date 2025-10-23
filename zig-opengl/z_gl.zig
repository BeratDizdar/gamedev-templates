const std = @import("std");

const glfw = @cImport({@cInclude("libs/glfw3.h");});
const glad = @cImport({@cInclude("libs/glad.h");});

pub const GLState = struct { 
    window: ?*glfw.struct_GLFWwindow = null,

    pub fn new() GLState { return .{ .window = null }; }
	pub fn init(self: *GLState, title:[*:0]const u8, w:c_int, h:c_int, glmax:c_int, glmin:c_int) !void {
		if (glfw.glfwInit() == 0) return error.InitFailed;
		
		glfw.glfwWindowHint(glfw.GLFW_CONTEXT_VERSION_MAJOR, glmax);
        glfw.glfwWindowHint(glfw.GLFW_CONTEXT_VERSION_MINOR, glmin);
		//if (glmax > 2) glfw.glfwWindowHint(glfw.GLFW_OPENGL_PROFILE, glfw.GLFW_OPENGL_CORE_PROFILE);

		self.window = glfw.glfwCreateWindow(w, h, title, null, null);
        if (self.window == null) return error.WindowFailed;
        glfw.glfwMakeContextCurrent(self.window);
		
		if (glad.gladLoadGL() == 0) return error.GladFailed;
		const err = glad.glGetError();
		if (err != 0) { std.debug.print("OpenGL error: {d}\n", .{err}); }
		else { std.debug.print("\x1b[32m[INFO]\x1b[0m Glad loaded correctly\n", .{}); }
		std.debug.print("\x1b[32m[INFO]\x1b[0m OpenGL loaded successfully\n", .{});
		std.debug.print("\x1b[32m[....]\x1b[0m -> Version: {s}\n", .{glad.glGetString(glad.GL_VERSION)});
	}
	pub fn deinit(self: *GLState) void {
		if (self.window) |w| { glfw.glfwDestroyWindow(w); self.window = null; }
        glfw.glfwTerminate();
	}

    pub fn run(self: *GLState, update: fn(f32) void, display: fn() void) void {
        var width:c_int = 800; var height:c_int = 600;
        while(glfw.glfwWindowShouldClose(self.window) == 0) {
            update(0.0);
            glfw.glfwGetFramebufferSize(self.window, &width, &height);
            glad.glViewport(0, 0, width, height);
			glad.glClearColor(0.1, 0.2, 0.3, 1.0);
			glad.glClear(glad.GL_COLOR_BUFFER_BIT);
            display();
            glfw.glfwPollEvents();
            glfw.glfwSwapBuffers(self.window);
        }
    }
};
