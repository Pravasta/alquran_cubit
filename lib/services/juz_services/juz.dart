import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/juz/juz_model.dart';

class JuzService {
  List<Juz> listJuzz = [];
  Future<List<Juz>> getJuzQuran() async {
    try {
      for (int noJuz = 1; noJuz <= 30; noJuz++) {
        final response = await http
            .get(Uri.parse('https://api.quran.gading.dev/juz/$noJuz'));
        Map<String, dynamic> data =
            (json.decode(response.body) as Map<String, dynamic>)['data'];
        listJuzz.add(Juz.fromJson(data));
      }
      return listJuzz;
    } catch (e) {
      rethrow;
    }
  }
}
