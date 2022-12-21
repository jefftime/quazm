const std = @import("std");

const Common = @import("Common.zig");
const Args = @import("Args.zig");
const Cvar = @import("Cvar.zig");

const c = @cImport({
    @cInclude("stdlib.h");
    @cInclude("string.h");
    @cInclude("signal.h");

    // WARN: Is this necessary?
    @cInclude("fcntl.h");
});

pub fn main() !void {
    var time: f64 = undefined;
    var oldtime: f64 = undefined;
    var newtime: f64 = undefined;

    const allocator = std.heap.c_allocator;
    const sys_args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, sys_args);

    try Common.init(sys_args);

    // WARN: Is this necessary?
    // _ = c.fcntl(0, c.F_SETFL, c.fcntl(0, c.F_GETFL, 0) | c.FNDELAY);

    // if (Cvar.get("nostdout")) |nostdout| {
    //     if (nostdout.eql("0")) {
    //         // WARN: Figure out what this does
    //         c.fcntl(0, c.F_SETFL, c.fcntl(0, c.F_GETFL, 0) | c.FNDELAY);
    //     }
    // }

    _ = time;
    _ = oldtime;
    _ = newtime;
}
