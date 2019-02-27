import std.stdio;
import std.file : exists;
import std.getopt : getopt, defaultGetoptPrinter, config;

import logger;
static import downloader;
static import loader;
import leaker;

void main(string[] args)
{
	bool cache_clear = false;
	long length = 2;
	auto opt = getopt(args, config.passThrough, "l|length", "Number of characters of era.",
			&length, "c|clear", "Clear cache and re-download joyo2010.txt.", &cache_clear);
	if (opt.helpWanted)
	{
		defaultGetoptPrinter("", opt.options);
		return;
	}

	if (cache_clear || !exists("joyo2010.txt"))
	{
		logln("Downloading file...");
		downloader.downloadFile();
	}

	logln("Loading file...");
	string[] characters = loader.load();

	logln("Generating era...");
	auto f = File("result.txt", "w");
	foreach (s; LeakerRange(characters, length))
		f.writeln(s);
	logln("Completed. -> result.txt");
}
