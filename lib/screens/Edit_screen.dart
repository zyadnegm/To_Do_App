import 'package:flutter/material.dart';

class Edit_screen extends StatefulWidget {
  static const String routeName = "edit";

  @override
  State<Edit_screen> createState() => _Edit_screenState();
}

class _Edit_screenState extends State<Edit_screen> {
  var edit_date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(children: [
            AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(bottom: 27),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              toolbarHeight: 130,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 27),
                child: Text("To Do List"),
              ),
            ),
            Center(
              child: Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 110),
                height: 617,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(children: [
                    Text("Edit Task",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: "This is Tittle",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black)),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: "Task details",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black)),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 50),
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
                        ShowDatepicker(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 40, bottom: 60),
                        child: Text(
                          edit_date.toString().substring(0, 10),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Save Changes"),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ))),
                    )
                  ]),
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }

  void ShowDatepicker(BuildContext context) async {
    DateTime? chossDate = await showDatePicker(
        context: context,
        initialDate: edit_date,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chossDate != null) {
      edit_date = chossDate;
      setState(() {});
    }
  }
}
