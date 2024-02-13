// To parse this JSON data, do
//
//     final catagoryModels = catagoryModelsFromJson(jsonString);

import 'dart:convert';

CatagoryModels catagoryModelsFromJson(String str) => CatagoryModels.fromJson(json.decode(str));

String catagoryModelsToJson(CatagoryModels data) => json.encode(data.toJson());

class CatagoryModels {
  bool? status;
  List<Datum>? data;

  CatagoryModels({
    this.status,
    this.data,
  });

  factory CatagoryModels.fromJson(Map<String, dynamic> json) => CatagoryModels(
    status: json["status"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? name;
  String? image;

  Datum({
    this.id,
    this.name,
    this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}

