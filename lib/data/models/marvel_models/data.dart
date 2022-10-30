import 'result.dart';

class Data {
  Data({
    this.count,
    this.results,
  });

  String? total;
  String? count;
  List<Result>? results;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        count: json["count"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "count": count,
        "results": (results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x.toJson()))),
      };
}
