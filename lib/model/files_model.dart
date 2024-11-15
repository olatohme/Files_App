// To parse this JSON data, do
//
//     final filesModel = filesModelFromJson(jsonString);

import 'dart:convert';

FilesModel filesModelFromJson(String str) =>
    FilesModel.fromJson(json.decode(str));

String filesModelToJson(FilesModel data) => json.encode(data.toJson());

class FilesModel {
  int status;
  List<FileElement> files;

  FilesModel({
    required this.status,
    required this.files,
  });

  factory FilesModel.fromJson(Map<String, dynamic> json) => FilesModel(
        status: json["status"],
        files: List<FileElement>.from(
            json["files"].map((x) => FileElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "files": List<dynamic>.from(files.map((x) => x.toJson())),
      };
}

class FileElement {
  int id;
  String name;
  String status;
  String path;
  int userId;
  dynamic description;
  DateTime createdAt;
  DateTime updatedAt;

  FileElement({
    required this.id,
    required this.name,
    required this.status,
    required this.path,
    required this.userId,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        path: json["path"],
        userId: json["user_id"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "path": path,
        "user_id": userId,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
