const Common = @import("Common.zig");
const SizeBuf = Common.SizeBuf;

pub var TEXT: SizeBuf = undefined;
var TEXT_BUF: [8192]u8 = undefined;

pub var FUNCTIONS: ?*Function = null;

fn init_cbuf() !void {
    TEXT = SizeBuf.init(&TEXT_BUF);
}

////////////////////////////////////////
// Public
////////////////////////////////////////

const Command = *const fn () void;

pub const Function = struct {
    next: *Function,
    name: []const u8,
    func: Command,
};

pub fn init() !void {
    try init_cbuf();

    add_cmd("cmdlist", list);
}

pub fn add_cmd(name: []const u8, func: Command) void {
    _ = name;
    _ = func;
}

////////////////////////////////////////
// Executions
////////////////////////////////////////

fn list() void {
    var cmd = FUNCTIONS;
    var i: i32 = 0;
    while (cmd) |c| {
        Common.printf("{s}", .{c.name});
        i += 1;
    }

    Common.printf("{} commands", .{i});
}
