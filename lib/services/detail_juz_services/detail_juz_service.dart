import 'dart:convert';

import 'package:alquran_new/models/juz/juz_model.dart';
import 'package:http/http.dart' as http;

class DetailJuzService {
  Future<Juz> getDetailJuz(int noJuz) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.quran.gading.dev/juz/$noJuz'),
      );

      Map<String, dynamic> data =
          (json.decode(response.body) as Map<String, dynamic>)['data'];

      return Juz.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
