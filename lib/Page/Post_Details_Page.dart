import 'package:flutter/material.dart';

import '../Model/PostModel.dart';
import '../Services/allData.dart';

class PostDetailsPage extends StatefulWidget {
  PostModel postData;

  PostDetailsPage({required this.postData, super.key});

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: allData.bgColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.teal,
          title: Text("Details Post"),
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text("UserId",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),)
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text("${widget.postData.userId}",style: TextStyle(
                        fontSize: 18
                      ),)
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text("Id",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),)
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text("${widget.postData.id}",style: TextStyle(
                        fontSize: 18
                      ),)
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text("Title",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),)
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text("${widget.postData.title}",style: TextStyle(
                        fontSize: 18
                      ),)
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text("Body",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),)
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text("${widget.postData.body}",style: TextStyle(
                        fontSize: 18
                      ),)
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
