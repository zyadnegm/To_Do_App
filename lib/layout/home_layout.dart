import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/my%20provider.dart';
import 'package:todo/screens/login&&sign/login.dart';
import 'package:todo/screens/settings.dart';
import 'package:todo/screens/tasks/tasks.dart';

import '../screens/tasks/add_taskbuttomsheet.dart';

class Home_layout extends StatefulWidget {
  static const String routeName = "homalayout";

  @override
  State<Home_layout> createState() => _Home_layoutState();
}

class _Home_layoutState extends State<Home_layout> {
  int current_index = 0;
  String txt = "To Do List";
  List<Widget> tabs = [Tasks(), Settings_screen()];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Login_provider>(context);
    if (current_index == 1) {
      txt = AppLocalizations.of(context)!.appsetting;
    }
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                provider.initUser();
                Navigator.pushNamedAndRemoveUntil(
                    context, Login_screen.routeName, (route) => false);
              },
              icon: Icon(
                Icons.output,
                size: 30,
                color: Colors.white,
              ))
        ],
        title: Text(provider.user_model!.name),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 4, color: Colors.white),
            borderRadius: BorderRadius.circular(30)),
        onPressed: () {},
        child: InkWell(
            onTap: () {
              Showbottomsheet_add(context);
            },
            child: Icon(Icons.add)),
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: BottomNavigationBar(
          currentIndex: current_index,
          onTap: (value) {
            current_index = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
          ],
        ),
      ),
      body: tabs[current_index],
    );
  }

  Showbottomsheet_add(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), topLeft: Radius.circular(25))),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Add_bottomsheet_task(),
        );
      },
    );
  }
}
