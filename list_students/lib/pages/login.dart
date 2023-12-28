import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:list_students/pages/students.dart';
import 'package:list_students/theme/palette.dart';
import 'package:list_students/widgets/finger_print.dart';
import 'package:list_students/widgets/login_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailControllerLogin = TextEditingController();
  final passwordControllerLogin = TextEditingController();

  @override
  void dispose() {
    emailControllerLogin.dispose();
    passwordControllerLogin.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 90),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Text(
                'Login teacher',
                style: TextStyle(
                  fontSize: 40,
                  color: Pallete.redColor,
                ),
              )),
              SizedBox(
                height: 40,
              ),
              LoginField(
                hintText: 'Username',
                controllerLogin: emailControllerLogin,
              ),
              SizedBox(
                height: 20,
              ),
              LoginField(
                hintText: 'Password',
                controllerLogin: passwordControllerLogin,
              ),
              SizedBox(
                height: 40,
              ),
              LoginButton(
                onPressed: signIn,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 300,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FacebookButton(),
                    GoogleButton(),
                    FingerPrint(),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              RegisterNavigate(),
            ],
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailControllerLogin.text.trim(),
        password: passwordControllerLogin.text.trim(),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Students(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
