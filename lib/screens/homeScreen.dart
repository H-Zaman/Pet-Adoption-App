import 'package:cat_adoption/model/catModel.dart';
import 'package:cat_adoption/resources/catData.dart';
import 'package:cat_adoption/resources/gradient.dart';
import 'package:cat_adoption/resources/stringResources.dart';
import 'package:cat_adoption/screens/detailsScreen.dart';
import 'package:cat_adoption/widgets/bottomNavButton.dart';
import 'package:cat_adoption/widgets/catBoxWidget.dart';
import 'package:cat_adoption/widgets/catHorizontalListTile.dart';
import 'package:cat_adoption/widgets/moreButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget horizontalCatList(){
      return Container(
        height: MediaQuery.of(context).size.height * .4,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (_, index) => CatBoxWidget(cat: cats[index])
        ),
      );
    }

    Widget horizontalSuggestionList(){
      return Container(
        height: MediaQuery.of(context).size.height * .22,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (_, index) => CatHorizontalListTile(cat: cats[(cats.length-1)-index])
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: RichText(
            text: TextSpan(
                text: StringResources.homeHeaderStart,
                style: TextStyle(
                    color: Color(0xff251E3F).withOpacity(.9),
                    fontSize: 36,
                    fontFamily: 'Circe'
                ),
                children: [
                  TextSpan(
                    text: StringResources.homeHeaderEnd,
                    style: TextStyle(
                        color: Color(0xff861E3F),
                        fontSize: 36
                    ),
                  ),
                  TextSpan(
                    text: '!',
                    style: TextStyle(
                        color: Color(0xff251E3F).withOpacity(.9),
                        fontSize: 36
                    ),
                  ),
                ]
            )
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              StringResources.homeSubtitle,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[500]
              ),
            ),
          ),
          horizontalCatList(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              StringResources.homeListTitle,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          horizontalSuggestionList()
        ],
      ),
    );
  }


}
