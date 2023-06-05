import 'package:alquran_new/models/surah_model.dart';
import 'package:flutter/services.dart';

class GetApiQuranServices {
  String url = 'https://equran.id/api/v2/surat';
  Future<List<Surah>> getAllSurah() async {
    // Jika data tidak berubah ubah mending gunakan ini, jadi didownload terlebih dahulu
    try {
      final response = await rootBundle.loadString('assets/data/surat.json');
      return surahFromJson(response);
    } catch (e) {
      rethrow;
    }
    // try {
    //   final response = await http.get(
    //     Uri.parse(url),
    //   );

    //   List? data = (json.decode(response.body) as Map<String, dynamic>)['data'];
    //   if (data == null || data.isEmpty) {
    //     return [];
    //   } else {
    //     return data.map((e) => Surah.fromJson(e)).toList();
    //   }
    // } catch (e) {
    //   rethrow;
    // }
  }
}
