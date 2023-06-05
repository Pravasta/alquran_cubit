import 'dart:convert';

import 'package:alquran_new/models/detail_surah_model.dart';
import 'package:http/http.dart' as http;

class GetDetailSurahApiService {
  Future<DetailSurah> getDetailSurah(int noSurah) async {
    try {
      final response = await http
          .get(Uri.parse('https://api.quran.gading.dev/surah/$noSurah'));
      Map<String, dynamic> data =
          (json.decode(response.body) as Map<String, dynamic>)['data'];
      return DetailSurah.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
