import 'package:ocean_tech/app/model/Condition.dart';

class Report {
  String id;
  String name;
  String state;
  int year;
  Condition condition;


  Report(this.id, this.name, this.state, this.year, this.condition);
}