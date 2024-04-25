import 'dart:ui';
import 'package:rive/rive.dart';

import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/animated_button.dart';
import 'components/animated_button2.dart';
import 'components/signin_dialog.dart';
//import 'package:zen_health/screens/onboding/components/sign_in_form.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  //button's Animation
  late RiveAnimationController _btnAnimationController;
  late RiveAnimationController _btnAnimationController2;
  @override
  void initState() {
    _btnAnimationController2 = OneShotAnimation(
      "active",
      autoplay: true,
    );
    super.initState();

    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay:
          true, //once we start Apllication the button used to auto-play, making it false this stosps it
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //
      body: Stack(
        children: [
          //this is BACKGROUND
          Center(
            child: Positioned(
              height: 100,
              width: MediaQuery.of(context).size.width * 1.7,
              bottom: 200,
              left: 100,
              child: Image.asset('assets/Backgrounds/Spline.png'),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          //this is TEXT
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      const SizedBox(
                        width: 280,
                        child: Column(
                          children: [
                            Text(
                              "hola!\nto\nZen Health",
                              style: TextStyle(
                                fontSize: 50,
                                fontFamily: 'Poppins',
                                height: 1.2,
                              ),
                            ),
                            SizedBox(height: 29),
                            Text(
                                "Zen Health invites you to discover mindfulness and self-care.Experience peace and balance like never before.\nStart a journey for a healthier and happier you today",
                                style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      ),

                      const Spacer(
                          //flex: 2,
                          ),
                      AnimatedBtn2(
                        btnAnimationController2: _btnAnimationController2,
                        press: () {
                          _btnAnimationController2.isActive = true;
                          Future.delayed(
                            //shows DELAY after our BUTTONS ANIMATION
                            Duration(milliseconds: 800),
                            () {
                              final url = Uri.parse(
                                  "https://www.sih.gov.in/sih2023PS?technology_bucket=QWxs&category=U29mdHdhcmU=&organization=QWxs&organization_type=QWxs");
                              launchUrl(url, mode: LaunchMode.inAppWebView);
                            },
                          );
                        },
                      ),

                      /* Container(
                        height: 64,
                        width: 260,
                        child:
                            RiveAnimation.asset('assets/RiveAssets/button.riv'),
                      ),*/
                      SizedBox(height: 15),
                      //this is Animated Button
                      AnimatedBtn(
                        btnAnimationController: _btnAnimationController,
                        press: () {
                          _btnAnimationController.isActive = true;
                          Future.delayed(
                            //shows DELAY after our BUTTONS ANIMATION
                            Duration(milliseconds: 800),
                            () {
                              CustomSigninDialog(context);
                            },
                          );
                        },
                      ),
                      SizedBox(height: 35)
                    ],
                  ),
                  /* Positioned(
                    left: 45,
                    bottom: 121,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color?>(
                            Colors.transparent),
                      ),
                      onPressed: () {
                        final url = Uri.parse("http://localhost:52095/");
                        launchUrl(url, mode: LaunchMode.inAppWebView);
                      },
                      child: Row(
                        children: [
                          Icon(CupertinoIcons.arrow_right, color: Colors.black),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Register as HELPER",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
