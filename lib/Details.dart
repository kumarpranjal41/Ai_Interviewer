import 'package:ai/screen1.dart';
import 'package:ai/widtges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import 'package:sizer/sizer.dart';

class details extends StatefulWidget {
  const details({super.key});

  @override
  State<details> createState() => _detailsState();
}

// final _projectname1Controller = TextEditingController();

// final _mentor1Controller = TextEditingController();
// final _industry1Controller = TextEditingController();

final _skill1mainController = TextEditingController();
final _skill2mainController = TextEditingController();
final _skill3mainController = TextEditingController(); // controller for name
final _skill4mainController = TextEditingController();
final _skill5mainController = TextEditingController();

// String mentor1 = '';

// String projectname1 = '';
// String industry1 = '';
String skill9main = '';
String skill8main = '';
String skill7main = '';
// Variable to store the text
String skill1main = '';
String skill2main = '';
String skill3main = '';
String skill4main = '';
String skill5main = '';
String skill6main = '';

class _detailsState extends State<details> {
  // @override
  // void dispose() {
  //   _designationController.dispose();
  //   // Dispose of the controller when not needed
  //   _organisationController.dispose();
  //   _industryController.dispose();
  //   _toController.dispose();
  //   _placeController.dispose();
  //   _skill1Controller.dispose();
  //   _skill6Controller.dispose();
  //   _skill2Controller.dispose();
  //   _skill3Controller.dispose();
  //   _skill4Controller.dispose();
  //   _skill5Controller.dispose();
  //   _discriptionController.dispose();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          'Interview Details ',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //////////////////
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    ///////////////////////////

                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 7.h,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _skill1mainController,
                          onChanged: (value) {
                            // Update the variable when text changes
                            skill1main = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Your Name',
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Add Your Skills',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 7.h,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _skill2mainController,
                          onChanged: (value) {
                            // Update the variable when text changes
                            skill2main = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'eg :React/Flutter/SQL',
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 7.h,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _skill3mainController,
                          onChanged: (value) {
                            // Update the variable when text changes
                            skill3main = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'eg :React/Flutter/SQL',
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    Container(
                      height: 7.h,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _skill4mainController,
                          onChanged: (value) {
                            // Update the variable when text changes
                            skill4main = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'eg :React/Flutter/SQL',
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 7.h,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _skill5mainController,
                          onChanged: (value) {
                            // Update the variable when text changes
                            skill5main = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'eg :React/Flutter/SQL',
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () {
                  // Save the text to GetStorage
                  // GetStorage().write("projectname1", projectname1);

                  // GetStorage().write("mentor1", mentor1);
                  // GetStorage().write("industry1", industry1);

                  GetStorage().write("skill1main", skill1main);
                  GetStorage().write("skill2main", skill2main);
                  GetStorage().write("skill3main", skill3main);
                  GetStorage().write("skill4main", skill4main);
                  GetStorage().write("skill5main", skill5main);

                  // GetStorage().write("discription1", discription1);
                  final snackBar = SnackBar(
                    content: Text('Saved successfully'),
                    duration: Duration(seconds: 3),

                    behavior: SnackBarBehavior.floating, // Show from the top
                  );

                  // Show the SnackBar using the ScaffoldMessenger
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Get.to(() => Screen1());
                },
                child: commonButton(text: 'Start Interview'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
