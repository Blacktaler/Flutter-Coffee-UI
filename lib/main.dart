import 'dart:math';

// import 'package:dars9/models/example_page.dart';
import 'package:dars9/models/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MaterialApp(
    title: 'My Application',
    checkerboardRasterCacheImages: false,
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),
    theme: ThemeData(
      backgroundColor: Colors.red,
    ),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController? _hideButtonController;

  var _isVisible = true;
  @override
  initState() {
    super.initState();
    _isVisible = true;
    _hideButtonController = ScrollController();
    _hideButtonController!.addListener(() {
      if (_hideButtonController!.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible)
          setState(() {
            _isVisible = false;
            print("*** $_isVisible up");
          });
      }
      if (_hideButtonController!.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isVisible)
          setState(() {
            _isVisible = true;
            print("**** $_isVisible down");
          });
      }
    });
  }

  List<String> coffeeNames = [
    'Decaf',
    'Espresso',
    'Latte',
    'Cappuccino',
    'Cortado',
    'Americano',
    'Flat White'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        controller: _hideButtonController,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            stretch: true,
            floating: true,
            snap: true,
            backgroundColor: Colors.white10,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(13),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white24,
                                  blurRadius: 0,
                                  spreadRadius: 0.0,
                                  offset: Offset(2, 2))
                            ]),
                        child: Icon(
                          CupertinoIcons.square_grid_2x2_fill,
                          color: Colors.white24,
                        )),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('assets/images/johon2.jpeg'),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Find the best\ncoffee for you',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.white.withOpacity(.3),
                              Colors.cyan.withOpacity(.5)
                            ]),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 15),
                          Icon(CupertinoIcons.search),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Find Your Coffe'),
                        ],
                      )),
                ),
                SizedBox(height: 60),
              ],
            ),
            expandedHeight: 350,
            toolbarHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(right: 20, bottom: 10),
              title: Container(
                // padding: EdgeInsets.only(right: 40),
                height: 60,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeNames.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: TextButton(
                        onPressed: () {
                          setState(() {});
                          Navigator.pushAndRemoveUntil(
                              context,
                              PageTransition(
                                  child: HomePage(),
                                  type: PageTransitionType.topToBottom,
                                  duration: Duration(seconds: 2)),
                              (route) => false);
                        },
                        child: Text(
                          '${coffeeNames[index]}',
                          style: TextStyle(color: makeColor(), fontSize: 20),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return makeWidget(index);
            }, childCount: 3),
          ),
        ],
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: _isVisible ? 60.0 : 0.0,
        child: _isVisible 
        ? AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: _isVisible ?  60.0 : 0.0,
        child: _isVisible 
        ? BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'offers'),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), label: 'Account'),
        ],
        currentIndex: 0,
        ) 
        : Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
        ),
        
        )
    :Container(
      color: Theme.of(context).primaryColor,
      width: MediaQuery.of(context).size.width,
    )
    ) 
    
    ); 
    
  }

  Widget makeWidget(i) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, left: 10),
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
              height: 250,
              width: 170,
              decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.red.withGreen(80),
                        Colors.blue.withRed(50)
                      ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 140,
                    width: 150,
                    alignment: Alignment.topRight,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://source.unsplash.com/random/$i'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20))),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.orangeAccent,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '4.5',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Cappucino',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'with cow milk',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        '\$',
                        style: TextStyle(
                            color: Colors.amber[900],
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '4.20',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.amber[900],
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 10),
              margin: EdgeInsets.symmetric(horizontal: 4, vertical: 30),
              height: 250,
              width: 170,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.grey.withRed(200),
                        Colors.grey.withBlue(100)
                      ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 140,
                    width: 150,
                    alignment: Alignment.topRight,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://source.unsplash.com/random/$i'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20))),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.orangeAccent,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '4.2',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Cappucino',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'with cow milk',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        '\$',
                        style: TextStyle(
                            color: Colors.amber[900],
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '4.20',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.amber[900],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          height: 230,
          width: 340,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                height: 190,
                width: 155,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image:
                        NetworkImage('https://source.unsplash.com/random/$i'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      '5 Coffe Beans You\nMust Try !',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Coffee is a plant\nand the name\n of the drink that is \nmade from this\nplant The coffee plant\nis a bush\nor tree that can grow\nup to  many countries.',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  makeColor() {
    List<Color> ranglar = [
      Colors.green,
      Colors.blue,
      Colors.redAccent,
      Colors.cyanAccent,
      Colors.amberAccent,
      Colors.indigoAccent,
      Colors.purpleAccent,
    ];
    var randomRang = ranglar[Random().nextInt(7)];

    return randomRang;
  }
}
