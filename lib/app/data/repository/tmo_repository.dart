import 'package:military/app/data/model/tmo/tmo.dart';
import 'package:military/app/data/provider/tmo_provider.dart';

class TmoRepository {
  TmoProvider tmoProvider;

  TmoRepository({required this.tmoProvider});

  Future<List<Tmo>> getAll() async {
    return await tmoProvider.getAll();
  }

}