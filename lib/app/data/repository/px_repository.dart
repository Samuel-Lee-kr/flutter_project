import 'package:military/app/data/model/px.dart';
import 'package:military/app/data/provider/px_provider.dart';

class PxRepository {
  PxProvider pxProvider;

  PxRepository({required this.pxProvider});

  Future<List<Px>> getAll() async {
    return await pxProvider.getAll();
  }
}