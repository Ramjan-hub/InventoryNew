import 'package:flutter/material.dart';
import 'package:inventory_app/bottomNavBar.dart';




void main(){

  runApp(inventoryApp());
}

class inventoryApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(

    theme :ThemeData.light(useMaterial3: true),

    debugShowCheckedModeBanner: false,
      
     home: BottomNavBar(), 


    );



  }

}