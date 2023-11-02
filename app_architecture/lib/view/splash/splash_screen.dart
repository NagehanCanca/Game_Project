import 'package:app_architecture/constants/strings.dart';
import 'package:app_architecture/view/authentication/auth_login_secreen.dart';
import 'package:app_architecture/widgets/gamelogo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/consts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  chanceScreen() {
    Future.delayed(const Duration(seconds: 7), () {
      Get.to(() => const LoginScreen());
    });
  }

  @override
  void initState() {
    chanceScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Stack, ekrana sığacak şekilde genişler
        children: <Widget>[
          Image.asset(backGround,
            fit: BoxFit.cover, // Resmi ekranı kaplayacak şekilde boyutlandırır
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                40.heightBox,
                gamelogoWidget(),
                30.heightBox,
                appName.text.fontFamily(bold).size(42).white.make(),
                20.heightBox,
                appversion.text.white.make(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
