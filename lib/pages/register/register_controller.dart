import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riverpod_ecommerce/pages/register/notifier/register_notifier.dart';
import 'package:riverpod_ecommerce/pages/sign-in/widgets/fluttertoast-widget.dart';

class RegisterController {
  late WidgetRef ref;

  RegisterController(this.ref);

  handleRegister() async {
    var state = ref.read(registerNotifierProvider);
    Color? background;
    String name = state.username;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (email.isEmpty || name.isEmpty) {
      background = Colors.red;
      registerPopup("Your field is empty", background);
      return;
    }
    if (email.contains("@") && email.contains(".")) {
      print("Ok");
    } else {
      background = Colors.red;
      registerPopup("Email doesn't contain @ or . character", background);
      return;
    }
    if (state.password.length < 6) {
      background = Colors.red;
      registerPopup("Your password is too short", background);
    }
    if (state.password != state.rePassword) {
      background = Colors.red;
      registerPopup("Passwords don't match", background);
      return;
    }
    var context = Navigator.of(ref.context);
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (kDebugMode) {
        print(credential);
      }
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);
        background = Colors.green;
        registerPopup(
            "An email has been sent to verify your account. Please open your mailbox and confirm your account!",
            background);
        context.pop();
      }
    } catch (e) {
      background = Colors.red;
      registerPopup(e, background);
    }
  }
}
