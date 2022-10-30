class Series {
  Series({
    this.resourceUri,
    this.name,
  });

  String? resourceUri;
  String? name;

  factory Series.fromJson(Map<String, dynamic> json) => Series(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}
