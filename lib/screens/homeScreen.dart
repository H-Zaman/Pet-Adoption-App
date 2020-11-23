import 'dart:math';

import 'package:cat_adoption/model/catModel.dart';
import 'package:cat_adoption/resources/catData.dart';
import 'package:cat_adoption/resources/gradient.dart';
import 'package:cat_adoption/resources/stringResources.dart';
import 'package:cat_adoption/screens/detailsScreen.dart';
import 'package:cat_adoption/widgets/bottomNavButton.dart';
import 'package:cat_adoption/widgets/moreButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String selected = 'home';

  @override
  Widget build(BuildContext context) {
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
          horizontalSuggestionList(),
          bottomNav(),
          SizedBox(height: 10,)
        ],
      ),
    );
  }

  Widget horizontalCatList(){
    return Container(
      height: MediaQuery.of(context).size.height * .4,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (_, index){
          CatModel catModel = cats[index];
          return catItem(catModel);
        },
      ),
    );
  }

  Widget catItem(CatModel cat){
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 4,
        child: Container(
          width: MediaQuery.of(context).size.width * .55,
          height: MediaQuery.of(context).size.height * .4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: getGradient(cat.color)
          ),
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                  ),
                  child: Hero(
                    tag: cat.image,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(cat.image,fit: BoxFit.contain,width: MediaQuery.of(context).size.width * .55,),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          cat.name,
                          style: TextStyle(
                            fontSize: 24
                          ),
                        ),
                        Text(
                          ' ${cat.age} years',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500]
                          ),
                        ),
                      ],
                    ),
                    MoreButton(onTap: () => getToDetailsPage(cat))
                  ],
                ),
              ),
            ],
          ),
        ),
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
        itemBuilder: (_, index){
          CatModel catModel = cats[(cats.length-1)-index];
          return catItemSuggestion(catModel);
        },
      ),
    );
  }

  Widget catItemSuggestion(CatModel cat){
    return GestureDetector(
      onTap: () => getToDetailsPage(cat),
      child: Hero(
        tag: cat.image,
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            elevation: 4,
            child: Container(
              width: MediaQuery.of(context).size.width * .3,
              height: MediaQuery.of(context).size.height * .3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: getGradient(cat.color)
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(cat.image,fit: BoxFit.contain,width: MediaQuery.of(context).size.width * .2,),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomNav(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1111)),
        child: Container(
          height: 55,
          width: 230,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedContainer(
                duration: Duration(),
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: selected == 'message' ? Color(0xff861E3F).withOpacity(.3) : Colors.transparent
                ),
                child: BottomNavButton(
                  icon: Icons.email_outlined,
                  onTap: (){
                    setState(() {
                      selected = 'message';
                    });
                  },
                ),
              ),
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: selected == 'home' ? Color(0xff861E3F).withOpacity(.3) : Colors.transparent
                ),
                child: BottomNavButton(
                  icon: Icons.home_outlined,
                  onTap: (){
                    setState(() {
                      selected = 'home';
                    });
                  }
                ),
              ),
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: selected == 'settings' ? Color(0xff861E3F).withOpacity(.3) : Colors.transparent
                ),
                child: BottomNavButton(
                  icon: Icons.settings,
                  onTap: (){
                    setState(() {
                      selected = 'settings';
                    });
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  getToDetailsPage(CatModel cat){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(data: cat)));
  }
}