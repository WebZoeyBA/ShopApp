import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_ecommerce/pages/welcome/notifiers/welcome_notifier.dart';
import 'package:riverpod_ecommerce/pages/welcome/widgets/main_welcome_widget.dart';

//final indexProvider = StateProvider<int>((ref) => 0);

class WelcomePage extends ConsumerWidget {
  WelcomePage({super.key});

  final PageController _controller = PageController();
  //int dotsIndex = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                onPageChanged: (value) {
                  //dotsIndex = value;
                  //print(dotsIndex);
                  ref.read(indexDotProvider.notifier).changeValue(value);
                },
                controller: _controller,
                padEnds: false,
                children: [
                  WelcomeMainWidget(
                    controller: _controller,
                    title: "First see learning",
                    paragraph:
                        "Forget about paper, all knowledge in one learning",
                    index: 1,
                    imageUrl: 'assets/images/learning.png',
                    btnText: "Next",
                    isContinue: false,
                  ),
                  WelcomeMainWidget(
                    controller: _controller,
                    title: "Connect with everyone",
                    imageUrl: 'assets/images/connection.png',
                    paragraph:
                        "Always keep in touch with your tutor and friends",
                    index: 2,
                    btnText: "Next",
                    isContinue: false,
                  ),
                  WelcomeMainWidget(
                    title: "Always fascinated learning",
                    imageUrl: 'assets/images/exciting.png',
                    paragraph: "Anywhere, anytime. Time is at your discretion",
                    index: 3,
                    btnText: "Continue",
                    isContinue: true,
                  ),
                ],
              ),
              Positioned(
                bottom: 50,
                child: DotsIndicator(
                  position: index,
                  mainAxisAlignment: MainAxisAlignment.center,
                  dotsCount: 3,
                  decorator: const DotsDecorator(
                      color: Colors.grey, activeColor: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
