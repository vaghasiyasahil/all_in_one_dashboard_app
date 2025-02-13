import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/CommentsModel.dart';
import '../Services/allData.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: allData.bgColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Colors.teal,
        title: Text("Comments"),
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: Colors.teal,
                backgroundColor: Colors.teal.shade200,
              ),
            );
          }else if(!snapshot.hasData){
            return Center(
              child: Text("Not Post Found",textAlign: TextAlign.center,style: TextStyle(fontSize: 30,color: Colors.teal,fontWeight: FontWeight.bold),),
            );
          }else if(snapshot.hasError){
            return Center(
              child: Text("Something went wrong.",textAlign: TextAlign.center,style: TextStyle(fontSize: 30,color: Colors.teal,fontWeight: FontWeight.bold),),
            );
          }else{
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.teal.shade100,
                      borderRadius: BorderRadius.all(Radius.circular(7))
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.account_circle),
                        title: Text("${snapshot.data![index].name}"),
                        subtitle: Text("${snapshot.data![index].email}"),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        margin: EdgeInsets.all(10),
                        child: Text("${snapshot.data![index].body}",)
                      )
                    ],
                  )
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<CommentsModel>> getData() async {
    var url=Uri.parse("https://jsonplaceholder.typicode.com/comments");
    var response=await http.get(url);
    List tempData=jsonDecode(response.body);
    return tempData.map((e) => CommentsModel.fromJson(e),).toList();
  }
}
