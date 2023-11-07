import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:school_management/controllers/management_controller.dart';
import 'package:school_management/Helpers/school_helper.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  String pass = "";
  int id = 0;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login As"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<SchoolController>(builder: (_, pro, __) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Gap(s.height * 0.02),
                Image.asset(
                  "assets/images/school.png",
                  height: s.height * 0.2,
                  // fit: BoxFit.fill,
                ),
                Gap(s.height * 0.02),
                CupertinoSlidingSegmentedControl(
                    groupValue: pro.logger,
                    children: const {
                      'faculty': Text("Faculty"),
                      'student': Text("Student"),
                    },
                    onValueChanged: (val) {
                      // pro.changeLogger(val: val);
                    }),
                Gap(s.height * 0.1),
                Form(
                    key: formkey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          validator: (val) {
                            return (val != null) ? null : "Enter Id";
                          },
                          onSaved: (val) {
                            id = int.parse(val!);
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: "Enter Roll no",
                            hintText: "1",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        Gap(s.height * 0.02),
                        TextFormField(
                          validator: (val) {
                            return (val != null) ? null : "Enter Password";
                          },
                          onSaved: (val) {
                            pass = val!;
                          },
                          decoration: const InputDecoration(
                            labelText: "Password",
                            hintText: "pass221",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    )),
                Gap(s.height * 0.03),
                ElevatedButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        String msg = await School_Helper.school_helper
                            .login(enroll: id, pass: pass);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(msg),
                          ),
                        );
                      }
                    },
                    child: const Text("Save")),
              ],
            ),
          );
        }),
      ),
    );
  }
}
