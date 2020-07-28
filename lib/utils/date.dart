enum DayOfWeek { MON, TUE, WED, THU, FRI, SAT, SUN }

extension DayOfWeekExtension on DayOfWeek {
  String get name {
    switch (this) {
      case DayOfWeek.MON:
        return "Mon";

      case DayOfWeek.TUE:
        return "Tue";

      case DayOfWeek.WED:
        return "Wed";

      case DayOfWeek.THU:
        return "Thu";

      case DayOfWeek.FRI:
        return "Fri";

      case DayOfWeek.SAT:
        return "Sat";

      case DayOfWeek.SUN:
        return "Sun";
    }
  }

  DayOfWeek get next {
    switch (this) {
      case DayOfWeek.MON:
        return DayOfWeek.TUE;

      case DayOfWeek.TUE:
        return DayOfWeek.WED;

      case DayOfWeek.WED:
        return DayOfWeek.THU;

      case DayOfWeek.THU:
        return DayOfWeek.FRI;

      case DayOfWeek.FRI:
        return DayOfWeek.SAT;

      case DayOfWeek.SAT:
        return DayOfWeek.SUN;

      case DayOfWeek.SUN:
        return DayOfWeek.MON;
    }
  }
}

DayOfWeek byWeekday(int weekday) {
  switch (weekday % 7) {
    case 0:
      return DayOfWeek.SUN;

    case 1:
      return DayOfWeek.MON;

    case 2:
      return DayOfWeek.TUE;

    case 3:
      return DayOfWeek.WED;

    case 4:
      return DayOfWeek.THU;

    case 5:
      return DayOfWeek.FRI;

    case 6:
      return DayOfWeek.SAT;
  }
}

int dayOfWeek(int day, int month, int year) {
  var arr = [0, 3, 2, 5, 3, 5, 1, 4, 6, 2, 4];
  if (month < 3) year--;
  return ((year + year / 4 - year / 100 + year / 400 + arr[month - 1] + day) %
          7)
      .floor();
}
