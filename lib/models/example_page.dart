
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 200,
            backgroundColor: Colors.redAccent,
          ),
          SliverGrid(
            
            delegate: SliverChildBuilderDelegate(
              (c, i){
                return Container(
                  margin: EdgeInsets.all(3),
                  height: 200.0,
                  color: Colors.blue.withGreen(23),
                );
              }
              
              
          ),
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 5
           
           ),
           ),
        ],
      ),
    );
  }
}