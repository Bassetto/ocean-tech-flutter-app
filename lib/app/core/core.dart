export './app_text_styles.dart';
export './app_images.dart';
export './app_colors.dart';

class DefaultValues {
  static const double padding = 20.0;
}

extension StringExtension on String {
  String toCapitalized() => this.length > 0 ?'${this[0].toUpperCase()}${this.substring(1)}':'';
  String toTitleCase() => this.replaceAll(RegExp(' +'), ' ').split(" ").map((str) => str.toCapitalized()).join(" ");
}