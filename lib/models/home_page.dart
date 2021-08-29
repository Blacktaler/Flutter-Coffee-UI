// import 'dart:io';
import 'dart:ui';

import 'package:dars9/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  bool iconBut = false;
  Color? iconColor;
  double? price;
  List<String> coffeNames = ['Latte','Cappucino','Espresso'];
  List<String> coffePictures = ['assets/images/cappucino.jpeg','assets/images/latte.jpeg','assets/images/espresso.jpeg'];
  String coffeePicture = '';
  String coffeeName = '';
  bool? but1;
  bool? but2;
  bool? but3;
  @override
  Widget build(BuildContext context) {
    iconColor=  iconBut ?  Colors.red : Colors.grey;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )
            ),
            toolbarHeight: 420,
            expandedHeight: 300,
            primary: false,
            titleSpacing: 0.0,
            backgroundColor: Colors.black87,
            bottom: PreferredSize(
              preferredSize: Size(2, 3),
              child: Container(
                height: 140,
                width: 400,
                child: Container(
                  // height: 140,
                  // width: 400,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.brown.withOpacity(.9),
                          Colors.brown.withOpacity(.9),
                          Colors.brown.withOpacity(.9)
                        ]),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$coffeeName',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'With Oat Milk',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 18,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                '4.5',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '(7,382)',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                    fontSize: 12),
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(3, 5, 3, 3),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.coffee,
                                      color: Colors.brown,
                                      size: 20,
                                    ),
                                    Text(
                                      'Coffee',
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(3, 5, 3, 3),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.pin_drop,
                                      color: Colors.brown,
                                      size: 20,
                                    ),
                                    Text(
                                      'Milk',
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 9),
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(11)),
                            child: Text(
                              'Medium Roasted',
                              style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              stretchModes: [
                StretchMode.blurBackground,
                StretchMode.fadeTitle  
              ],
              title: Container(
                padding: EdgeInsets.fromLTRB(4, 20, 4, 0),
                height: 400,
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  image: DecorationImage(
                      image: AssetImage('$coffeePicture'),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: MyHomePage(),
                                      type: PageTransitionType.leftToRight,
                                      duration: Duration(seconds: 1)));
                            },
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        Container(
                          child: IconButton(onPressed: (){
                            setState((){
                              iconBut = !iconBut;
                            });
                          }, icon: Icon(
                            Icons.favorite_outlined,
                            color: iconColor,
                          ),
                          ),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 200,
                    ),
                  ],
                ),
              ),
              titlePadding: EdgeInsets.all(0),
            ),
          ),
//Sliver AppBar tugadi
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: Colors.grey[900],
                  height: 850,
                  padding: EdgeInsets.fromLTRB(10, 20, 5, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'A cappucino is a coffe-based drink made',
                        style: TextStyle(fontSize: 16, color: Colors.grey[400]),
                      ),
                      Row(
                        children: [
                          Text(
                            'primarily from espresso and milk',
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[400]),
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('About Coffee'),
                                  content: Container(
                                    width: 50,
                                    height: 50,
                                    color: Colors.black,
                                    child: Text(
                                      'Coffee is Lorem Ispum',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      child: Text('okay'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Text(
                              '...Read More',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.orange),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Size',
                        style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 102,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.brown,
                                border: but1 == true
                                    ? Border.all(
                                        width: 1.5,
                                        color: Colors.brown,
                                      )
                                    : null,
                                borderRadius: BorderRadius.circular(10)),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  coffeeName = coffeNames[0];
                                  coffeePicture = coffePictures[0];
                                  but1 = true;
                                  but2 = false;
                                  but3 = false;
                                  makebool();
                                  makePrice();
                                });
                              },
                              child: Text('S'),
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(100, 40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 0,
                                  primary: Colors.black),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 102,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.brown,
                                border: but2 == true
                                    ? Border.all(
                                        width: 1.5,
                                        color: Colors.brown,
                                      )
                                    : null,
                                borderRadius: BorderRadius.circular(10)),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  coffeeName = coffeNames[1];
                                  coffeePicture = coffePictures[1];
                                  but2 = true;
                                  but1 = false;
                                  but3 = false;
                                  makebool();
                                  makePrice();
                                });
                              },
                              child: Text('M'),
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(100, 40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 0,
                                  primary: Colors.black),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 102,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.brown,
                              border: but3 == true
                                  ? Border.all(
                                      width: 1.5,
                                      color: Colors.brown,
                                    )
                                  : null,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  coffeeName = coffeNames[2];
                                  coffeePicture = coffePictures[2];
                                  but3 = true;
                                  but1 = false;
                                  but2 = false;
                                  makebool();
                                  makePrice();
                                });
                              },
                              child: Text('L'),
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(100, 40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 0,
                                  primary: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 60),
                      Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Text(
                                    'Price',
                                    style: TextStyle(color: Colors.grey[600],),

                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  Text('\$',style: TextStyle(
                                color: Colors.orange,
                                fontSize: 20,
                                ),
                              ),
                              Text('$price',style: TextStyle(fontSize: 23,color: Colors.white),),
                                ],
                              )
                            ],
                          ),
                          SizedBox(width: 40,),
                          ElevatedButton(onPressed: (){
                            showDialog(context: context, builder: (context)=>AlertDialog(
                              title: Text('Coffee information'),
                              content: Container(
                                height: 50,
                                width: 50,
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Row(
                                  children: [
                                    Text('you Bought a Coffee for ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                    Text('\$ ',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),),
                                    Text('$price',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.red.withOpacity(.3),Colors.blue.withOpacity(.6),]
                                  ),
                                ),
                              ),
                              actions: [
                                ElevatedButton(onPressed: (){
                                  Navigator.pop(context);
                                },child: Text('okay'),)
                              ],
                            ));
                          },child: Text('Buy Now',style:TextStyle(fontSize: 22)),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16,),
                            ),
                            fixedSize: Size(265,50),
                            primary: Colors.yellow[900]
                          ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  makebool() {
    if (but1 == true) {
    //  return (but2 = false  but3 = false);
    } else if (but2 == true) {
      but3 = false;
      but1 = false;
    } else if (but3 == true) {
      but1 = false;
      but2 = false;
    }
    return but1;
  }
  makePrice(){
    if (but1 == true)
    return price = 4.20;
    else if(but2 == true)
    return price = 4.60 ;
    else if(but3 == true)
    return price = 5.20; 
  }
}
