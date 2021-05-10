import 'package:intl/intl.dart';

enum RecordType { none, telephoneCall, research, drafting }
enum RecordState { active, submitted }

class RecordModel {
  DateTime date = DateTime.now();
  RecordState state = RecordState.active;
  RecordType type = RecordType.none;
  int rate = 0;
  Duration duration = Duration(hours: 1);
  String title;

  get isSubmitted => state == RecordState.submitted;

  //convert task duration into income
  get total => '${rate * duration.inHours}\$';

  String get rateFormatted => '$rate\$/h';

  get formatted => DateFormat('yyyy-MM-dd').format(date);

  RecordModel({required this.title, required this.rate});

  @override
  String toString() {
    return '$title ${type.toString()} ${state.toString()} $rate $total';
  }
}
