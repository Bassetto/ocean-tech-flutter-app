import 'package:ocean_tech/app/model/report.dart';

abstract class ReportService {

  Future<Report> getById(String id);

  Future<List<Report>> listByName(String name);

  Future<List<Report>> listByStateAndYear(String state, int year);
}