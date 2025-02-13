import 'dart:convert';
import 'package:flutter/material.dart';
import '../Model/TodoModel.dart';
import '../Services/allData.dart';
import 'Albums_Page.dart';
import 'Home_Page.dart';
import 'Posts_Page.dart';
import 'package:http/http.dart' as http;

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: allData.bgColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Colors.teal,
        title: Text("To Do List"),
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
                    },
                    leading: Icon(Icons.task),
                    title: Text("${snapshot.data![index].title}",maxLines: 1,),
                    trailing: Switch(
                      activeColor: Colors.teal,
                      value: snapshot.data![index].completed!,
                      onChanged: (value) {

                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectItem,
        onTap: (value) {
          selectItem=value;
          setState(() {});
          if(value==0){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
          }else if(value==1){
            Navigator.push(context, MaterialPageRoute(builder: (context) => PostsPage(),));
          }else if(value==2){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AlbumsPage(),));
          }else if(value==3){
            Navigator.push(context, MaterialPageRoute(builder: (context) => TodosPage(),));
          }
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.teal,
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.teal,
            icon: Icon(Icons.post_add),
            label: 'Posts',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.teal,
            icon: Icon(Icons.photo_sharp),
            label: 'Photos',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.teal,
            icon: Icon(Icons.task),
            label: 'Todos',
          ),
        ],
      ),
    );
  }

  Future<List<TodoModel>> getData() async {
    var url=Uri.parse("https://jsonplaceholder.typicode.com/todos");
    var response=await http.get(url);
    List tempData=jsonDecode(response.body);
    return tempData.map((e) => TodoModel.fromJson(e),).toList();
  }
}
