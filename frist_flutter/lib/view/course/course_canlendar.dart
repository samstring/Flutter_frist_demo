import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';

class CourseCalendar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CourseCalendar();
  }
}

class _CourseCalendar extends State<CourseCalendar>{
  @override
  Widget build(BuildContext context) {
    
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("日历"),
        
      ),
      body: Calendar(
        isExpandable: true,
      ),
    );
  }
}