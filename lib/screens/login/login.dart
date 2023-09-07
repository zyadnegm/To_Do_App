import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Base.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/my%20provider.dart';
import 'package:todo/screens/login/Login_viewModel.dart';
import 'package:todo/screens/login/connector.dart';
import 'package:todo/shared/style/colors/app_color.dart';

import '../signIn/signIn.dart';

class Login_screen extends StatefulWidget {
  static const String routeName = "login";

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends BaseView<Login_screen, LoginViewModel>
    implements LoginConnector {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<Login_provider>(context);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/logo.png")),
              Text(
                "Welcome Back",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 27,
                    color: Colors.black),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  validator: (value) {
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[gmail]+\.[a-zA-Z]+")
                        .hasMatch(value!);
                    if (!emailValid) {
                      return "please enter your  valid email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: primarycolor),
                    ),
                    labelText: " Email",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: primarycolor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: primarycolor),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  validator: (value) {
                    return (value != null && value.length < 6
                        ? "please Enter vailed password"
                        : null);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: primarycolor),
                    ),
                    labelText: "Password",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: primarycolor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: primarycolor),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      viewModel.login(
                          emailController.text, passwordController.text);
                    }
                  },
                  child: Text("Login")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("I have no account....?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignIn_screen.routeName);
                        },
                        child: Text("Creat Account"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  go_toHome() {
    Navigator.pushNamedAndRemoveUntil(
        context, Home_layout.routeName, (route) => false);
  }

  @override
  hideDialog() {
    Navigator.pop(context);
  }

  @override
  showLoading() {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  showMassege(String massege) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(massege),
      ),
    );
  }

  @override
  LoginViewModel initMyViewModel() {
    return LoginViewModel();
  }
}
