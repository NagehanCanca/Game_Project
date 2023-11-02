
import 'package:app_architecture/constants/consts.dart';
import 'package:flutter/material.dart';

Widget gamelogoWidget() {

  return Image.asset(gameLogo).box.white.size(77, 77).padding(const EdgeInsets.all(8)).rounded.make();
}