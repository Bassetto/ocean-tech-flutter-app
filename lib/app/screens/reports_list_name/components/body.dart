import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ocean_tech/app/components/loading_widget.dart';
import 'package:ocean_tech/app/core/core.dart';
import 'package:ocean_tech/app/model/report.dart';
import 'package:ocean_tech/app/components/report_details_widget.dart';
import 'package:ocean_tech/app/service/report_service_api.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Report>>(
      future: ReportServiceApi().listByName(name),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data != null && snapshot.data!.length > 0) {
            return Column(
              children: [
                Image.asset(
                  AppImages.bannerOds14,
                  height: MediaQuery.of(context).size.height / 5,
                ),
                buildCarouselSlider(snapshot.data),
              ],
            );
          }
          return Center(
              child: Text("Nenhum relatório encontrado para essa praia!"));
        }
        return LoadingWidget();
      },
    );
  }

  CarouselSlider buildCarouselSlider(List<Report>? reports) {
    return CarouselSlider.builder(
      itemCount: reports!.length | 0,
      itemBuilder: (buildContext, i, pageViewIndex) {
        return ReportDetailsWidget(report: reports[i]);
      },
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
      ),
    );
  }
}
