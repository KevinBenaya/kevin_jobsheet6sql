class Item {
  int? _id;
  String? _name;
  int? _price;
  int? _stok;
  String? _kode;

  int get id => _id!;

  String get name => _name!;
  set name(String value) => _name = value;

  get stok => this._stok!;
  set stok(value) => this._stok = value;

  String get kode => _kode!;
  set kode(String value) => _kode = value;

  get price => price!;
  set price(value) => _price = value;

  // konstruktor versi 1
  Item(this._name, this._price, this._stok, this._kode);

  // konstruktor versi 2: konversi dari Map ke Item
  Item.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._price = map['price'];
    this._stok = map['stok'];
    this._kode = map['kode'];
  }

  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['name'] = name;
    map['price'] = price;
    map['stok'] = stok;
    map['kode'] = kode;
    return map;
  }
}
