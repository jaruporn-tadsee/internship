import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'add_items.dart';

class AddList extends StatefulWidget {
  @override
  _AddListState createState() => _AddListState();
}

class Items {
  final String title;

  Items(this.title);
}

class _AddListState extends State<AddList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: GradientAppBar(
              title: Text('บันทึกรายรับรายจ่าย'),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
              bottom: TabBar(
                tabs: [
                  Tab(text: 'รายรับ'),
                  Tab(text: 'รายจ่าย'),
                ],
              ),
              backgroundColorStart: Color(0xff3ba089),
              backgroundColorEnd: Colors.pink[100],
            ),
            body: TabBarView(children: [
              IncomePage(),
              ExpendPage(),
            ])),
      ),
    );
  }
}

// หน้ารายรับ
class IncomePage extends StatefulWidget {
  @override
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  final icomeitems = [""];
  final expenditems = [""];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(5),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.amber[100],
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('เงินเดือน'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddItems(items: Items("เงินเดือน")),
                ),
              );
            },
          ),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('เงินฝาก'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddItems(items: Items("เงินฝาก")),
                ),
              );
            },
          ),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: ListTile(
            leading: Icon(Icons.emoji_events_outlined),
            title: Text('โบนัส'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddItems(items: Items("โบนัส")),
                ),
              );
            },
          ),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: ListTile(
            leading: Icon(Icons.timeline),
            title: Text('ดอกเบี้ย'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddItems(items: Items("ดอกเบี้ย")),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// หน้ารายจ่าย
class ExpendPage extends StatefulWidget {
  @override
  _ExpendPageState createState() => _ExpendPageState();
}

class _ExpendPageState extends State<ExpendPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.amber[100],
          child: ListTile(
            leading: Icon(Icons.restaurant),
            title: Text("อาหารและเครื่องดื่ม"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddItems(items: Items("อาหารและเครื่องดื่ม")),
                ),
              );
            },
          ),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: ListTile(
              leading: Icon(Icons.shopping_cart_outlined),
              title: Text('ช้อปปิ้ง'),
              onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddItems(items: Items("ช้อปปิ้ง")),
                ),
              );
            },
              ),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: ListTile(
              leading: Icon(Icons.train_rounded), 
              title: Text('การเดินทาง'),
              onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddItems(items: Items("การเดินทาง")),
                ),
              );
            },
              ),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: ListTile(
              leading: Icon(Icons.school_outlined), 
              title: Text('การศึกษา'),
              onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddItems(items: Items("การศึกษา")),
                ),
              );
            },
              ),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: ListTile(
              leading: Icon(Icons.trending_up), 
              title: Text('การลงทุน'),
              onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddItems(items: Items("การลงทุน")),
                ),
              );
            },
              ),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: ListTile(
              leading: Icon(Icons.fitness_center), 
              title: Text('สุขภาพ'),
              onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddItems(items: Items("สุขภาพ")),
                ),
              );
            },
              ),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: ListTile(
              leading: Icon(Icons.monetization_on), 
              title: Text('บิล'),
              onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddItems(items: Items("บิล")),
                ),
              );
            },
              ),
        ),
      ],
    );
  }
}
