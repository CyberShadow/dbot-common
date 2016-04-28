/// Build/Test logic

/// This code is used by the client to actually decide what
/// should be done, and by the server for display purposes.

module dbot.config;

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
	return clientID == "local";
}
