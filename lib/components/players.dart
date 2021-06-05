// To parse this JSON data, do
//
//     final player = playerFromJson(jsonString);

import 'dart:convert';

Player playerFromJson(String str) => Player.fromJson(json.decode(str));

String playerToJson(Player data) => json.encode(data.toJson());

class Player {
    Player({
        required this.batchcomplete,
        required this.playerContinue,
        required this.query,
    });

    bool batchcomplete;
    Continue playerContinue;
    Query query;

    factory Player.fromJson(Map<String, dynamic> json) => Player(
        batchcomplete: json["batchcomplete"],
        playerContinue: Continue.fromJson(json["continue"]),
        query: Query.fromJson(json["query"]),
    );

    Map<String, dynamic> toJson() => {
        "batchcomplete": batchcomplete,
        "continue": playerContinue.toJson(),
        "query": query.toJson(),
    };
}

class Continue {
    Continue({
        required this.gpsoffset,
        required this.continueContinue,
    });

    int gpsoffset;
    String continueContinue;

    factory Continue.fromJson(Map<String, dynamic> json) => Continue(
        gpsoffset: json["gpsoffset"],
        continueContinue: json["continue"],
    );

    Map<String, dynamic> toJson() => {
        "gpsoffset": gpsoffset,
        "continue": continueContinue,
    };
}

class Query {
    Query({
        required this.redirects,
        required this.pages,
    });

    List<Redirect> redirects;
    List<Page> pages;

    factory Query.fromJson(Map<String, dynamic> json) => Query(
        redirects: List<Redirect>.from(json["redirects"].map((x) => Redirect.fromJson(x))),
        pages: List<Page>.from(json["pages"].map((x) => Page.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "redirects": List<dynamic>.from(redirects.map((x) => x.toJson())),
        "pages": List<dynamic>.from(pages.map((x) => x.toJson())),
    };
}

class Page {
    Page({
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
    var thumbnail;
    var terms;

    factory Page.fromJson(Map<String, dynamic> json) => Page(
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

class Redirect {
    Redirect({
        required this.index,
        required this.from,
        required this.to,
    });

    int index;
    String from;
    String to;

    factory Redirect.fromJson(Map<String, dynamic> json) => Redirect(
        index: json["index"],
        from: json["from"],
        to: json["to"],
    );

    Map<String, dynamic> toJson() => {
        "index": index,
        "from": from,
        "to": to,
    };
}
