import 'package:ocean_tech/app/model/mapping.dart';

abstract class MappingService {
  Future<List<Mapping>> list();
}