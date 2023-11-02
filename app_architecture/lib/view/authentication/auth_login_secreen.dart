import 'package:app_architecture/constants/consts.dart';
import 'package:app_architecture/constants/lists.dart';
import 'package:app_architecture/view/controllers/auth_controller.dart';
import 'package:app_architecture/widgets/bg_widget.dart';
import 'package:app_architecture/widgets/gamelogo_widget.dart';
import 'package:flutter/material.dart';
import '../../constants/strings.dart';
import '../../widgets/buttons.dart';
import '../../widgets/texfield.dart';
import '../home/home.dart';
import 'auth_signup_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(AuthController());
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              gamelogoWidget(),
              10.heightBox,
              "Log in to $appName".text.fontFamily(bold).white.size(18).make(),
              15.heightBox,
              Column(
                children: [
                  customTextField(hint: emailHint, title: email, isPass: false, controller: controller.emailController),
                  customTextField(hint: passwordHint, title: password, isPass: true, controller: controller.passwordController),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () async{
                        await controller.loginMethod(context: context).then((value){
                          if(value!= null) {
                            VxToast.show(context, msg: loggedin);
                            Get.offAll(() => const Home());
                          }
                        });
                      },
                      child: forgetPassword.text.make(),
                    ),
                  ),
                  5.heightBox,
                  customButton(
                    color: purpleColor,
                    title: login,
                    textColor: textfieldGrey,
                    onPress: () {
                      Get.to(() => const Home());
                    },
                  ).box.width(context.screenWidth - 50).make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  customButton(
                    color: lightGrey,
                    title: signup,
                    textColor: lightpurple,
                    onPress: () {
                      Get.to(() => const SignupScreen());
                    },
                  ).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: lightGrey,
                        radius: 25,
                        child: Image.asset(socialIconList[index],
                        width: 30,),
                      ),
                    )),
                  ),
                ],
              ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make(),
            ],
          ),
        ),
      ),
    );
  }
}
