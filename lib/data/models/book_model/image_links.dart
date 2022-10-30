class ImageLinks {
  ImageLinks({
    this.smallThumbnail,
    this.small,
    this.large,
  });

  String? smallThumbnail;
  String? small;
  String? large;

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        small: json["small"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "smallThumbnail": smallThumbnail,
        "small": small,
        "large": large,
      };
}
