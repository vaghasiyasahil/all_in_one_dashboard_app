import 'package:flutter/material.dart';
import '../Model/UserModel.dart';
import '../Services/allData.dart';

class UserDetailsPage extends StatefulWidget {
  UserModel userData;
  UserDetailsPage({required this.userData,super.key});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(30),
                child: Column(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.account_circle,size: 70,color: Colors.teal,),
                      radius: 60,
                    ),
                    Text(
                        "${widget.userData.username}",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold
                      ),
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
                        child: Text("Name",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),)
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text("${widget.userData.name}",style: TextStyle(
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
                        child: Text("Email",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),)
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text("${widget.userData.email}",style: TextStyle(
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
                        child: Text("Phone",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),)
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text("${widget.userData.phone}",style: TextStyle(
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
                        child: Text("Address",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),)
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text("${widget.userData.address!.street}, ${widget.userData.address!.suite}, ${widget.userData.address!.city}, ${widget.userData.address!.zipcode}",style: TextStyle(
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
                        child: Text("Website",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),)
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text("${widget.userData.website}",style: TextStyle(
                            fontSize: 18,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue
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
                        child: Text("Company",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),)
                    ),
                    Column(
                      children: [
                        Container(
                            alignment: Alignment.topLeft,
                            child: Text("${widget.userData.company!.name}",style: TextStyle(
                                fontSize: 18,
                            ),)
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            child: Text("${widget.userData.company!.catchPhrase}",style: TextStyle(
                              fontSize: 18,
                            ),)
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            child: Text("${widget.userData.company!.bs}",style: TextStyle(
                              fontSize: 18,
                            ),)
                        ),
                      ],
                    )
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
