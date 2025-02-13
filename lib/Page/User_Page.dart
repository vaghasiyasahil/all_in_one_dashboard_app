import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/UserModel.dart';
import '../Services/allData.dart';
import 'Albums_Page.dart';
import 'Home_Page.dart';
import 'Posts_Page.dart';
import 'Todos_Page.dart';
import 'User_Details_Page.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: allData.bgColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Colors.teal,
        title: Text("User List"),
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
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetailsPage(userData: snapshot.data![index]),));
                    },
                    leading: Icon(Icons.account_circle),
                    title: Text("${snapshot.data![index].name}",maxLines: 1,),
                    subtitle: Text("${snapshot.data![index].email}",maxLines: 1,),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<UserModel>> getData() async {
    var url=Uri.parse("https://jsonplaceholder.typicode.com/users");
    var response=await http.get(url);
    List tempData=jsonDecode(response.body);
    return tempData.map((e) => UserModel.fromJson(e),).toList();
  }
}
