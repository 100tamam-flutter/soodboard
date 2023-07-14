import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ListView(
      children: [
        Row(
         children: [
           Container(
             margin: EdgeInsets.all(10),
             height: 50, width: 400,
            padding: EdgeInsets.only(top: 12, bottom: 12, left:16, right:16),
             decoration: BoxDecoration(
            border:
            Border.all(
            color: Colors.black26
           ),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            ),
      
             child: 
               Row(
                 children: [
                   Icon(CupertinoIcons.search, color: Colors.blue),
                   Container(width: 10,),
                   Text(
                     "Search Product",
                     style: TextStyle(
                       fontSize: 12,
                       color: Colors.black38,
                       fontFamily: 'Poppins',
                       fontWeight: FontWeight.w400,
                       fontStyle: FontStyle.normal
                     ),
                   ),
                 ],
               )
           ),
           Icon(CupertinoIcons.heart), 
           Container(width: 10),
           Icon(Icons.notifications_none_outlined),
         ],
          ),

    
         



      ],

    );

  }
}
