module common.common;

import ae.utils.json;

// Protocol

struct Message
{
	enum Type
	{
		log,
		progress,
	}
	Type type;

	struct Log
	{
		enum Type
		{
			stdout,
			stderr,
			log,
			error,
		}
		Type type;
		string text;
	}
	@JSONOptional Log log;

	struct Progress
	{
		enum Type
		{
			fetch,
			merge,
			build,
			test,
			bench,
			done,
		}
		Type type;
	}
	@JSONOptional Progress progress;
}

// Build/Test logic

// This code is used by the client to actually decide what
// should be done, and by the server for display purposes.

bool shouldBuild(string clientID, string componentName)
{
	switch (componentName)
	{
		case "dmd":
		case "phobos":
		case "druntime":
		case "rdmd":
			return true;
		case "website":
			return clientID == "k3";
		default:
			return false;
	}
}

bool shouldTest(string clientID, string componentName)
{
	switch (componentName)
	{
		case "rdmd":
			return true;
		default:
			return false;
	}
}

bool shouldBenchmark(string clientID)
{
	return clientID == "k3";
}
