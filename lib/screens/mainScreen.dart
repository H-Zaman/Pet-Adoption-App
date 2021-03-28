import 'package:cat_adoption/widgets/bottomNavButton.dart';
import 'package:cat_adoption/widgets/fadeStack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'messagesScreen.dart';
import 'homeScreen.dart';
import 'profileScreen.dart';

class MainScreen extends StatelessWidget {
  static RxInt _navIndex = 1.obs;
  static changeIndex(int index) => _navIndex.value = index;
  @override
  Widget build(BuildContext context) {

    _buildBody (){
      return Expanded(
        child: FadeIndexedStack(
          index: _navIndex.value,
          children: [
            MessageScreen(),
            HomeScreen(),
            ProfileScreen()
          ],
        ),
      );
    }

    _buildBottomNav(){
      return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1111)),
            child: Container(
              height: 55,
              width: Get.width * .55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavButton(
                    icon: _navIndex.value == 0 ? CupertinoIcons.mail_solid : CupertinoIcons.mail,
                    selected: _navIndex.value == 0,
                    onTap: (){
                      if(_navIndex.value != 0){
                        changeIndex(0);
                      }
                    },
                  ),
                  BottomNavButton(
                    icon: _navIndex.value == 1 ? CupertinoIcons.house_fill : CupertinoIcons.house,
                    selected: _navIndex.value == 1,
                    onTap: (){
                      if(_navIndex.value != 1){
                        changeIndex(1);
                      }
                    },
                  ),
                  BottomNavButton(
                    icon: _navIndex.value == 2 ? CupertinoIcons.person_alt : CupertinoIcons.person,
                    selected: _navIndex.value == 2,
                    onTap: (){
                      if(_navIndex.value != 2){
                        changeIndex(2);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Obx(()=>Column(
          children: [
            _buildBody(),
            _buildBottomNav()
          ],
        )),
      ),
    );
  }
}