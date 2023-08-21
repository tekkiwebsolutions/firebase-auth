import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String? name,
    required String? email,
    required String? password,
    required String? username,
  }) async {
    String result = 'Some error occurred';
    try {
      if (email!.isNotEmpty || name!.isNotEmpty || password!.isNotEmpty) {
        UserCredential user = await auth.createUserWithEmailAndPassword(
            email: email, password: password!);
        auth.currentUser!.sendEmailVerification();

        print(user.user);
        result = 'success';
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }

  Future<String> logInUser({
    required String email,
    required String password,
  }) async {
    String result = 'Some error occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential user = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        print(user);
        result = 'success';
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }

  Future signout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<bool> sendPasswordResetEmail(String email) async {
    await auth.sendPasswordResetEmail(email: email);
    return true;
  }


}
