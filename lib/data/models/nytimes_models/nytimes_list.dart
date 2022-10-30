// To parse this JSON data, do
//
//     final nyTimes = nyTimesFromJson(jsonString);

import 'dart:convert';
import 'result.dart';

NyTimesList nyTimesListFromJson(String str) => NyTimesList.fromJson(json.decode(str));

String nyTimesListToJson(NyTimesList data) => json.encode(data.toJson());

class NyTimesList {
  NyTimesList({
    this.status,
    this.copyright,
    this.numResults,
    this.lastModified,
    this.results,
  });

  String? status;
  String? copyright;
  int? numResults;
  DateTime? lastModified;
  List<Result>? results;

  factory NyTimesList.fromJson(Map<String, dynamic> json) => NyTimesList(
        status: json["status"],
        copyright: json["copyright"],
        numResults: json["num_results"],
        lastModified: DateTime.parse(json["last_modified"]),
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "copyright": copyright,
        "num_results": numResults,
        "last_modified": lastModified!.toIso8601String(),
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}



