import 'package:flutter/material.dart';

import '../Services/allData.dart';
import 'Albums_Page.dart';
import 'Comments_Page.dart';
import 'Photos_Page.dart';
import 'Posts_Page.dart';
import 'Products_Page.dart';
import 'Todos_Page.dart';
import 'User_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
int selectItem=0;
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: allData.bgColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.teal,
          title: Text("All In One DashBoard"),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: GridView.builder(
              itemCount: 7,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if(index==0){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PostsPage(),));
                    }else if(index==1){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CommentsPage(),));
                    }else if(index==2){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AlbumsPage(),));
                    }else if(index==3){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PhotosPage(),));
                    }else if(index==4){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TodosPage(),));
                    }else if(index==5){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserPage(),));
                    }else if(index==6){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsPage(),));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.teal.shade200,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10)
                      )
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10)
                                )
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                              child: Image.asset(
                                "${allData.imagePath}${allData.imageList[index]}",
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "${allData.imageList[index].split(".")[0]}",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
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
      ),
    );
  }
}
