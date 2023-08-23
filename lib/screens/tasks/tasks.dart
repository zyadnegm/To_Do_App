import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/tasks/task%20item.dart';
import 'package:todo/shared/network/firebase/firebase_function.dart';

class Tasks extends StatefulWidget {
  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: selectedDate,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) {
            selectedDate = date;
            setState(() {});
          },
          leftMargin: 20,
          monthColor: Colors.blueGrey,
          dayColor: Colors.teal[200],
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Colors.redAccent[100],
          dotsColor: Color(0xFF333A47),
          selectableDayPredicate: (date) => date.day != 20,
          locale: 'en_ISO',
        ),
        SizedBox(
          height: 8,
        ),
        StreamBuilder(
          stream: Firebase_function.get_task(selectedDate),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text("Somthing went wrong");
            }
            var tasks = snapshot.data!.docs.map((e) => e.data()).toList() ?? [];
            if (tasks.isEmpty) {
              return Center(child: Text("No tasks"));
            }
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Task_item(tasks[index]);
                },
                itemCount: tasks.length,
              ),
            );
          },
        )
      ],
    );
  }
}
