import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:list_students/pages/login.dart';
import 'package:list_students/pages/register.dart';
import 'package:list_students/pages/students.dart';
import 'package:list_students/theme/palette.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginField extends StatelessWidget {
  final String hintText;
  final dynamic controllerLogin;
  const LoginField(
      {super.key, required this.controllerLogin, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 300,
      ),
      child: TextFormField(
        // autofocus: true,
        style: const TextStyle(color: Pallete.blackColor),
        controller: controllerLogin,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Pallete.blackColor),
          fillColor: Pallete.orangeColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Pallete.blackStorngColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
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

class LoginButton extends StatelessWidget {
  final dynamic onPressed;
  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 55,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          'Login',
          style: TextStyle(
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

class FacebookButton extends StatelessWidget {
  const FacebookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.facebook_outlined,
        size: 35,
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      color: Pallete.orangeColor,
      onPressed: () async {
        await signInWithFacebook();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Students(),
          ),
        );
      },
    );
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.email,
        size: 35,
      ),
      color: Pallete.orangeColor,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () async {
        await signInWithGoogle();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Students(),
          ),
        );
      },
    );
  }
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

class RegisterNavigate extends StatelessWidget {
  const RegisterNavigate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 55,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Register(),
            ),
          );
        },
        child: Text(
          'Register',
          style: TextStyle(
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
