import 'package:babyfeed/models/Bottle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class _AddPopup extends State<AddPopup> {
  bool isMeal;
  String title = "Add a ";

  int newQuantity = 0;
  DateTime newDateTime = DateTime.now();

  @override
  void initState(){
    super.initState();
    isMeal = widget.isMeal;
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return AlertDialog(
      title: Text(title + (isMeal ? "meal" : "bottle")),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: newQuantity.toString(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Quantity',
                ),
                validator: (value){
                  if (value.isEmpty){
                    return "Required";
                  }
                  return null;
                },
                onChanged: (value) {
                  newQuantity = int.parse(value);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text(newDateTime.toString()),
                  FlatButton(
                    child: Icon(Icons.date_range, color: Colors.blue),
                    onPressed: (){
                      DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2000, 1, 1),
                        onConfirm: (date) {
                          newDateTime = date;
                          setState(() {});
                        },
                        currentTime: DateTime.now());
                    },
                  )
                ]
              )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text("OK"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    var newObj;
                    newObj = new Bottle(quantity: newQuantity, datetime: newDateTime);
                    Navigator.pop(context, newObj);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddPopup extends StatefulWidget {
  final bool isMeal;

  const AddPopup({ Key key, this.isMeal }) : super(key: key);

  @override
  _AddPopup createState() => _AddPopup();
}