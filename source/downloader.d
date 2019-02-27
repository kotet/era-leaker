module downloader;

import std.stdio;
import std.net.curl : byLine;
import std.utf : decodeFront;

private enum joyo2010_url = "https://raw.githubusercontent.com/cjkvi/cjkvi-tables/master/joyo2010.txt";

void downloadFile()
{
	auto file = File("joyo2010.txt", "w");

	foreach (line; byLine(joyo2010_url))
	{
		if (line[0] == '#')
			continue;
		file.writeln(line.decodeFront());
	}

	file.close();
}