import 'package:flutter/material.dart';
import 'package:ocean_tech/app/components/loading_widget.dart';
import 'package:ocean_tech/app/model/report.dart';
import 'package:ocean_tech/app/core/core.dart';
import 'package:ocean_tech/app/service/report_service_api.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Report>>(
      // future: ReportServiceApi().getById("6196f32c807074575b4a3cbe"),
      // future: ReportServiceApi().listByStateAndYear("praia vermelha do norte"),
      future: ReportServiceApi().listByStateAndYear("ceara", 2020),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return listViewBuilder(snapshot.data);
        }
        return LoadingWidget();
      },
    );
  }
  ListView listViewBuilder(List<Report>? reports) {
    return (ListView.builder(
      itemCount: reports != null ? reports.length : 0,
      itemBuilder: (context, index) {
        return Center(child: Text(reports![index].name));
      },
    ));
  }
}
