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
