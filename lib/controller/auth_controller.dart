import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screens/homePage.dart';

class AuthController extends GetxController {
  TextEditingController? email, password, name;
  bool? loading = false;
  login() {
    loading = true;
    update();
    var auth = FirebaseAuth.instance;
    var userInfo = auth.signInWithEmailAndPassword(
        email: email!.text, password: password!.text);
    loading = false;
    email!.clear();
    password!.clear();

    update();
    Get.offAll(() => HomePage());
  }

  register() async {
    loading = true;
    update();
    var auth = FirebaseAuth.instance;
    var userInfo = await auth.createUserWithEmailAndPassword(
        email: email!.text, password: password!.text);
    await FirebaseFirestore.instance
        .collection("user")
        .doc(userInfo.user!.uid)
        .set({
      "uid": userInfo.user!.uid,
      "name": name!.text,
      "email": email!.text,
    });
    loading = false;
    email!.clear();
    name!.clear();
    password!.clear();
    update();
    Get.offAll(() => const HomePage());
  }
}
