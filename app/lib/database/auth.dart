import 'dart:typed_data';

import 'package:app/database/storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class authMethod {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
//sign up the user

  Future<String> UserSignUp({
    required String userName,
    required String email,
    required String password,
  }) async {
    String res = 'some error occured';
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firestore
          .collection('users')
          .doc(
            FirebaseAuth.instance.currentUser!.uid,
          )
          .set({
        'userName': userName,
        'email': email,
        'password': password,
        'uid': _auth.currentUser!.uid,
      });
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //sign in the user

  Future<String> UserSignin({
    required String email,
    required String password,
  }) async {
    String res = 'some error occured';
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //add products to the page

  Future<String> addProduct({
    required String price,
    required String description,
    required String title,
    required Uint8List photourl,
  }) async {
    String res = 'some error occured';
    try {
      String url = await uploadingimage('products', photourl);
      await _firestore
          .collection('products')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'title': title,
        'price': price,
        'description': description,
        'photourl': url,
      });
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //sign in admin

  String AdminName = 'GDSCGROUPONE';
  String AdminEmail = 'GDSCGROUPEmail@gmail.com';

  Map<String, dynamic> tojson() {
    return {
      'adminpassword': AdminName,
      'adminEmail': AdminEmail,
    };
  }
}
