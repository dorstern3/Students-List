import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:list_students/pages/students.dart';
import 'package:list_students/theme/palette.dart';
import 'package:local_auth/local_auth.dart';

class FingerPrint extends StatefulWidget {
  const FingerPrint({super.key});

  @override
  State<FingerPrint> createState() => _FingerPrintState();
}

class _FingerPrintState extends State<FingerPrint> {
  late final LocalAuthentication auth;
  // ignore: unused_field
  bool _supportState = false;

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported) => setState(
          () {
            _supportState = isSupported;
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _authenticate,
      icon: const Icon(
        Icons.fingerprint_sharp,
        size: 35,
        color: Pallete.orangeColor,
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }

  Future<void> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
          localizedReason:
              'Subscribe or you will never find any stack overflow answer');
      //options:
      const AuthenticationOptions(
        stickyAuth: true,
        biometricOnly: true,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Students(),
        ),
      );
      // ignore: avoid_print
      print('Authenticated: $authenticated');
      // ignore: use_build_context_synchronously
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
