import 'package:flutter/material.dart';



void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() {
    return MainAppState();
  }
}

class MainAppState extends State<MainApp> {
  String displaytext = "Peacock";
  TextEditingController textcontroller = TextEditingController();

  List<String> items = []; 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "LIST TO DO APP",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
          centerTitle: false,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: textcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter The Data"),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      items.add(textcontroller.text);
                      textcontroller.clear();
                    });
                  },
                  child: Text("Click"),
                  color: Colors.blue,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textColor: Colors.white,
                ),
              ],
            ),
            Flexible(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(items[index]),
                        ),
                      ),
                      MaterialButton(
                        child: Icon(Icons.delete),
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            items.removeAt(index);
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

