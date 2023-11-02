import 'package:app_architecture/view/authentication/auth_login_secreen.dart';
import 'package:app_architecture/view/controllers/account_controller.dart';
import 'package:app_architecture/view/pages/account_screen/edit_account_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:app_architecture/constants/consts.dart';
import 'package:app_architecture/constants/lists.dart';
import 'package:app_architecture/view/controllers/auth_controller.dart';
import 'package:app_architecture/view/pages/account_screen/components/details_card.dart';
import 'package:app_architecture/widgets/bg_widget.dart';
import 'package:flutter/material.dart';
import '../../../services/firestore_services.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return bgWidget(
      child: Scaffold(
        body: SingleChildScrollView(
          child: StreamBuilder(
            stream: FirestorServices.getUser(currentUser?.uid),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(purpleColor),
                  ),
                );
              } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                var data = snapshot.data!.docs[0];
                return SafeArea(
                  child: Column(
                    children: [
                      // Edit profile button
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Align(
                          alignment: Alignment.topRight,
                          child: Icon(Icons.edit, color: Colors.white),
                        ).onTap(() {
                          controller.nameController.text = data['name'];
                          controller.passController.text = data['password'];

                          Get.to(() => EditProfileScreen(
                            data: data,
                          ));
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            data['imageUrl'] == ''
                                ? Image.asset(imgProfile1,
                                width: 100, fit: BoxFit.cover)
                                .box
                                .roundedFull
                                .clip(Clip.antiAlias)
                                .make()
                                : Image.network(data['imageUrl'],
                                width: 100, fit: BoxFit.cover)
                                .box
                                .roundedFull
                                .clip(Clip.antiAlias)
                                .make(),
                            10.heightBox,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "${data['name']}"
                                      .text
                                      .fontFamily(semibold)
                                      .white
                                      .make(),
                                  "${data['email']}".text.white.make(),
                                ],
                              ),
                            ),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () async {
                                await Get.put(AuthController())
                                    .signoutMethod(context);
                                Get.offAll(() => const LoginScreen());
                              },
                              child:
                              logout.text.fontFamily(semibold).white.make(),
                            )
                          ],
                        ),
                      ),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          detailsCard(
                              count: data['limits'],
                              title: "in your limits",
                              width: context.screenWidth / 3.4),
                          detailsCard(
                              count: data['number_chapters'],
                              title: "number of chapters you passed",
                              width: context.screenWidth / 3.4),
                        ],
                      ),
                      // Button section
                      ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: lightpurple,
                          );
                        },
                        itemCount: settingsButtons.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Image.asset(
                              settingsIcons[index],
                              width: 33,
                            ),
                            title: settingsButtons[index]
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                          );
                        },
                      )
                          .box
                          .white
                          .rounded
                          .margin(const EdgeInsets.all(12))
                          .padding(const EdgeInsets.symmetric(horizontal: 16))
                          .shadowSm
                          .make(),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: Text('User data not available'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
