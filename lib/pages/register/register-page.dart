import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_ecommerce/pages/register/notifier/register_notifier.dart';
import 'package:riverpod_ecommerce/pages/register/register_controller.dart';
import 'package:riverpod_ecommerce/pages/sign-in/notifiers/passwordfield-notifier.dart';
import 'package:riverpod_ecommerce/pages/sign-in/widgets/sign-button.dart';
import 'package:riverpod_ecommerce/pages/sign-in/widgets/signin-loginoptions.dart';
import 'package:riverpod_ecommerce/text-widgets/title-text-widget.dart';

class RegisterPage extends ConsumerWidget {
  RegisterPage({super.key});

  TextEditingController _registerUsernameController = TextEditingController();
  TextEditingController _registerEmailController = TextEditingController();
  TextEditingController _registerPassController = TextEditingController();
  TextEditingController _registerRepeatPassController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerProvider = ref.watch(registerNotifierProvider);
    final regControll = RegisterController(ref);
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
        child: Scaffold(
          //resizeToAvoidBottomInset: false,
          appBar: AppBar(
              centerTitle: true, title: text16Normal("Sign up", Colors.black)),
          body: SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 50),
                height: MediaQuery.of(context).size.height * 0.85,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Enter your details below & sign up for free"),
                    const SizedBox(
                      height: 20,
                    ),
                    textfieldOption(
                        _registerUsernameController,
                        "Username",
                        "Enter your username",
                        Icons.person,
                        false,
                        false,
                        ref, (value) {
                      ref
                          .read(registerNotifierProvider.notifier)
                          .onNameChange(value);
                      print(value);
                    }),
                    textfieldOption(
                        _registerEmailController,
                        "Email",
                        "Enter your email adress",
                        Icons.person,
                        false,
                        false,
                        ref, (value) {
                      ref
                          .read(registerNotifierProvider.notifier)
                          .onEmailChange(value);
                      print(value);
                    }),
                    textfieldOption(
                        _registerPassController,
                        "Password",
                        "Enter your password",
                        Icons.lock,
                        false,
                        false,
                        ref, (value) {
                      ref
                          .read(registerNotifierProvider.notifier)
                          .onPasswordChange(value);
                      print(value);
                    }),
                    textfieldOption(
                        _registerRepeatPassController,
                        "Confirm password",
                        "Confirm your password",
                        Icons.lock,
                        false,
                        false,
                        ref, (value) {
                      ref
                          .read(registerNotifierProvider.notifier)
                          .onRePasswordChange(value);
                      print(value);
                    }),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const Text(
                          "By creating an account you have to agree with our Terms & conditions"),
                    ),
                    SignButton("Sign Up", () {
                      regControll.handleRegister();
                    }, const Color.fromARGB(255, 0, 9, 139), Colors.white)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
