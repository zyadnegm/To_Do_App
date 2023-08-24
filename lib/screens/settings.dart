import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/my%20provider.dart';

class Settings_screen extends StatelessWidget {
  static const String routeName = "setting";

  List<String> lang = <String>["English", "Arabic"];
  String selectItem = "English";

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 70),
            child: Text(
              "Language",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 30, top: 15),
            color: Colors.white,
            width: 320,
            height: 50,
            child: DropdownButton(
              value: pro.language == "ar" ? "Arabic" : "English",
              items: [
                DropdownMenuItem<String>(
                  value: selectItem,
                  child: InkWell(
                    onTap: () {
                      pro.changeLanguage("en");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "English",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                DropdownMenuItem<String>(
                  value: 'Arabic',
                  child: InkWell(
                    onTap: () {
                      pro.changeLanguage("ar");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Arabic",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
              onChanged: (String? value) {
                selectItem = value!;
              },
              iconSize: 35,
              isExpanded: true,
              underline: SizedBox(),
            ),
          ),
          SizedBox(
            height: 90,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 6),
            child: Text(
              "Mode",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 30, top: 15),
            color: Colors.white,
            width: 320,
            height: 50,
            child: DropdownButton(
              value: selectItem,
              items: [
                DropdownMenuItem<String>(
                  value: 'English',
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Light',
                      style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                  ),
                ),
                DropdownMenuItem<String>(
                  value: 'Arabic',
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Dark',
                      style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                  ),
                ),
              ],
              onChanged: (String? value) {
                selectItem = value!;
              },
              iconSize: 35,
              isExpanded: true,
              underline: SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
