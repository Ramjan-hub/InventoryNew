import 'package:flutter/material.dart';

Set materialNameList = {};

List unitList = [];

class Materialitem extends StatefulWidget {
  String materialName;
  String unit;
  String index;
  Materialitem(this.materialName, this.unit, this.index, {super.key});

  @override
  State<Materialitem> createState() => _MaterialitemState();
}

class _MaterialitemState extends State<Materialitem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
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
                              setState(() {});
                              var tempList = materialNameList.toList();

                              tempList.removeAt(int.parse(widget.index));

                              unitList.removeAt(int.parse(widget.index));
                              materialNameList = tempList.toSet();

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
