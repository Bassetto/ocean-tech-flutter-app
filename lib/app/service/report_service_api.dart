import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:ocean_tech/app/model/Condition.dart';
import 'package:ocean_tech/app/model/report.dart';
import 'package:ocean_tech/app/service/report_service.dart';

class ReportServiceApi extends ReportService {
  static final _dio = Dio(BaseOptions(
    baseUrl: 'https://ocean-tech-spring-api.herokuapp.com/api/reports',
    connectTimeout: 10000,
    receiveTimeout: 6000,
  ));

  @override
  Future<Report> getById(String id) async {
    try {
      var response = await _dio.get('/getById/$id');
      if (response.statusCode == 200) {
        return Future.value(Report(
            response.data["_id"],
            response.data["name"],
            response.data["state"],
            response.data["year"],
            Condition(
                response.data["condition"]["lixo"],
                response.data["condition"]["microorganismos"],
                response.data["condition"]["esgoto"],
                response.data["condition"]["balneabilidade"])));
      }
      return Future.value(null);
    } catch (e) {
      print(e);
      return Future.value(null);
    }
  }

  @override
  Future<List<Report>> listByName(String name) async {
    try {
      var response = await _dio.get('/listByName/$name');
      List<Report> reports = [];
      if (response.statusCode == 200) {
        for (dynamic item in response.data) {
          reports.add(Report(
              item["_id"],
              item["name"],
              item["state"],
              item["year"],
              Condition(
                  item["condition"]["lixo"],
                  item["condition"]["microorganismos"],
                  item["condition"]["esgoto"],
                  item["condition"]["balneabilidade"])));
        }
      }
      return Future.value(reports);
    } catch (e) {
      print(e);
      return Future.value(null);
    }
  }

  @override
  Future<List<Report>> listByStateAndYear(String state, int year) async {
    try {
      var response = await _dio.get('/listByStateAndYear/$state/$year');
      List<Report> reports = [];
      if (response.statusCode == 200) {
        for (dynamic item in response.data) {
          reports.add(Report(
              item["_id"],
              item["name"],
              item["state"],
              item["year"],
              Condition(
                  item["condition"]["lixo"],
                  item["condition"]["microorganismos"],
                  item["condition"]["esgoto"],
                  item["condition"]["balneabilidade"])));
        }
      }
      return Future.value(reports);
    } catch (e) {
      print(e);
      return Future.value(null);
    }
  }
}
