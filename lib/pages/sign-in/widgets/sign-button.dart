import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SignButton extends StatelessWidget {
  SignButton(this.btnText, this.btnClick, this.btnColor, this.btnTextColor,
      {super.key});
  String btnText;
  void Function()? btnClick;
  Color btnColor;
  Color btnTextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextButton(
        onPressed: btnClick,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)))),
            elevation: MaterialStateProperty.all(1),
            backgroundColor: MaterialStateProperty.all(btnColor),
            shadowColor: MaterialStateProperty.all(btnTextColor),
            foregroundColor: MaterialStateProperty.all(btnTextColor),
            textStyle: MaterialStateProperty.all(
                const TextStyle(fontWeight: FontWeight.w500))),
        child: Text(btnText),
      ),
    );
  }
}
