// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:list_students/pages/login.dart';
// import 'package:list_students/pages/students.dart';

// class Select extends StatelessWidget {
//   const Select({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return const Students();
//           } else {
//             return const Login();
//           }
//         },
//       ),
//     );
//   }
// }
