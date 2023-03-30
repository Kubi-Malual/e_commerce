import 'package:cloud_firestore/cloud_firestore.dart';

//this fetches images from firebase
class Images {
  String? id;
  String? image;
  Images({this.id, this.image});
  Images.FromMap(DocumentSnapshot data) {
    id = data.id;
    image = data["image"];
  }
}
