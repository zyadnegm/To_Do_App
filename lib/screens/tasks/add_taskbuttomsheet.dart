import 'package:flutter/material.dart';

class Add_bottomsheet_task extends StatefulWidget {
  @override
  State<Add_bottomsheet_task> createState() => _Add_bottomsheet_taskState();
}

class _Add_bottomsheet_taskState extends State<Add_bottomsheet_task> {
  var formKey = GlobalKey<FormState>();
  var selected_date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(11),
            child: Text(
              "Add New Task",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
            child: TextFormField(
              validator: (value) {
                if (value != null || value!.length < 4) {
                  return "please enter at least 4 character";
                }
              },
              decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: 'enter your task',
                  suffixStyle: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Color(0XffC8C9CB),
                      fontSize: 20)),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            child: Text(
              "Select time",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
          InkWell(
            onTap: () {
              Showdatepicker();
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 40, bottom: 30),
              child: Text(
                selected_date.toString().substring(0, 10),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 20),
              ),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Add task"))
        ],
      ),
    );
  }

  void Showdatepicker() async {
    DateTime? chossDate = await showDatePicker(
        context: context,
        initialDate: selected_date,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chossDate != null) {
      selected_date = chossDate;
      setState(() {});
    }
  }
}
