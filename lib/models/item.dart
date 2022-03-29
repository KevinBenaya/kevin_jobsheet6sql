class Item {
  int _id;
  String _name;
  int _price;

  int get id => _id;

  String get name => this._name;
  set name(String value) => this._name = value;

  get price => this._price;
  set price(value) => this._price = value;

  // konstruktor versi 1
  Item(this._name, this._price);
}
