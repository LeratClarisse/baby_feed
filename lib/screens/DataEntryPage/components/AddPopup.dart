import 'package:babyfeed/models/Bottle.dart';
import 'package:babyfeed/models/Meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class _AddPopup extends State<AddPopup> {
  bool isMeal;
  String title = "Add a ";

  int newQuantity = 0;
  String newDateTime = DateTime.now().year.toString() + '-' + DateTime.now().month.toString() + '-' + DateTime.now().day.toString() + ' ' + DateTime.now().hour.toString() + ':' + DateTime.now().minute.toString();
  bool hasIndus = false;
  int newIndusQuantity = 0;

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
                          newDateTime = '${date.year}-${date.month}-${date.day} ${date.hour}:${date.minute}';
                          setState(() {});
                        },
                        locale: ,
                        currentTime: DateTime.now());
                    },
                  )
                ]
              )
            ),
            Visibility(
              child:
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("Has industrial milk ?"),
                      Checkbox(
                        value: hasIndus,
                        onChanged: (value) {
                          setState ((){
                            hasIndus = value;
                          });
                        },
                      ),
                      Visibility(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          initialValue: newIndusQuantity.toString(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Indus Quantity',
                          ),
                          validator: (value){
                            if (value.isEmpty && hasIndus){
                              return "Required";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            newIndusQuantity = int.parse(value);
                          },
                        ),
                        visible: hasIndus
                      )
                    ]
                  ),
                ),
              visible: isMeal
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text("OK"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    var newObj;

                    if (isMeal) {
                      newObj = new Meal(totalQuantity: newQuantity,
                          datetime: newDateTime,
                          hasIndus: hasIndus,
                          indusQuantity: newIndusQuantity);
                    } else {
                      newObj = new Bottle(quantity: newQuantity, datetime: newDateTime);
                    }

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