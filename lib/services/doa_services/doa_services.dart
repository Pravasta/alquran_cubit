import 'package:alquran_new/models/doa/doa_model.dart';
import 'package:flutter/services.dart';

class DoaService {
  Future<List<DoaModel>> listDoaServices() async {
    try {
      final response = await rootBundle.loadString('assets/data/doa.json');
      return doaModelFromJson(response);
      // return json.decode(response).map((x) => DoaModel.fromJson(x));
    } catch (e) {
      rethrow;
    }
  }
}
