import 'dart:convert';

import 'package:timeline/timeline/domain/location.dart';

Place placeFromJson(String str) => Place.fromJson(json.decode(str));

String placeToJson(Place data) => json.encode(data.toJson());

class Place {
  Place({
    this.name,
    this.location,
  });

  String name;
  Location location;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        name: json["name"],
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "location": location != null ? location.toJson() : null,
      };
}
