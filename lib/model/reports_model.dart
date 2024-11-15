import 'dart:convert';

Temperatures reportsFromJson(String str) =>
    Temperatures.fromJson(json.decode(str));

String reportsToJson(Temperatures data) => json.encode(data.toJson());

class Temperatures {
  List<Datum> data;

  Temperatures({
    required this.data,
  });

  factory Temperatures.fromRawJson(String str) =>
      Temperatures.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Temperatures.fromJson(Map<String, dynamic> json) => Temperatures(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String fileName;
  EventType eventType;
  DateTime eventDate;
  UserName userName;

  Datum({
    required this.id,
    required this.fileName,
    required this.eventType,
    required this.eventDate,
    required this.userName,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        fileName: json["file_name"],
        eventType: eventTypeValues.map[json["event_type"]]!,
        eventDate: DateTime.parse(json["event_date"]),
        userName: userNameValues.map[json["user_name"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "file_name": fileName,
        "event_type": eventTypeValues.reverse[eventType],
        "event_date": eventDate.toIso8601String(),
        "user_name": userNameValues.reverse[userName],
      };
}

enum EventType { DOWNLOAD, UPDATE, UPLOADED }

final eventTypeValues = EnumValues({
  "download": EventType.DOWNLOAD,
  "update": EventType.UPDATE,
  "uploaded": EventType.UPLOADED
});

enum UserName { ALI, OBADA, OWAIS, TAG }

final userNameValues = EnumValues({
  "ali": UserName.ALI,
  "obada": UserName.OBADA,
  "owais": UserName.OWAIS,
  "tag": UserName.TAG
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
