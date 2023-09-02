import 'package:flutter/material.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/screens/login&&sign/sign%20in.dart';
import 'package:todo/shared/network/firebase/firebase_function.dart';
import 'package:todo/shared/style/colors/app_color.dart';

class Login_screen extends StatelessWidget {
  static const String routeName = "login";
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Firebase_function.login(
                            emailController.text, passwordController.text)
                        .then((value) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Home_layout.routeName, (route) => false);
                    });
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
    );
  }
}
