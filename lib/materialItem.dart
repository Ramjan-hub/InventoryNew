import 'package:flutter/material.dart';
import 'package:inventory_app/abstractPg.dart';

Set materialNameList = {};

List unitList = [];

class Materialitem extends StatefulWidget  {
  String materialName;
  String unit;
  String index;
  VoidCallback onDelete;
  Materialitem(this.materialName, this.unit, this.index,{super.key,required this.onDelete});

  @override
  State<Materialitem> createState() => _MaterialitemState();
}

class _MaterialitemState extends State<Materialitem> {

  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Abstractpg()));
      },
      leading: CircleAvatar(
        backgroundColor: const Color.fromARGB(255, 201, 170, 255),
        child: Text(widget.index),
      ),
      title: Text(widget.materialName),
      subtitle: Text(widget.unit),
      trailing: PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: const Text('Edit'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AlertDialog(
                    content: Text('HDPE PIPE'),
                  );
                },
              );
            },
          ),
          PopupMenuItem(
            child: const Text('Delete'),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Do you want to delete?'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('no')),
                        TextButton(
                            onPressed: () {
                             
                               widget.onDelete();

                              Navigator.pop(context);
                            },
                            child: const Text('Yes'))
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
