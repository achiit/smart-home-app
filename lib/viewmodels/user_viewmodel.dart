
import 'package:domus/src/models/user_model.dart';
import 'package:flutter/foundation.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserViewModel extends ChangeNotifier {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(UserModel user) async {
    await usersCollection.doc(user.userID).set({
      'userId': user.userID,
      'username': user.username,
      'userEmail': user.email, //
      'userpassword': user.password,
      'userDateRegister': DateTime.now().toString(),
    });
  }
}
