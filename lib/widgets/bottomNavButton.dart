import 'package:flutter/material.dart';

class BottomNavButton extends StatelessWidget {
  final Function onTap;
  final IconData icon;
  BottomNavButton({
    @required this.icon,
    @required this.onTap,
});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Icon(
          icon,
          color: Color(0xff861E3F),
        )
      ),
    );
  }
}
