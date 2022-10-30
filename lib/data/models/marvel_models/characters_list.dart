class CharactersList {
  CharactersList({
    this.available,
    this.returned,
    this.collectionUri,
    this.items,
  });

  String? available;
  String? returned;
  String? collectionUri;
  List<Character>? items;

  factory CharactersList.fromJson(Map<String, dynamic> json) => CharactersList(
        available: json["available"],
        returned: json["returned"],
        collectionUri: json["collectionURI"],
        items: List<Character>.from(
            json["items"].map((x) => Character.fromJson(x))),
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


//--------------------------

class Character {
  Character({
    this.resourceUri,
    this.name,
    this.role,
  });

  String? resourceUri;
  String? name;
  String? role;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "role": role,
      };
}
