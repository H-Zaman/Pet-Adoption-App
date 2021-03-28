import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cat_adoption/resources/color.dart';
import 'package:cat_adoption/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'screens/mainScreen.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this)..addListener(() {
      if(_controller.isCompleted){
        Get.offAll(()=>MainScreen());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe7e7e7),
      body: Stack(
        children: [
          Center(
            child: Lottie.asset(
              'assets/lottie/cat-woow.json',
              controller: _controller,
              onLoaded: (composition) {
                // Configure the AnimationController with the duration of the
                // Lottie file and start the animation.
                _controller
                  ..duration = composition.duration
                  ..forward();
              },
            ),
          ),


          Positioned(
            top: 100,
            left: 32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TyperAnimatedText(
                      'Welcome to',
                      speed: Duration(milliseconds: 90),
                      textStyle: TextStyle(
                        fontSize: 36,
                        color: AppColor.dark,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ],
                ),
                AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TyperAnimatedText(
                      'PETS',
                      speed: Duration(milliseconds: 90),
                      textStyle: TextStyle(
                        fontSize: 42,
                        color: AppColor.dark,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
