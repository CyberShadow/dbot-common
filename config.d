/// Build/Test logic

module dbot.config;

/// These are used by the client to actually decide what
/// should be done, and by the server for display purposes.

/// Should we build this component on this client?
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
			return clientID == "local";
		default:
			return false;
	}
}

/// Should we test this component on this client?
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

/// Should we run benchmarks on this client?
bool shouldBenchmark(string clientID)
{
	return clientID == "local";
}
