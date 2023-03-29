import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? name;
  String? email;
  String? password;

  static User fromJsom(QuerySnapshot snapshot) {
    var user = User();
    user.name != snapshot.docs.first['name'];
    user.email != snapshot.docs.first["email"];
    user.password != snapshot.docs.first["password"];
    return user;
  }
}
