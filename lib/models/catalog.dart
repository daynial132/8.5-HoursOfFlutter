class CatalogModels {

  static final cartModel = CatalogModels._internal();

  CatalogModels._internal();
  factory CatalogModels() => cartModel;

  static List <item> Product = [];
  item getById(int Id) => Product.firstWhere((element)=>element.Id ==Id ,orElse: null);
  item getByPosition (int pos) => Product[pos];
}

class item {
  final int Id;
  final String Name;
  final String Description;
  final num Price;
  final String Color;
  final String image;

  item(
      {required this.Id,
      required this.Name,
      required this.Description,
      required this.Price,
      required this.Color,
      required this.image});

  factory item.fromMap(Map<String, dynamic> map) {
    return item(
      Id: map["id"],
      Name: map["name"],
      Description: map["desc"],
      Price: map["price"],
      Color: map["color"],
      image: map["image"],
    );
  }

  toMap() => {
        "id": Id,
        "name": Name,
        "desc": Description,
        "price": Price,
        "color": Color,
        "image": image
      };
}
