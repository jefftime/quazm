const std = @import("std");
const Swap = @import("Swap.zig");
const Cmd = @import("Cmd.zig");
const Cvar = @import("Cvar.zig");

const MAX_TOKEN_CHARS = 4096;
const MAX_NUM_ARGVS = 50;

pub var ARGC = undefined;
pub var ARGV: [MAX_NUM_ARGVS + 1][]const u8 = undefined;

fn init_argv(args: [][]const u8) !void {
    for (args) |arg, i| {
        if (i > MAX_NUM_ARGVS) return error.TooManyArgvs;

        ARGV[i] =
            if (arg.len >= MAX_TOKEN_CHARS) "" else arg;
    }
}

////////////////////////////////////////
// Public
////////////////////////////////////////

pub const SizeBuf = struct {
    allow_overflow: bool = false,
    overflowed: bool = false,
    data: []const u8,
    maxsize: usize = 0,
    cursize: usize = 0,
    readcount: i32 = 0,

    pub fn init(data: []const u8) SizeBuf {
        return .{
            .data = data,
            .maxsize = data.len,
        };
    }
};

pub fn init(args: [][]const u8) !void {
    try init_argv(args);
    try Swap.init();
    try Cmd.init();
}

pub fn printf(comptime fmt: []const u8, args: anytype) void {
    std.log.info(fmt, args);
}
