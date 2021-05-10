class TagModel {
  int hour;
  bool selected = false;

  String get value => hour.toString();

  TagModel({required this.hour});
}
