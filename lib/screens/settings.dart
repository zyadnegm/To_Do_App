import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/my%20provider.dart';
import 'package:todo/shared/style/colors/app_color.dart';

class Settings_screen extends StatelessWidget {
  static const String routeName = "setting";

  List<String> lang = <String>["English", "Arabic"];
  String selectItem = "English";
  bool isdarkmode = false;

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Scaffold(
      backgroundColor:
          pro.themeData == ThemeMode.dark ? Color(0Xff060E1E) : Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 70),
            child: Text(
              AppLocalizations.of(context)!.language,
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
            color:
                pro.themeData == ThemeMode.dark ? primarycolor : Colors.white,
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
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.black),
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context)!.mode,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: pro.themeData == ThemeMode.dark
                          ? Colors.white
                          : Colors.black),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 15, top: 20),
                child: Switch(
                  value: isdarkmode,
                  onChanged: (value) {
                    if (value) {
                      pro.changeMode(ThemeMode.dark);
                      isdarkmode = true;
                    } else {
                      pro.changeMode(ThemeMode.light);
                      isdarkmode = false;
                    }
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
