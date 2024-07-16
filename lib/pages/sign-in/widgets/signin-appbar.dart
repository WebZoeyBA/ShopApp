import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_ecommerce/text-widgets/title-text-widget.dart';

AppBar signInAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: const Color.fromARGB(255, 214, 209, 209),
        height: 1,
      ),
    ),
    title: text16Normal("Log In", Colors.black),
  );
}
