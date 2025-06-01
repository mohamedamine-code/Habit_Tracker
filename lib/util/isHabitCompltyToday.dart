bool isHabitCompltyToday(List<DateTime> compltedDays) {
  final today = DateTime.now();

  return compltedDays.any(
    (date) =>
        date.month == today.month &&
        date.day == today.day &&
        date.year == today.year,
  );
}
