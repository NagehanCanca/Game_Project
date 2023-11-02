import 'package:flutter/material.dart';

import '../constants/consts.dart';

Widget customButton({onPress, color, textColor, String? title}) { // customButton olarak adlandırdık
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color,
      padding: const EdgeInsets.all(12),
    ),
    onPressed: onPress,
    child: title!.text.color(textColor).fontFamily(bold).make(),
  );
}
