import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'add_items.dart';
import 'add_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saving App',
      theme: ThemeData(
        primaryColor: Colors.pink[100],
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _value = 5215.0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text('บันทึกรายรับรายจ่าย'),
        backgroundColorStart: Color(0xff7ECFBC),
        backgroundColorEnd: Colors.pink[100],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  constraints: BoxConstraints.expand(height: 200.0),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xff7ECFBC), Colors.pink[100]]),
                      shape: BoxShape.circle),
                  child: Text(
                    "$_value บาท",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: 60,
              color: Color(0xff7ECFBC),
              child: FlatButton(
                onPressed: () {
                  /*...*/
                },
                child: Text(
                  "รวมรายจ่าย",
                ),
              )),
          Container(
              height: 60,
              color: Color(0xff7ECFBC),
              child: FlatButton(
                onPressed: () {
                  /*...*/
                },
                child: Text(
                  "รวมรายรับ",
                ),
              )),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff7ECFBC),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          if (value == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddItems(items: Items("เงินเดือน", "รายรับ"))),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddItems(items: Items("อาหารและเครื่องดื่ม", "รายจ่าย"))),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            label:'รายรับ',
            icon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            label: 'รายจ่าย',
            icon: Icon(Icons.remove),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddList()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
