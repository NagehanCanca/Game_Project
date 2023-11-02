import 'dart:io';

import 'package:app_architecture/constants/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileController extends GetxController {
  var profileImgPath = ''.obs;
  var profileImageLink = '';
  var isloading = false.obs;

  var nameController = TextEditingController();
  var passController = TextEditingController();

  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      profileImgPath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }


  uploadProfileImage() async {
    var filename = basename(profileImgPath.value);
    var destination = 'images/${FirebaseAuth.instance.currentUser!.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImgPath.value));
    profileImageLink = await ref.getDownloadURL();
  }

  updateProfile({String? name, String? password, String? imgUrl, BuildContext? context}) async {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      VxToast.show(context!, msg: "Oturum açmış bir kullanıcı bulunamadı.");
      return;
    }

    var store = FirebaseFirestore.instance.collection(userCollection).doc(user.uid);
    await store.set({
      'name': name,
      'password': password,
      'imageUrl': imgUrl
    }, SetOptions(merge: true));
    isloading(false);
  }


}
