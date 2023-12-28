import 'package:flutter/material.dart';
import 'package:list_students/theme/palette.dart';

class Note extends StatefulWidget {
  Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.blackColor,
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Pallete.blackStorngColor,
        title: Center(
          child: Text(
            'Note',
            style: TextStyle(color: Pallete.redColor, fontSize: 25),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(color: Pallete.orangeColor, width: 1.5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const TextField(
                  style: TextStyle(
                    color: Pallete.redColor,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: TextStyle(color: Pallete.redColor, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 300,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Pallete.orangeColor,
                      width: 1.5,
                    ),
                  ),
                ),
                child: const TextField(
                  style: TextStyle(
                    color: Pallete.orangeColor,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Content',
                    hintStyle:
                        TextStyle(color: Pallete.orangeColor, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
