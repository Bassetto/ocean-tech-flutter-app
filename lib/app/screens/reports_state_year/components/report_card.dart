import 'package:flutter/material.dart';
import 'package:ocean_tech/app/components/report_details_widget.dart';
import 'package:ocean_tech/app/model/report.dart';
import 'package:ocean_tech/app/core/core.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({Key? key, required this.report}) : super(key: key);

  final Report report;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Ink(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: report.condition.balneabilidade == "PROPRIA" ? Colors.green : Colors.red,
        ),
      ),
      title: Text(report.name.toTitleCase()),
      subtitle: Text(report.state.replaceAll("-", " ").toTitleCase()),
      trailing: Text(report.year.toString()),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(DefaultValues.padding),
              child: ReportDetailsWidget(report: report),
            ),
          );
        }));
      },
    );
  }
}
