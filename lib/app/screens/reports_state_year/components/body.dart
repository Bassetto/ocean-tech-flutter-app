import 'package:flutter/material.dart';
import 'package:ocean_tech/app/components/loading_widget.dart';
import 'package:ocean_tech/app/core/core.dart';
import 'package:ocean_tech/app/model/report.dart';
import 'package:ocean_tech/app/screens/reports_state_year/components/report_card.dart';
import 'package:ocean_tech/app/service/report_service_api.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.state, required this.year}) : super(key: key);

  final String state;
  final int year;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Report>>(
      future: ReportServiceApi().listByStateAndYear(state, year),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data != null && snapshot.data!.length > 0) {
            return buildListView(snapshot.data);
          }
          return Center(
              child: Text("Nenhum relatório encontrado para essa praia!"));
        }
        return LoadingWidget();
      },
    );
  }

  ListView buildListView(List<Report>? reports) {
    return ListView.builder(
      itemCount: reports!.length | 0,
      itemBuilder: (buildContext, i) {
        return ReportCard(report: reports[i]);
      },
    );
  }
}
