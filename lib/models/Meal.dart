class Meal {
  int id;
  int totalQuantity;
  String datetime;
  bool hasIndus;
  int indusQuantity;

  Meal({this.id, this.totalQuantity, this.datetime, this.hasIndus, this.indusQuantity});

  Meal.fromMap(Map<String, dynamic> map) {
    id = map["_id"];
    totalQuantity = map["totalQuantity"];
    datetime = map["datetime"];
    hasIndus = map["hasIndus"] == 1 ? true : false;
    indusQuantity = map["indusQuantity"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "totalQuantity": totalQuantity,
      "datetime": datetime,
      "hasIndus": hasIndus ? 1 : 0,
      "indusQuantity": indusQuantity
    };
    if (id != null) {
      map["_id"] = id;
    }
    return map;
  }
}