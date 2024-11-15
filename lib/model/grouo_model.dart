
import 'dart:convert';

Temperatures groupFromJson(String str) => Temperatures.fromJson(json.decode(str));

String groupToJson(Temperatures data) => json.encode(data.toJson());


class Temperatures {
  List<The0> the0;
  String message;

  Temperatures({
    required this.the0,
    required this.message,
  });

  factory Temperatures.fromRawJson(String str) => Temperatures.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Temperatures.fromJson(Map<String, dynamic> json) => Temperatures(
    the0: List<The0>.from(json["0"].map((x) => The0.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "0": List<dynamic>.from(the0.map((x) => x.toJson())),
    "message": message,
  };
}

class The0 {
  int id;
  String name;
  int userId;
  DateTime createdAt;

  The0({
    required this.id,
    required this.name,
    required this.userId,
    required this.createdAt,
  });

  factory The0.fromRawJson(String str) => The0.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory The0.fromJson(Map<String, dynamic> json) => The0(
    id: json["id"],
    name: json["name"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
  };
}

