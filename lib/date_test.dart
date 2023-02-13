void main() {
  final _currentDate = DateTime.now();
  final dates = <DateTime>[];

  for (int i = 0; i < 7; i++) {
    final date = _currentDate.add(Duration(days: i));
    dates.add(date);
  }

  print(dates.join(",\n"));
}
