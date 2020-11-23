import 'package:flutter/material.dart';

getGradient(Color color){
  return RadialGradient(
      radius: .1,
      colors: [
        color.withOpacity(.2),
        color.withOpacity(.1),
        // Colors.white,
      ]
  );
}