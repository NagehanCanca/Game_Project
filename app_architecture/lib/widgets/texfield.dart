import 'package:app_architecture/constants/colors.dart';
import 'package:app_architecture/constants/consts.dart';
import 'package:flutter/material.dart';

Widget customTextField({String? title,String? hint,controller,isPass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(purpleColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextField(
        obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            fontFamily: semibold,
            color: textfieldGrey,
          ),
          hintText: hint,
          isDense: true,
          fillColor: Colors.deepPurple.shade50,
          filled: true,
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: purpleColor,
            ),
          ),
        ),
      ),
      5.heightBox,
    ],
  );
}
