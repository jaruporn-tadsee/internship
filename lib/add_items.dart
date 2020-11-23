import 'package:flutter/material.dart';
import 'package:saving_app/add_list.dart';

class AddItems extends StatefulWidget {
  final Items items;
  const AddItems({Key key, this.items, String title, String type})
      : super(key: key);

  @override
  _AddItemsState createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  DateTime pickedDate;
  TimeOfDay time;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.items.type),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            child: FlatButton(
              child: Column(
                children: [
                  Text(
                    "หมวดหมู่ : ${widget.items.title}",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddList()),
                );
              },
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ยอดเงินรวม',
              ),
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: InkWell(
              child: Text(
                "วันที่ : ${pickedDate.day}/${pickedDate.month}/${pickedDate.year}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: _pickDate,
            ),
          ),
          Container(
            height: 150,
            padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: TextField(
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'รายละเอียด',
              ),
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
                "บันทึก",
              ),
            ),
          ),
        ],
      ),
    );
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: pickedDate,
    );

    if (date != null)
      setState(() {
        pickedDate = date;
      });
  }
}
