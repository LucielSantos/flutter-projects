class Recipe {
  int _id;
  String _name;
  String _description;
  String _date;

  Recipe(this._name, this._description);
  Recipe.empty();

  int get id => _id;
  String get name => _name;
  String get description => _description;
  String get date => _date;

  set name(String newName) {
    if (newName.length <= 255) {
      this._name = newName;
    }
  }

  set description(String newDescription) {
    this._description = newDescription;
  }

  set date(String newDate) {
    this._date = newDate;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['description'] = _description;
    map['date'] = _date;

    return map;
  }

  Recipe.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._description = map['description'];
    this._date = map['date'];
  }
}
