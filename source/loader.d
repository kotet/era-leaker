module loader;

import std.stdio;
import std.string : chomp;
import std.array : appender;
import std.conv : to;

string[] load()
{
    auto f = File("joyo2010.txt", "r");
    auto app = appender!(string[]);
    foreach (line; f.byLine)
    {
        app.put(line.chomp.to!string);
    }
    return app.data;
}
