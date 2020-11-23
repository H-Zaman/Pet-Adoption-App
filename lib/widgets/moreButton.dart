import 'package:cat_adoption/resources/stringResources.dart';
import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  final Function onTap;
  const MoreButton({@required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xff861E3F),
            borderRadius: BorderRadius.circular(11111)
        ),
        padding: EdgeInsets.fromLTRB(17, 5, 14, 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              StringResources.btnList,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
              size: 24,
            )
          ],
        ),
      ),
    );
  }
}
