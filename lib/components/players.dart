// To parse this JSON data, do
//
//     final player = playerFromJson(jsonString);

import 'dart:convert';

List<Player> playerFromJson(String str) => List<Player>.from(json.decode(str).map((x) => Player.fromJson(x)));

String playerToJson(List<Player> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Player {
    Player({
        required this.pageid,
        required this.ns,
        required this.title,
        required this.index,
        required this.thumbnail,
        required this.terms,
    });

    int pageid;
    int ns;
    String title;
    int index;
   final thumbnail;
    final terms;

    factory Player.fromJson(Map<String, dynamic> json) => Player(
        pageid: json["pageid"],
        ns: json["ns"],
        title: json["title"],
        index: json["index"],
        thumbnail: json["thumbnail"] == null ? null : Thumbnail.fromJson(json["thumbnail"]),
        terms: json["terms"] == null ? null : Terms.fromJson(json["terms"]),
    );

    Map<String, dynamic> toJson() => {
        "pageid": pageid,
        "ns": ns,
        "title": title,
        "index": index,
        "thumbnail": thumbnail == null ? null : thumbnail.toJson(),
        "terms": terms == null ? null : terms.toJson(),
    };
}

class Terms {
    Terms({
        required this.description,
    });

    List<String> description;

    factory Terms.fromJson(Map<String, dynamic> json) => Terms(
        description: List<String>.from(json["description"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "description": List<dynamic>.from(description.map((x) => x)),
    };
}

class Thumbnail {
    Thumbnail({
        required this.source,
        required this.width,
        required this.height,
    });

    String source;
    int width;
    int height;

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        source: json["source"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "source": source,
        "width": width,
        "height": height,
    };
}
