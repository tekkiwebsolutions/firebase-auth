import 'package:fauth/helper/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  AuthMethods authMethods = AuthMethods();

  User? currentUser;

  bool isLoading = false;

  init() {
    currentUser = authMethods.auth.currentUser;
    print(currentUser);
  }

  toggleLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<bool> signUp(String email, String password) async {
    toggleLoading();
    String result = await authMethods.signUpUser(
        name: email, email: email, password: password, username: email);
    toggleLoading();
    if (result != 'success') {
      print(result);
      return false;
    } else {
      return true;
    }
  }

  Future<bool> logInUser(String email, String password) async {
    toggleLoading();
    String result = await authMethods.logInUser(
      email: email,
      password: password,
    );
    print(result);
    toggleLoading();
    if (result == 'successs') {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signOut() async {
    await authMethods.signout();
    return true; 
  }
}
