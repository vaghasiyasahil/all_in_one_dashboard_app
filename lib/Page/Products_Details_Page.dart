import 'package:all_in_one_dashboard_app/Services/allData.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Model/ProductsModel.dart';

class ProductsDetailsPage extends StatefulWidget {
  Products productsData;
  ProductsDetailsPage({required this.productsData,super.key});

  @override
  State<ProductsDetailsPage> createState() => _ProductsDetailsPageState();
}

class _ProductsDetailsPageState extends State<ProductsDetailsPage> {

  final CarouselSliderController controller=CarouselSliderController();
  PageController pageController=PageController();
  int activeIndex=0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.white
          ),
          backgroundColor: Colors.teal,
          title: Text("${widget.productsData.title}"),
          titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                carouselController: controller,
                options: CarouselOptions(
                  height: 400.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex=index;
                    });
                  },
                ),
                items: widget.productsData.images!.map((imageName) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: allData.bgColor,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Image.network(
                            imageName
                          )
                      );
                    },
                  );
                }).toList(),
              ),
              AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: widget.productsData.images!.length,
                effect: SwapEffect(
                  activeDotColor: Colors.teal,
                  dotColor: Colors.teal.shade200,
                  type: SwapType.yRotation
                ),
                onDotClicked: (index) {
                  controller.jumpToPage(index);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: Text(
                        "${widget.productsData.title}",
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      StarRating(
                        rating: double.parse(widget.productsData.rating.toString()),
                        allowHalfRating: false,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Text(
                          "(${widget.productsData.reviews!.length})",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Text(
                  "Stock: ${widget.productsData.stock}",
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 20
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "${widget.productsData.description}",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "${widget.productsData.category}",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Price: ",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.teal
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${widget.productsData.price}",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.teal
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "You Save: ",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.teal
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${double.parse(widget.productsData.price.toString())*double.parse(widget.productsData.discountPercentage.toString())/100} (${widget.productsData.discountPercentage}%)",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.teal
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Top Highlights",
                  style: TextStyle(
                      fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Brand",
                            style: TextStyle(
                                fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${widget.productsData.brand}",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Sku",
                            style: TextStyle(
                                fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${widget.productsData.sku}",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Weight",
                            style: TextStyle(
                                fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${widget.productsData.weight}",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Height",
                            style: TextStyle(
                                fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${widget.productsData.dimensions!.height}",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Width",
                            style: TextStyle(
                                fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${widget.productsData.dimensions!.width}",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Depth",
                            style: TextStyle(
                                fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${widget.productsData.dimensions!.depth}",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Warranty Information",
                            style: TextStyle(
                                fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${widget.productsData.warrantyInformation}",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Shipping Information",
                            style: TextStyle(
                                fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${widget.productsData.shippingInformation}",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Availability Status",
                            style: TextStyle(
                                fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${widget.productsData.availabilityStatus}",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
