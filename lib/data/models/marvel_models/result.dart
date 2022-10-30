import 'series.dart';
import 'events.dart';
import 'characters_list.dart';
import 'stories_list.dart';
import 'comics_list.dart';

class Result {
  Result({
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    this.description,
    this.pageCount,
    //this.urls,
    this.series,
    this.variants,
    this.collections,
    this.collectedIssues,
    this.thumbnail,
    this.images,
    this.creators,
    this.characters,
    this.stories,
    this.events,
  });

  String? id;
  String? digitalId;
  String? title;
  String? issueNumber;
  String? description;
  String? pageCount;
  //List<Url>? urls;
  Series? series;
  List<Series>? variants;
  List<Series>? collections;
  List<Series>? collectedIssues;
  Thumbnail? thumbnail;
  List<Thumbnail>? images;
  CharactersList? creators;
  CharactersList? characters;
  StoriesList? stories;
  Events? events;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        digitalId: json["digitalId"],
        title: json["title"],
        issueNumber: json["issueNumber"],
        description: json["description"],
        pageCount: json["pageCount"],
        //urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
        series: Series.fromJson(json["series"]),
        variants:
            List<Series>.from(json["variants"].map((x) => Series.fromJson(x))),
        collections: List<Series>.from(
            json["collections"].map((x) => Series.fromJson(x))),
        collectedIssues: List<Series>.from(
            json["collectedIssues"].map((x) => Series.fromJson(x))),
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        images: List<Thumbnail>.from(
            json["images"].map((x) => Thumbnail.fromJson(x))),
        creators: CharactersList.fromJson(json["creators"]),
        characters: CharactersList.fromJson(json["characters"]),
        stories: StoriesList.fromJson(json["stories"]),
        events: Events.fromJson(json["events"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "digitalId": digitalId,
        "title": title,
        "issueNumber": issueNumber,
        "description": description,
        "pageCount": pageCount,
        // "urls": (urls == null
        //     ? null
        //     : List<dynamic>.from(urls!.map((x) => x.toJson()))),
        "series": (series == null ? null : series!.toJson()),
        "variants": (variants == null
            ? null
            : List<dynamic>.from(variants!.map((x) => x.toJson()))),
        "collections": (collections == null
            ? null
            : List<dynamic>.from(collections!.map((x) => x.toJson()))),
        "collectedIssues": (collectedIssues == null
            ? null
            : List<dynamic>.from(collectedIssues!.map((x) => x.toJson()))),
        "thumbnail": (thumbnail == null ? null : thumbnail!.toJson()),
        "images": (images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson()))),
        "creators": (creators == null ? null : creators!.toJson()),
        "characters": (characters == null ? null : characters!.toJson()),
        "stories": (stories == null ? null : stories!.toJson()),
        "events": (events == null ? null : events!.toJson()),
      };
}
