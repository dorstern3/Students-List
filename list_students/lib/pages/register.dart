import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:list_students/pages/students.dart';
import 'package:list_students/theme/palette.dart';
import 'package:list_students/widgets/register_field.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailControllerRegister = TextEditingController();
  final passwordControllerRegister = TextEditingController();

  @override
  void dispose() {
    emailControllerRegister.dispose();
    passwordControllerRegister.dispose();

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
              const Center(
                child: Text(
                  'Register teacher',
                  style: TextStyle(
                    fontSize: 40,
                    color: Pallete.redColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              RegisterField(
                  hintText: 'Username',
                  controllerRegister: emailControllerRegister),
              const SizedBox(
                height: 20,
              ),
              RegisterField(
                  hintText: 'Password',
                  controllerRegister: passwordControllerRegister),
              const SizedBox(
                height: 40,
              ),
              RegisterButton(onPressed: signUp),
              const SizedBox(
                height: 40,
              ),
              const LoginNavigate(),
            ],
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailControllerRegister.text.trim(),
        password: passwordControllerRegister.text.trim(),
      );

      // ignore: use_build_context_synchronously
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
