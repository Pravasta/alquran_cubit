import 'package:alquran_new/models/niat_dan_doa_solat/doa_solat_model.dart';
import 'package:flutter/services.dart';

class DoaSolatService {
  Future<List<DoaSolat>> listDoaSolat() async {
    try {
      final response =
          await rootBundle.loadString('assets/data/doa_solat.json');
      return doaSolatFromJson(response);
      // return json.decode(response).map((x) => DoaModel.fromJson(x));
    } catch (e) {
      rethrow;
    }
  }
}
