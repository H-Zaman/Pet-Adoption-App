import 'package:flutter/material.dart';

class BottomNavButton extends StatelessWidget {
  final Function onTap;
  final IconData icon;
  final bool selected;
  BottomNavButton({
    required this.icon,
    required this.onTap,
    required this.selected,
});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: AnimatedContainer(
        duration: Duration(),
        height: 42,
        width: 42,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: selected ? Color(0xff861E3F) : Colors.transparent
        ),
        child: Center(
            child: Icon(
              icon,
              color: selected ? Colors.white : Color(0xff861E3F),
            )
        )
      ),
    );
  }
}
