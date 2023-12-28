import 'package:flutter/material.dart';
import 'package:list_students/theme/palette.dart';

class RegisterField extends StatelessWidget {
  final String hintText;
  final dynamic controllerRegister;
  const RegisterField(
      {super.key, required this.controllerRegister, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 300,
      ),
      child: TextFormField(
        autofocus: true,
        style: const TextStyle(color: Pallete.blackColor),
        controller: controllerRegister,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Pallete.blackColor),
          fillColor: Pallete.orangeColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Pallete.blackStorngColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Pallete.blackStorngColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  final dynamic onPressed;
  const RegisterButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 55,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          'Register',
          style: const TextStyle(
            color: Pallete.blackColor,
            fontSize: 18,
          ),
        ),
        style: TextButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          backgroundColor: Pallete.orangeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Pallete.blackStorngColor, width: 3),
          ),
        ),
      ),
    );
  }
}

class LoginNavigate extends StatelessWidget {
  const LoginNavigate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          textAlign: TextAlign.center,
          'Are you already registered? \n Login',
          style: const TextStyle(
            color: Pallete.blackColor,
            fontSize: 18,
          ),
        ),
        style: TextButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          backgroundColor: Pallete.orangeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Pallete.blackStorngColor, width: 3),
          ),
        ),
      ),
    );
  }
}
