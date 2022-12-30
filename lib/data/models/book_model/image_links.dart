class ImageLinks {
  ImageLinks({
    this.thumbnail,
    this.small,
    this.large,
  });

  String? thumbnail;
  String? small;
  String? large;

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        thumbnail: json["thumbnail"],
        small: json["smallThumbnail"],
        large: json["largeThumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail,
        "small": small,
        "large": large,
      };
}
