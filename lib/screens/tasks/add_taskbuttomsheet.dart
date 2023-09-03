import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/shared/network/firebase/firebase_function.dart';

class Add_bottomsheet_task extends StatefulWidget {
  @override
  State<Add_bottomsheet_task> createState() => _Add_bottomsheet_taskState();
}

class _Add_bottomsheet_taskState extends State<Add_bottomsheet_task> {
  var formKey = GlobalKey<FormState>();
  var selected_date = DateTime.now();
  var tittleControler = TextEditingController();
  var detailsControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(11),
            child: Text(
              AppLocalizations.of(context)!.newtask,
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
                if (value != null && value!.length < 4) {
                  return "please enter at least 4 character";
                }
              },
              controller: tittleControler,
              decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: AppLocalizations.of(context)!.titlelabel,
                  suffixStyle: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Color(0XffC8C9CB),
                      fontSize: 20)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
            child: TextFormField(
              controller: detailsControler,
              decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: AppLocalizations.of(context)!.describtionlabel,
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
              AppLocalizations.of(context)!.selecttime,
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
          ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Task_model task = Task_model(
                      tittle: tittleControler.text,
                      details: detailsControler.text,
                      userId: FirebaseAuth.instance.currentUser!.uid,
                      date: DateUtils.dateOnly(selected_date)
                          .millisecondsSinceEpoch);
                  Firebase_function.add_task(task);
                  Navigator.pop(context);
                }
              },
              child: Text("Add task"))
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
