import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_ecommerce/pages/sign-in/notifiers/passwordfield-notifier.dart';

Widget thirdPartyLogin(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      GestureDetector(
          onTap: () {},
          child: thirdPartyIcon(
              const Color.fromARGB(255, 0, 76, 139), Icons.facebook, context)),
      GestureDetector(
          onTap: () {},
          child: thirdPartyIcon(Colors.grey, Icons.apple, context)),
      GestureDetector(
          onTap: () {},
          child: thirdPartyIcon(Colors.red, Icons.g_mobiledata, context)),
    ],
  );
}

thirdPartyIcon(Color color, IconData iconName, context) {
  return Container(
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromARGB(255, 214, 209, 209), width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(100))),
    child: Icon(
      iconName,
      color: color,
      size: MediaQuery.of(context).size.width * 0.08,
    ),
  );
}

Column textfieldOption(
  TextEditingController controller,
  String labelText,
  String hintText,
  IconData icon,
  bool password,
  bool isObscure,
  WidgetRef ref,
  void Function(String value)? func,
) {
  final obscureState = ref.watch(passwordVisibilityControlProvider);
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(labelText),
      Container(
        margin: const EdgeInsets.only(top: 10),
        height: 50,
        width: 325,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: const Color.fromARGB(255, 214, 209, 209),
            )),
        child: TextField(
          obscureText: isObscure,
          controller: controller,
          onChanged: (value) => func!(value),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(icon),
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14),
            suffixIcon: password
                ? GestureDetector(
                    child: Icon(
                      Icons.visibility,
                      color: obscureState == true ? Colors.grey : Colors.black,
                    ),
                    onTap: () => ref
                        .read(passwordVisibilityControlProvider.notifier)
                        .toggleVisibility())
                : null,
          ),
        ),
      ),
    ],
  );
}
