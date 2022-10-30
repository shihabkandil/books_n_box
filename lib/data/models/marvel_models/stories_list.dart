class StoriesList {
  StoriesList({
    this.available,
    this.returned,
    this.collectionUri,
    this.items,
  });

  String? available;
  String? returned;
  String? collectionUri;
  List<Story>? items;

  factory StoriesList.fromJson(Map<String, dynamic> json) => StoriesList(
        available: json["available"],
        returned: json["returned"],
        collectionUri: json["collectionURI"],
        items: List<Story>.from(json["items"].map((x) => Story.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "returned": returned,
        "collectionURI": collectionUri,
        "items": (items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson()))),
      };
}

//----------------------------------------

class Story {
  Story({
    this.resourceUri,
    this.name,
    this.type,
  });

  String? resourceUri;
  String? name;
  String? type;

  factory Story.fromJson(Map<String, dynamic> json) => Story(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": type,
      };
}
