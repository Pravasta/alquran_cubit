// To parse this JSON data, do
//
//     final doaSolat = doaSolatFromJson(jsonString);

import 'dart:convert';

List<DoaSolat> doaSolatFromJson(String str) =>
    List<DoaSolat>.from(json.decode(str).map((x) => DoaSolat.fromJson(x)));

String doaSolatToJson(List<DoaSolat> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoaSolat {
  int? id;
  String? name;
  String? arabic;
  String? latin;
  String? terjemahan;

  DoaSolat({
    this.id,
    this.name,
    this.arabic,
    this.latin,
    this.terjemahan,
  });

  factory DoaSolat.fromJson(Map<String, dynamic> json) => DoaSolat(
        id: json["id"],
        name: json["name"],
        arabic: json["arabic"],
        latin: json["latin"],
        terjemahan: json["terjemahan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "arabic": arabic,
        "latin": latin,
        "terjemahan": terjemahan,
      };
}
