import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final List followers;
  final List following;

  const User(
      {required this.uid,
      required this.email,
      required this.followers,
      required this.following});

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      uid: snapshot["uid"],
      email: snapshot["email"],
      followers: snapshot["followers"],
      following: snapshot["following"],
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "followers": followers,
        "following": following,
      };
}