import 'package:flutter/material.dart';
import 'package:ocean_tech/app/core/core.dart';
import 'package:ocean_tech/app/model/report.dart';

class ReportDetailsWidget extends StatelessWidget {
  const ReportDetailsWidget({Key? key, required this.report}) : super(key: key);

  final Report report;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildRow("Nome: ", report.name.toTitleCase()),
        buildRow("Estado: ", report.state.replaceAll("-", " ").toTitleCase()),
        buildRow("Ano: ", report.year.toString()),
        buildRow("Lixo: ", report.condition.lixo.toString()),
        buildRow("Microorganismos: ", report.condition.microorganismos.toString()),
        buildRow("Presença de esgoto: ", report.condition.esgoto ? "Sim" : "Não"),
        buildRow("Balneabilidade: ", report.condition.balneabilidade),
      ],
    );
  }

  Row buildRow(String label, String item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.title,
        ),
        Text(
          item.toCapitalized(),
          style: AppTextStyles.heading,
        ),
      ],
    );
  }
}
