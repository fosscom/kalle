import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kalle/calendar_sheet.dart';
import 'package:kalle/utils/date.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Kalle'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime today = new DateTime.now();
  int month;
  int year;

  @override
  void initState() {
    super.initState();
    // initialze starting date with todays date
    month = this.today.month;
    year = this.today.year;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Container(
            child: FlatButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () {
                setState(() {
                  year = this.today.year;
                  month = this.today.month;
                });
              },
              child: Text("Today"),
              padding: EdgeInsets.all(0.0),
            ),
            margin: EdgeInsets.fromLTRB(10, 10, 20, 10),
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: Colors.grey)),
          ),
          DropdownButton<int>(
              value: month,
              items: List<DropdownMenuItem<int>>.generate(
                12,
                (index) => DropdownMenuItem<int>(
                  value: 1 + index,
                  child: new Text(NameOfMonth(index + 1)),
                ),
              ),
              onChanged: (val) {
                setState(() {
                  month = val;
                });
              }),
          DropdownButton<int>(
              value: year,
              items: List<DropdownMenuItem<int>>.generate(
                41,
                (index) => DropdownMenuItem<int>(
                  value: 2000 + index,
                  child: new Text((2000 + index).toString()),
                ),
              ),
              onChanged: (val) {
                setState(() {
                  year = val;
                });
              }),
        ],
      ),
      body: Container(
        child: Row(
          children: [
            Container(
              color: Colors.black,
              width: 200,
            ),
            Expanded(
              child: Listener(
                onPointerSignal: (event) {
                  if (event is PointerScrollEvent) {
                    if (event.scrollDelta.dy > 0) {
                      setState(() {
                        month++;
                        if (month > 12) {
                          year++;
                          month = 1;
                        }
                      });
                    } else {
                      setState(() {
                        month--;
                        if (month < 1) {
                          year--;
                          month = 12;
                        }
                      });
                    }
                  }
                },
                child: CalendarSheet(DateTime(year, month)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
