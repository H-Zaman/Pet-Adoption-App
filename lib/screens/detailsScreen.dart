import 'package:cat_adoption/model/catModel.dart';
import 'package:cat_adoption/resources/gradient.dart';
import 'package:cat_adoption/resources/stringResources.dart';
import 'package:cat_adoption/screens/adoptionScreen.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final CatModel data;
  const DetailsScreen({this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: getGradient(data.color)
        ),
        child: Column(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width,),
            Expanded(
              flex: 65,
              child: Column(
                children: [
                  SizedBox(height: AppBar().preferredSize.height,),
                  Expanded(
                    child: Hero(
                      tag: data.image,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          data.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 35,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          data.name,
                          style: TextStyle(
                              fontSize: 42,
                              letterSpacing: 2
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              data.age.toString() + ' years',
                              style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 1.5
                              ),
                            ),
                            Text(
                              data.location,
                              style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 1.5
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 7,),
                    Text(
                      '''She is a delight, 100% kitten. Amori lives to play!  She can turn anything into a cat toy, but her favorites are the ones that roll along the floor so she can run after them. She loves to jump up and catch toys that have been thrown up against the wall. Amori will carry her favorite toys around with her, only putting them down  while she eats or sleeps. ''',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500]
                      ),
                    ),
                    Spacer(),
                    FlatButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AdoptTheCat(data: data)));
                      },
                      color: Color(0xff861E3F),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1111111)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                        child: Text(
                          StringResources.btnAdopt,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
