import 'package:cat_adoption/model/catModel.dart';
import 'package:cat_adoption/model/commentModel.dart';
import 'package:cat_adoption/resources/comments.dart';
import 'package:cat_adoption/resources/gradient.dart';
import 'package:cat_adoption/resources/stringResources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdoptTheCat extends StatelessWidget {
  final CatModel data;
  const AdoptTheCat({this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            child: Container(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Icon(
                      Icons.notifications_none,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 4,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff861E3F),
                          shape: BoxShape.circle
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          '2',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              height: AppBar().preferredSize.height,
              width: AppBar().preferredSize.height,
            ),
            itemBuilder: (_)=>[
              PopupMenuItem(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Notifications'),
                    IconButton(
                      onPressed: (){},
                      icon: Icon(
                      Icons.clear_all,
                      color: Colors.red,),
                    )
                  ],
                ),
                enabled: false,
              ),
              PopupMenuItem(
                child: Card(
                  elevation: 3,
                  child: Container(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'''
                        ,overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ),
                ),
              ),
              PopupMenuItem(
                child: Card(
                  elevation: 3,
                  child: Container(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'''
                        ,overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ),
                ),
              ),
              PopupMenuItem(
                child: Card(
                  elevation: 3,
                  child: Container(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'''
                        ,overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ),
                ),
              ),
              PopupMenuItem(
                child: Card(
                  elevation: 3,
                  child: Container(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'''
                        ,overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              child: Container(
                height: MediaQuery.of(context).size.height * .2,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: getGradient(data.color)
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                              color: Colors.green,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                                child: Text(
                                  'No Adoption Charge',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              color: Colors.green,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                                child: Text(
                                  'No Disability',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              data.name,
                              style: TextStyle(
                                fontSize: 32,
                                letterSpacing: 2,
                              ),
                            ),
                            Text(
                              data.age.toString() + ' years',
                              style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2,
                              ),
                            ),
                            Text(
                              data.location,
                              style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Hero(
                        tag: data.image,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            data.image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Card(
              elevation: 3,
              color: Color(0xffF5F8FA),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              child: Container(
                height: MediaQuery.of(context).size.height * .15,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Image.asset(
                            'assets/images/meeting.png'
                          ),
                        )
                      ),
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Meet Virtually',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff861E3F)
                                ),
                              ),
                              Text(
                                'Setup a time to talk with the cat\'s current owner virtually',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff861E3F).withOpacity(.7)
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                      Icon(
                        CupertinoIcons.ellipsis_vertical,
                        color: Color(0xff861E3F),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Comments',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10,),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              child: Container(
                height: MediaQuery.of(context).size.height * .37,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: comments.length,
                    itemBuilder: (_,index){
                      CommentModel comment = comments[index];
                      return Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                comment.name,
                                style: TextStyle(
                                  color: Color(0xff861E3F),
                                  fontSize: 18
                                ),
                              ),
                              Text(
                                comment.date,
                                style: TextStyle(
                                  color: Color(0xff861E3F).withOpacity(.7),
                                  fontSize: 12
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text(
                            comment.comment
                          )
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
