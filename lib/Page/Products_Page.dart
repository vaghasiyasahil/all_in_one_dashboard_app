import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/ProductsModel.dart';
import '../Services/allData.dart';
import 'Products_Details_Page.dart';
class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.white
          ),
          backgroundColor: Colors.teal,
          title: Text("Products"),
          titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: allData.bgColor,
        body: FutureBuilder(
          future: getProducts(),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.teal,
                  backgroundColor: Colors.teal.shade200,
                ),
              );
            }else if(snapshot.data==null){
              return Center(
                child: Text("Not Products Found",textAlign: TextAlign.center,style: TextStyle(fontSize: 30,color: Colors.teal,fontWeight: FontWeight.bold),),
              );
            }else if(snapshot.hasError){
              return Center(
                child: Text("Something went wrong.",textAlign: TextAlign.center,style: TextStyle(fontSize: 30,color: Colors.teal,fontWeight: FontWeight.bold),),
              );
            }else{
              return ListView.builder(
                itemCount: snapshot.data!.products!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsDetailsPage(productsData: snapshot.data!.products![index],),));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2
                          )
                        ]
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: allData.bgColor,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Image.network(
                                snapshot.data!.products![index].images!.first,
                                height: 150,
                              ),
                            )
                          ),
                          Expanded(
                            flex: 2,
                              child: Container(
                                  height: 150,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: allData.bgColor,
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${snapshot.data!.products![index].title}",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 20
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "\$${snapshot.data!.products![index].price}",
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: Colors.teal.shade200
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 25),
                                          child: Text(
                                            "${snapshot.data!.products![index].category}",
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "${snapshot.data!.products![index].availabilityStatus}",
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: snapshot.data!.products![index].availabilityStatus=="Low Stock"?Colors.red:Colors.green
                                      ),
                                    ),
                                    Text(
                                      "${snapshot.data!.products![index].description}",
                                      maxLines: 3,
                                    ),
                                  ],
                                )
                              )
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  Future<ProductsModel?> getProducts() async {
    ProductsModel? productsModel;
    try{
      var url=Uri.parse("https://dummyjson.com/products");
      var response=await http.get(url);
      dynamic tempData=jsonDecode(response.body);
      productsModel=ProductsModel.fromJson(tempData);
    }catch(e){
      print("error=$e");
    }
    return productsModel;
  }
}