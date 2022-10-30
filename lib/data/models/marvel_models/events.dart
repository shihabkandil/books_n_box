import 'series.dart';

class Events {
  Events({
    this.available,
    this.returned,
    this.collectionUri,
    this.items,
  });

  String? available;
  String? returned;
  String? collectionUri;
  List<Series>? items;

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        available: json["available"],
        returned: json["returned"],
        collectionUri: json["collectionURI"],
        items: List<Series>.from(json["items"].map((x) => Series.fromJson(x))),
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
