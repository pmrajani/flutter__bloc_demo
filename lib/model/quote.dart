// To parse this JSON data, do
//
//     final quote = quoteFromJson(jsonString);

import 'dart:convert';

Quote quoteFromJson(String str) => Quote.fromJson(json.decode(str));

String quoteToJson(Quote data) => json.encode(data.toJson());

class Quote {
	Quote({
		this.id,
		this.quoteText,
		this.quoteAuthor,
		this.quoteGenre,
		this.v,
	});

	String id;
	String quoteText;
	String quoteAuthor;
	String quoteGenre;
	int v;

	factory Quote.fromJson(Map<String, dynamic> json) => Quote(
		id: json["_id"] == null ? null : json["_id"],
		quoteText: json["quoteText"] == null ? null : json["quoteText"],
		quoteAuthor: json["quoteAuthor"] == null ? null : json["quoteAuthor"],
		quoteGenre: json["quoteGenre"] == null ? null : json["quoteGenre"],
		v: json["__v"] == null ? null : json["__v"],
	);

	Map<String, dynamic> toJson() => {
		"_id": id == null ? null : id,
		"quoteText": quoteText == null ? null : quoteText,
		"quoteAuthor": quoteAuthor == null ? null : quoteAuthor,
		"quoteGenre": quoteGenre == null ? null : quoteGenre,
		"__v": v == null ? null : v,
	};
}
