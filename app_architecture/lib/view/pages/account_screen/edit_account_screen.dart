import 'dart:io';
import 'package:app_architecture/constants/consts.dart';
import 'package:app_architecture/view/controllers/account_controller.dart';
import 'package:app_architecture/widgets/bg_widget.dart';
import 'package:app_architecture/widgets/buttons.dart';
import 'package:app_architecture/widgets/texfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;

  const EditProfileScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    controller.nameController.text = data['name'];

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                  ? Image.asset(imgProfile1, width: 100, fit: BoxFit.cover)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make()
                  : data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                      ? Image.network(
                          data['imageUrl'],
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make()
                      : Image.file(
                          File(controller.profileImgPath.value),
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              customButton(
                  color: purpleColor,
                  onPress: () {
                    controller.changeImage(context);
                  },
                  textColor: Colors.white,
                  title: "Change"),
              const Divider(),
              20.heightBox,
              customTextField(
                  controller: controller.nameController,
                  hint: nameHint,
                  title: name,
                  isPass: false),
              customTextField(
                  controller: controller.passController,
                  hint: password,
                  title: password,
                  isPass: true),
              20.heightBox,
              controller.isloading.value
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(purpleColor),
                    )
                  : SizedBox(
                      width: context.screenWidth - 60,
                      child: customButton(
                          color: purpleColor,
                          onPress: () async {
                            controller.isloading(true);

                            await controller.updateProfile(
                              imgUrl: controller.profileImageLink,
                              name: controller.nameController.text,
                              password: controller.passController.text,
                              context: context,
                            );

                            VxToast.show(context, msg: "Updated");
                          },
                          textColor: Colors.white,
                          title: "Save"),
                    ),
            ],
          )
              .box
              .white
              .shadowSm
              .padding(const EdgeInsets.all(16))
              .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
              .rounded
              .make(),
        ),
      ),
    );
  }
}
