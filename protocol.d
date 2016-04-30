/// Clien-server protocol

module dbot.protocol;

import ae.utils.json;

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
			stdout, /// Standard output line from a child process.
			stderr, /// Standard error line from a child process.
			log,    /// ae.sys.d or other client log message.
			server, /// Server log message.
			error,  /// Client error text.
		}
		Type type;
		string text;
	}
	@JSONOptional Log log;

	struct Progress
	{
		enum Type
		{
			start, /// Implicit
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
