import 'package:flutter/material.dart';
import 'package:kalle/utils/date.dart';

class CalendarSheet extends StatelessWidget {
  final DateTime _date;
  int lastDayOfLastMonth;
  int weekDayOfFirstDayOfMonth;
  int lastDayOfMonth;
  CalendarSheet(this._date) {
    lastDayOfLastMonth = DateTime(this._date.year, this._date.month, 0).day;
    weekDayOfFirstDayOfMonth =
        DateTime(this._date.year, this._date.month, 1).weekday;
    lastDayOfMonth = DateTime(this._date.year, this._date.month + 1, 0).day;
  }
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarSheetHeader(),
          CalendarSheetBody(
            lastDayOfLastMonth,
            weekDayOfFirstDayOfMonth,
            lastDayOfMonth,
          ),
        ],
      ),
    );
  }
}

class CalendarSheetHeader extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: List<Widget>.generate(
          7,
          (index) => Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(byWeekday(index + 1).name),
            ),
          ),
        ),
      ),
    );
  }
}

class CalendarSheetBody extends StatelessWidget {
  final int _lastDayOfLastMonth;
  final int _weekDayOfFirstDayOfMonth;
  final int _lastDayOfMonth;
  CalendarSheetBody(this._lastDayOfLastMonth, this._weekDayOfFirstDayOfMonth,
      this._lastDayOfMonth);
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List<Widget>.generate(
          5,
          (row) => Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List<Widget>.generate(
                7,
                (column) => Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(),
                        left: column == 0
                            ? BorderSide.none
                            : BorderSide(color: Colors.black),
                      ),
                    ),
                    child: Builder(builder: (BuildContext context) {
                      var day =
                          row * 7 + column - _weekDayOfFirstDayOfMonth + 2;

                      var color = Colors.black;

                      if (day < 1) {
                        day += _lastDayOfLastMonth;
                        color = Colors.grey;
                      } else if (day > _lastDayOfMonth) {
                        day -= _lastDayOfMonth;
                        color = Colors.grey;
                      }

                      return Text(
                        day.toString(),
                        style: TextStyle(
                          color: color,
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}