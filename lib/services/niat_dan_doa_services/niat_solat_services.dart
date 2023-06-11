import 'package:alquran_new/models/niat_dan_doa_solat/niat_solat_model.dart';
import 'package:flutter/services.dart';

class NiatSolatService {
  Future<List<NiatSolat>> listNiatSolat() async {
    try {
      final response =
          await rootBundle.loadString('assets/data/niat_solat.json');
      return niatSolatFromJson(response);
      // return json.decode(response).map((x) => DoaModel.fromJson(x));
    } catch (e) {
      rethrow;
    }
  }
}
