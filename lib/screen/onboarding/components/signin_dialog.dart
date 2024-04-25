import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'signin_form.dart';
//import 'package:rive_animation/screen/onboding/components/sign_in_form.dart';


Future<Object?> CustomSigninDialog(BuildContext context) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: "Sign-In",
    context: context,
    //TRansition after button is press our SIGN UP PAGE WILL COME DOWN
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (_, animation, __, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) => Center(
      child: Container(
        height: 620,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          // vertical: 15,
        ),
        padding: const EdgeInsets.only(top: 15, left: 24, right: 24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.92),
          borderRadius: const BorderRadius.all(Radius.circular(40)),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              Stack(
                clipBehavior: Clip
                    .none, //takes out the boundaries (we had bug our X icon was hiding behing it)
                children: [
                  Column(
                    children: [
                      const Text(
                        "Sign In",
                        style: TextStyle(fontSize: 34, fontFamily: "poppins"),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          "Welcome to Zen Health",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SignInForm(),
                      const Row(
                        children: [
                          Expanded(child: Divider()),
                          Text(
                            "OR",
                            style: TextStyle(color: Colors.black26),
                          ),
                          Expanded(child: Divider()), //Bings a line on SCREEN
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Text(
                          "Sign-up with Email , Apple or Google",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/email_box.svg",
                              height: 64,
                              width: 64,
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/apple_box.svg",
                              height: 64,
                              width: 64,
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/google_box.svg",
                              height: 64,
                              width: 64,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  //this is cross buttn for sign up
                  const Positioned(
                    left: 0,
                    right: 10,
                    bottom: 10,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
