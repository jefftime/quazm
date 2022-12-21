const Self = @This();
const std = @import("std");

const GameType = enum {
    StandardQuake,
    Rogue,
    Hipnotic,
};
var game_type: GameType = .StandardQuake;

pub fn init(args: [][]const u8) !Self {
    for (args) |arg| {
        std.log.info("{s}", .{arg});
    }
}
