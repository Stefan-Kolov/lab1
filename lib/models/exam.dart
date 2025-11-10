class Exam{
  final String name;
  final DateTime date;
  final List<String> rooms;

  Exam({
    required this.name,
    required this.date,
    required this.rooms,
  });

  bool get examIncoming => date.isAfter(DateTime.now());
}