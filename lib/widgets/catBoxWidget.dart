import 'package:cat_adoption/model/catModel.dart';
import 'package:cat_adoption/resources/gradient.dart';
import 'package:cat_adoption/screens/detailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'moreButton.dart';

class CatBoxWidget extends StatelessWidget {
  final CatModel cat;

  const CatBoxWidget({Key? key,required this.cat}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
              gradient: getGradient(cat.color!)
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
                    tag: cat.image!,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(cat.image!,fit: BoxFit.contain,width: MediaQuery.of(context).size.width * .55,),
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
                          cat.name!,
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
                    MoreButton(onTap: () => Get.to(()=>DetailsScreen(data: cat)))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
