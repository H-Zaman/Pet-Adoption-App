import 'package:cat_adoption/resources/color.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            color: Color(0xffFFFDEB),
            width: double.infinity,
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColor.dark,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                Spacer(),

                CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://i.ibb.co/wWPFGSd/javier-reyes-qi2c-D5o-R-f-E-unsplash.jpg'
                    )
                ),

                Spacer(),
              ],
            )
          ),
        ),
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
            child: ListView(
              children: [

                Text(
                  'Basic Information',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold
                  ),
                ),

                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                      Text(
                        'Hasib',
                        style: TextStyle(
                          color: Colors.black.withOpacity(.6)
                        ),
                      ),
                    ],
                  ),
                  children: [
                    TextFormField(
                      initialValue: 'Hasib',
                    )
                  ],
                ),

                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Gender',
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                      Text(
                        'Male',
                        style: TextStyle(
                          color: Colors.black.withOpacity(.6)
                        ),
                      ),
                    ],
                  ),
                  children: [
                    TextFormField(
                      initialValue: 'Male',
                    )
                  ],
                ),

                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                      Text(
                        'BD',
                        style: TextStyle(
                          color: Colors.black.withOpacity(.6)
                        ),
                      ),
                    ],
                  ),
                  children: [
                    TextFormField(
                      initialValue: 'Bangladesh',
                    )
                  ],
                ),

                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                      Text(
                        'hzamantaz',
                        style: TextStyle(
                          color: Colors.black.withOpacity(.6)
                        ),
                      ),
                    ],
                  ),
                  children: [
                    TextFormField(
                      initialValue: 'hzamantaz@gmailcom',
                    )
                  ],
                ),

                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                  children: [
                    TextFormField(
                      initialValue: '*******',
                    )
                  ],
                ),

              ],
            ),
          )
        ),
      ],
    );
  }
}
