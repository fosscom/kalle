enum DayOfWeek { Mon, Tue, Wed, Thu, Fri, Sat, Sun }
enum MonthOfYear { Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec }

extension MonthOfYearExtension on MonthOfYear {
  String get name {
    switch (this) {
      case MonthOfYear.Jan:
        return "January";

      case MonthOfYear.Feb:
        return "February";

      case MonthOfYear.Mar:
        return "March";

      case MonthOfYear.Apr:
        return "April";

      case MonthOfYear.May:
        return "May";

      case MonthOfYear.Jun:
        return "June";

      case MonthOfYear.Jul:
        return "July";

      case MonthOfYear.Aug:
        return "August";

      case MonthOfYear.Sep:
        return "September";

      case MonthOfYear.Oct:
        return "October";

      case MonthOfYear.Nov:
        return "November";

      case MonthOfYear.Dec:
        return "December";
    }
  }
}

String NameOfMonth(int month) {
  switch (month) {
    case 1:
      return "January";

    case 2:
      return "February";

    case 3:
      return "March";

    case 4:
      return "April";

    case 5:
      return "May";

    case 6:
      return "June";

    case 7:
      return "July";

    case 8:
      return "August";

    case 9:
      return "September";

    case 10:
      return "October";

    case 11:
      return "November";

    case 12:
      return "December";

    default:
      return "FEHLER";
  }
}

extension DayOfWeekExtension on DayOfWeek {
  String get name {
    switch (this) {
      case DayOfWeek.Mon:
        return "Mon";

      case DayOfWeek.Tue:
        return "Tue";

      case DayOfWeek.Wed:
        return "Wed";

      case DayOfWeek.Thu:
        return "Thu";

      case DayOfWeek.Fri:
        return "Fri";

      case DayOfWeek.Sat:
        return "Sat";

      case DayOfWeek.Sun:
        return "Sun";
    }
  }

  DayOfWeek get next {
    switch (this) {
      case DayOfWeek.Mon:
        return DayOfWeek.Tue;

      case DayOfWeek.Tue:
        return DayOfWeek.Wed;

      case DayOfWeek.Wed:
        return DayOfWeek.Thu;

      case DayOfWeek.Thu:
        return DayOfWeek.Fri;

      case DayOfWeek.Fri:
        return DayOfWeek.Sat;

      case DayOfWeek.Sat:
        return DayOfWeek.Sun;

      case DayOfWeek.Sun:
        return DayOfWeek.Mon;
    }
  }
}

DayOfWeek byWeekday(int weekday) {
  switch (weekday % 7) {
    case 0:
      return DayOfWeek.Sun;

    case 1:
      return DayOfWeek.Mon;

    case 2:
      return DayOfWeek.Tue;

    case 3:
      return DayOfWeek.Wed;

    case 4:
      return DayOfWeek.Thu;

    case 5:
      return DayOfWeek.Fri;

    case 6:
      return DayOfWeek.Sat;
  }
}

int dayOfWeek(int day, int month, int year) {
  var arr = [0, 3, 2, 5, 3, 5, 1, 4, 6, 2, 4];
  if (month < 3) year--;
  return ((year + year / 4 - year / 100 + year / 400 + arr[month - 1] + day) %
          7)
      .floor();
}
