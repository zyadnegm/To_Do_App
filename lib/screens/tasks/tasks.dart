import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/tasks/task%20item.dart';
import 'package:todo/shared/network/firebase/firebase_function.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) {
            print(date);
          },
          leftMargin: 20,
          monthColor: Colors.blueGrey,
          dayColor: Colors.teal[200],
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Colors.redAccent[100],
          dotsColor: Color(0xFF333A47),
          selectableDayPredicate: (date) => date.day != 23,
          locale: 'en_ISO',
        ),
        SizedBox(
          height: 8,
        ),
        FutureBuilder(
          future: Firebase_function.get_task(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text("Somthing went wrong");
            }
            var tasks = snapshot.data!.docs.map((e) => e.data()).toList() ?? [];
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
