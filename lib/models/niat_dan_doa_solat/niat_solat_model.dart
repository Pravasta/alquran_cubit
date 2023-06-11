// To parse this JSON data, do
//
//     final niatSolat = niatSolatFromJson(jsonString);

import 'dart:convert';

List<NiatSolat> niatSolatFromJson(String str) =>
    List<NiatSolat>.from(json.decode(str).map((x) => NiatSolat.fromJson(x)));

String niatSolatToJson(List<NiatSolat> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NiatSolat {
  int? id;
  String? name;
  String? arabic;
  String? latin;
  String? terjemahan;

  NiatSolat({
    this.id,
    this.name,
    this.arabic,
    this.latin,
    this.terjemahan,
  });

  factory NiatSolat.fromJson(Map<String, dynamic> json) => NiatSolat(
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
