import 'package:flutter/material.dart';
import 'package:saving_app/add_list.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class AddItems extends StatefulWidget {
  final Items items;
  const AddItems({Key key, this.items, String title}) : super(key: key);

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
      appBar: GradientAppBar(
        title: Text("บันทึกรายรับรายจ่าย"),
        backgroundColorStart: Color(0xff7ECFBC),
        backgroundColorEnd: Colors.pink[100],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      "ชื่อรายการ : ",
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      widget.items.title,
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                )
              ],
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
              )),
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
              height: 60,
              color: Color(0xff7ECFBC),
              child: FlatButton(
                onPressed: () {
                  /*...*/
                },
                child: Text(
                  "บันทึก",
                ),
              )),
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
