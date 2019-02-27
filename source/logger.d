module logger;

import std.stdio;

auto logln(T...)(T args)
{
	stderr.writefln(args);
}