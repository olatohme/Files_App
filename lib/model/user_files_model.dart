// To parse this JSON data, do
//
//     final userFilesModel = userFilesModelFromJson(jsonString);

import 'dart:convert';

UserFilesModel userFilesModelFromJson(String str) => UserFilesModel.fromJson(json.decode(str));

String userFilesModelToJson(UserFilesModel data) => json.encode(data.toJson());

class UserFilesModel {
    List<The0> the0;
    String mesaage;

    UserFilesModel({
        required this.the0,
        required this.mesaage,
    });

    factory UserFilesModel.fromJson(Map<String, dynamic> json) => UserFilesModel(
        the0: List<The0>.from(json["0"].map((x) => The0.fromJson(x))),
        mesaage: json["mesaage"],
    );

    Map<String, dynamic> toJson() => {
        "0": List<dynamic>.from(the0.map((x) => x.toJson())),
        "mesaage": mesaage,
    };
}

class The0 {
    int id;
    String name;
    String status;
    String path;
    int userId;
    dynamic description;
    DateTime createdAt;
    DateTime updatedAt;

    The0({
        required this.id,
        required this.name,
        required this.status,
        required this.path,
        required this.userId,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
    });

    factory The0.fromJson(Map<String, dynamic> json) => The0(
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
