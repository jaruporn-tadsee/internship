import 'package:flutter/material.dart';

class Incomelist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รวมรายรับ'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff7ecfbc), Colors.pink[100]]),
          ),
        ),
      ),
      body: ListView(
        children: [
          Card(
            
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(30),
                      child: Text('รายรับ')),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text("data")],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}