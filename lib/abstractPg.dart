import 'package:flutter/material.dart';

class Abstractpg extends StatefulWidget{
  const Abstractpg({super.key});

  @override
  State<Abstractpg> createState() => _AbstractpgState();
}

class _AbstractpgState extends State<Abstractpg> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
     
       body: Column(

       
        
        children: [
        
        Row(
        children: [
        
          Text('Total Issue'),
          Text('Total Received'),
          Text('Total Use')
        ],
        
        ),
        
        
        
        
        
        ],
        
          
        

       ),
       
       
      
    );
  }
}