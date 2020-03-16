class Bottle {
  int id;
  int quantity;
  DateTime datetime;

  Bottle({this.id, this.quantity, this.datetime});

  Bottle.fromMap(Map<String, dynamic> map) {
    id = map["_id"];
    quantity = map["quantity"];
    datetime = DateTime.parse(map["datetime"]);
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "quantity": quantity,
      "datetime": datetime.toString()
    };
    if (id != null) {
      map["_id"] = id;
    }
    return map;
  }
}