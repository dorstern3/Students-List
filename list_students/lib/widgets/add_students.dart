import 'package:flutter/material.dart';
import 'package:list_students/theme/palette.dart';

class AddStudents extends StatelessWidget {
  final dynamic contrllerName;
  final dynamic contrllerCountry;
  const AddStudents(
      {super.key, required this.contrllerCountry, required this.contrllerName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            style: const TextStyle(color: Pallete.blackColor),
            controller: contrllerName,
            autofocus: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              fillColor: Pallete.orangeColor,
              filled: true,
              icon: const Icon(
                Icons.account_circle_rounded,
                size: 40,
                color: Pallete.redColor,
              ),
              hintText: 'Studnet Name',
              hintStyle: const TextStyle(
                color: Pallete.blackColor,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            style: const TextStyle(color: Pallete.blackColor),
            controller: contrllerCountry,
            autofocus: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              fillColor: Pallete.orangeColor,
              filled: true,
              icon: const Icon(
                Icons.language,
                size: 40,
                color: Pallete.redColor,
              ),
              hintText: 'Studnet Country',
              hintStyle: const TextStyle(
                color: Pallete.blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
