import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multidimentionalarryfluttter/datas/products.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  _State createState() => _State();
}

class _State extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Array Multi'),
      ),
      body: ListView.builder(
        itemCount: database.length,
        itemBuilder: (_, index) {
          var courseImages = database[index]['c_images'];
          var courseTopics = database[index]['c_topcs'];
          bool is_available = database[index]['available'];
          return Card(
            child: Container(
              margin: EdgeInsets.all(5),
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: [
                  Text(database[index]['c_name'],style: TextStyle(fontSize: 30),),
                  Image.asset(database[index]['c_images'][0],
                    height: 70,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    flex: 1,
                    child: Wrap(
                      children: [
                        for (var singleCourse in courseTopics)
                          Container(
                            child: Container(
                              height: 20,
                              width: 50,
                              color: Colors.grey,
                              child: Center(child: Text(singleCourse)),
                            ),
                          )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(database[index]['c_price'].toString()),
                        ),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                if (is_available == true)
                                  Text('Course Available'),
                                if (is_available == false) Text('Stock Out'),
                              ],
                            ))
                      ],
                    ),
                  )
                ],
              ),

              /*'c_type': 'Core Php',
            'c_topcs': ['Html', 'Css', 'JS', 'Php', 'SQL', 'Mongo'],
            'c_price': 30000,
            'available': true,*/
            ),
          );
        },
      ),
    );
  }
}
