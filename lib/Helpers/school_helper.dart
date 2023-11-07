import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class School_Helper {
  School_Helper._();
  static final School_Helper school_helper = School_Helper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String stud = "student";
  String teacher = "teacher";

  login({required int enroll, required String pass}) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await firestore.collection(stud).doc(enroll.toString()).get();
    Map<String, dynamic>? data = documentSnapshot.data();
    log("Enroll : $enroll , Pass : $pass");
    log(data.toString());
    if (data != null) {
      return (data[(enroll + 100).toString()]['pass'] == pass)
          ? "Logged In"
          : "Incorrect Password";
    } else {
      return "Incorrect Id";
    }
  }
}
