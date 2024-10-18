import 'package:flutter/material.dart';

class Abstractpg extends StatefulWidget {
  const Abstractpg({super.key});

  @override
  State<Abstractpg> createState() => _AbstractpgState();
}

class _AbstractpgState extends State<Abstractpg> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double columnSpacing = screenWidth > 600 ? 320.44 : 60.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Abstract '),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Add",
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Total issue : \n 20034',
                          style: TextStyle(fontSize: 15),
                        ),
                      )),
                  DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Total Recevive : \n 50025',
                          style: TextStyle(fontSize: 15),
                        ),
                      )),
                  DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Total Use : \n 30025',
                          style: TextStyle(fontSize: 15),
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 150.0,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        suffixIcon: const Icon(Icons.date_range),
                        hintText: '21/10/2024',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columnSpacing: columnSpacing,
                columns: [
                  DataColumn(
                      label: Text(
                    'Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataColumn(
                      label: Text(
                    'Issue',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataColumn(
                      label: Text(
                    'Recive',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataColumn(
                      label: Text(
                    'Use',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('12/1/2024')),
                    DataCell(Text('1003')),
                    DataCell(Text('2000')),
                    DataCell(Text('1223')),
                  ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
