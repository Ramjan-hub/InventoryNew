import 'package:flutter/material.dart';
import 'package:inventory_app/home.dart';

class BottomNavBar extends StatefulWidget {
   BottomNavBar({super.key});



  @override
  State<BottomNavBar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<BottomNavBar> {

  List<Widget> screenList=[
   MyWidget(),

  ];

  int myIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inventory'),),
      body: IndexedStack(children: screenList,index: myIndex,),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 227, 187, 240),
        selectedItemColor: Colors.black,

        onTap: (index){

          setState(() {
            myIndex=index;
          });
         
        },

        currentIndex:myIndex,
        items: const [
          BottomNavigationBarItem(
          icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages_rounded),
            label: "work",
          ),
        ],
      ),
    );
  }
}
