import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/PhotosModel.dart';
import '../Services/allData.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: allData.bgColor,
          appBar: AppBar(
            iconTheme: IconThemeData(
                color: Colors.white
            ),
            backgroundColor: Colors.teal,
            title: Text("Image"),
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder(
                future: getImage(),
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
                      child: Text("Not Image Found",textAlign: TextAlign.center,style: TextStyle(fontSize: 30,color: Colors.teal,fontWeight: FontWeight.bold),),
                    );
                  }else if(snapshot.hasError){
                    return Center(
                      child: Text("Something went wrong.",textAlign: TextAlign.center,style: TextStyle(fontSize: 30,color: Colors.teal,fontWeight: FontWeight.bold),),
                    );
                  }else{
                    return Image.network(
                      snapshot.data!.message!,
                      width: double.infinity,
                    );
                  }
                },
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {});
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.teal,
                  borderRadius: BorderRadius.all(Radius.circular(7))
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Text(
                    "Fetch!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }

  Future<PhotosModel> getImage() async {
    var url=Uri.parse("https://dog.ceo/api/breeds/image/random");
    var response=await http.get(url);
    return PhotosModel.fromJson(jsonDecode(response.body));
  }
}
