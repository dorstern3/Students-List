import 'package:flutter/material.dart';
import 'package:list_students/pages/note.dart';
import 'package:list_students/theme/palette.dart';
import 'package:list_students/models/students_class.dart';
import 'package:list_students/widgets/add_students.dart';

class Students extends StatefulWidget {
  const Students({super.key});

  @override
  State<Students> createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  final nameControllerLogin = TextEditingController();
  final countryControllerLogin = TextEditingController();
  List<StudentsList> studentsList = List.empty(growable: true);
  int counterStudents = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addstudentsDialog();
        },
        backgroundColor: Pallete.redColor,
        child: const Icon(
          Icons.add,
          size: 40,
          color: Pallete.blackStorngColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Pallete.blackStorngColor,
        title: const Center(
          child: Text(
            'Students List',
            style: TextStyle(color: Pallete.redColor, fontSize: 25),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(children: [
          Text(
            'Number of all your students: ${counterStudents.toString()} ',
            style: const TextStyle(
              color: Pallete.orangeColor,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          studentsList.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Pallete.blackColor)),
                    height: 100,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Pallete.redColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "You don't have students\n yet in the list",
                          style:
                              TextStyle(fontSize: 25, color: Pallete.redColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: studentsList.length,
                    itemBuilder: (context, index) => studentsRow(index),
                  ),
                ),
        ]),
      ),
    );
  }

  Widget studentsRow(int index) {
    String editName = '';
    String editCountry = '';

    return Card(
      margin: const EdgeInsets.only(right: 10, left: 10, bottom: 40),
      color: Pallete.orangeColor,
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Note()),
          );
        },
        leading: CircleAvatar(
          backgroundColor: Pallete.blackStorngColor,
          child: Text(
            studentsList[index].name[0],
            style: const TextStyle(
              fontSize: 25,
              color: Pallete.redColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          studentsList[index].name,
          style: const TextStyle(fontSize: 20, color: Pallete.blackStorngColor),
        ),
        subtitle: Text(
          studentsList[index].country,
          style: const TextStyle(fontSize: 15, color: Pallete.blackStorngColor),
        ),
        trailing: SizedBox(
          width: 50,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                            color: Pallete.orangeColor, width: 3),
                      ),
                      backgroundColor: Pallete.blackColor,
                      title: const Center(
                        child: Text(
                          'New Student',
                          style:
                              TextStyle(color: Pallete.redColor, fontSize: 25),
                        ),
                      ),
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            height: 250,
                            width: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextField(
                                  style: const TextStyle(
                                      color: Pallete.blackColor),
                                  onChanged: (value) {
                                    setState(() {
                                      editName = value;
                                    });
                                  },
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
                                  style: const TextStyle(
                                      color: Pallete.blackColor),
                                  onChanged: (value) {
                                    setState(() {
                                      editCountry = value;
                                    });
                                  },
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
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: 150,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: Pallete.orangeColor,
                                      splashFactory: NoSplash.splashFactory,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        studentsList[index].name = editName;
                                        studentsList[index].country =
                                            editCountry;
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: const Text(
                                      'Update',
                                      style: TextStyle(
                                          color: Pallete.blackColor,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: const Icon(
                  Icons.edit,
                  size: 25,
                  color: Pallete.blackColor,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(
                    () {
                      studentsList.removeAt(index);
                      [counterStudents--];
                    },
                  );
                },
                child: const Icon(
                  Icons.delete,
                  size: 25,
                  color: Pallete.blackColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future addstudentsDialog() => showDialog(
        context: context,
        barrierColor: Pallete.blackColor.withOpacity(0),
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Center(
            child: Text(
              'New Student',
              style: TextStyle(color: Pallete.redColor, fontSize: 25),
            ),
          ),
          backgroundColor: Pallete.blackColor,
          content: AddStudents(
            contrllerCountry: countryControllerLogin,
            contrllerName: nameControllerLogin,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Pallete.orangeColor, width: 3),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Container(
                    height: 50,
                    width: 200,
                    alignment: Alignment.center,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Pallete.orangeColor,
                        splashFactory: NoSplash.splashFactory,
                      ),
                      onPressed: addStudent,
                      child: const Center(
                        child: Text(
                          'Add student to the List',
                          style: TextStyle(
                              color: Pallete.blackColor, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  void addStudent() {
    String name = nameControllerLogin.text.trim();
    String country = countryControllerLogin.text.trim();

    if (name.isNotEmpty && country.isNotEmpty) {
      setState(() {
        nameControllerLogin.text = '';
        countryControllerLogin.text = '';
        studentsList.add(
          StudentsList(name: name, country: country),
        );
        [counterStudents++];

        Navigator.of(context).pop();
      });
    }
  }
}
