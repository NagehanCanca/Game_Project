import 'package:flutter/cupertino.dart';

import '../constants/images.dart';

Widget bgWidget({required Widget? child}) { // child parametresini ekledik
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(backGround),
        fit: BoxFit.fill,
      ),
    ),
    child: child, // child parametresini kullanıyoruz
  );
}
