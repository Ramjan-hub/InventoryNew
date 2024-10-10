import 'package:flutter/material.dart';
import 'package:inventory_app/materialItem.dart';

var textEditingController1 = TextEditingController();

var textEditingController2 = TextEditingController();

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.search), // Changed to prefixIcon
                      hintText: "Search",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
               
                onPressed: () {
                  addAlertShow(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 213, 196, 255),
                   
    
                    elevation:1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),

                    ),
                child: const Row(
                  children: [

                      Icon(Icons.add,
                      color: Colors.black,
                      ),
                  
                     Padding(
                       padding: EdgeInsets.only(left: 8),
                       child: Text('Add Material',style: TextStyle(color: Colors.black),),
                     ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
              height: 10), // Added spacing between the TextField and ListView

          Expanded(
            child: ListView.builder(
              itemCount: materialNameList.length,
              itemBuilder: (context, index) {
                return Materialitem(materialNameList.elementAt(index),
                    unitList[index], index.toString());

                    
              },
            ),
          ),
        ],
      ),
    );
  }

  // Alert dialog for add material name & unit
  addAlertShow(BuildContext c) {
    showDialog(
      context: c,
      builder: (c) => AlertDialog(
        title: const Text('Add Material '),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: textEditingController1,
              decoration: const InputDecoration(
                hintText: 'Material Name',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: textEditingController2,
              decoration: const InputDecoration(
                hintText: 'Unit',
                enabledBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(c);
              },
              child: const Text('Cancel')),
          TextButton(
              onPressed: () {
                setState(() {
                  if (textEditingController1.text.isEmpty ||
                      textEditingController2.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please Field completely'),
                    ));
                  } else {
                    bool isAdded =
                        materialNameList.add(textEditingController1.text);
                    Navigator.pop(c);

                    textEditingController1.clear();

                    if (!isAdded) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Duplicate value not allowed')),
                      );
                    }

                    unitList.add(textEditingController2.text);
                    textEditingController2.clear();
                  }
                });
              },
              child: const Text('Save')),
        ],
      ),
    );
  }
}
