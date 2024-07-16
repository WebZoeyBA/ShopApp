import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_ecommerce/pages/sign-in/sign-in-page.dart';

// ignore: must_be_immutable
class WelcomeMainWidget extends StatelessWidget {
  PageController? controller;
  String? imageUrl;
  String? title;
  String? paragraph;
  int? index = 0;
  void btnPress(int index, PageController controller) {
    print(index);
    controller.animateToPage(index,
        duration: const Duration(milliseconds: 650), curve: Curves.decelerate);
  }

  bool isContinue;
  //Widget? route;

  String? btnText;
  WelcomeMainWidget({
    super.key,
    this.controller,
    this.imageUrl,
    this.title,
    this.paragraph,
    this.index,
    this.btnText,
    required this.isContinue,
    //this.route
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('$imageUrl'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            '$title',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            '$paragraph',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => isContinue == true
                      ? Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()))
                      : btnPress(index!, controller!),
                  child: Text('$btnText'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
