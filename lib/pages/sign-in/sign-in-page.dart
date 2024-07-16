import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_ecommerce/pages/home/homepage.dart';
import 'package:riverpod_ecommerce/pages/register/register-page.dart';
import 'package:riverpod_ecommerce/pages/sign-in/notifiers/passwordfield-notifier.dart';
import 'package:riverpod_ecommerce/pages/sign-in/widgets/sign-button.dart';
import 'package:riverpod_ecommerce/pages/sign-in/widgets/signin-appbar.dart';
import 'package:riverpod_ecommerce/pages/sign-in/widgets/signin-loginoptions.dart';
import 'package:riverpod_ecommerce/pages/welcome/welcome_page.dart';

class SignIn extends ConsumerWidget {
  SignIn({super.key});

  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void btnClick(context, route) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => route));
    }

    // final obscureState = ref.watch(passwordVisibilityControlProvider);
    return Container(
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: signInAppBar(),
            backgroundColor: Colors.white,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                textfieldOption(_emailcontroller, "E-mail", "Enter your email",
                    Icons.person, false, false, ref, (value) {
                  print(value);
                }),
                textfieldOption(
                    _passwordcontroller,
                    "Password",
                    "Enter your password",
                    Icons.lock,
                    true,
                    ref.watch(passwordVisibilityControlProvider),
                    ref, (value) {
                  print(value);
                }),
                const Text("Forgot password?"),
                const Center(child: Text("Or use third-party login option")),
                Center(
                  child: thirdPartyLogin(context),
                ),
                SignButton(
                  "Log in",
                  () {},
                  Colors.white,
                  const Color.fromARGB(255, 0, 9, 139),
                ),
                SignButton("Sign up", () {
                  btnClick(context, RegisterPage());
                }, const Color.fromARGB(255, 0, 9, 139), Colors.white),
              ],
            ),
          ),
        ));
  }
}
