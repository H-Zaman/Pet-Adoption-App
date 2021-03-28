import 'package:cat_adoption/model/catModel.dart';
import 'package:cat_adoption/resources/gradient.dart';
import 'package:cat_adoption/screens/detailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatHorizontalListTile extends StatelessWidget {
  final CatModel cat;

  const CatHorizontalListTile({Key? key,required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(()=>DetailsScreen(data: cat)),
      child: Hero(
        tag: cat.image!,
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
                  gradient: getGradient(cat.color!)
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(cat.image!,fit: BoxFit.contain,width: MediaQuery.of(context).size.width * .2,),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
