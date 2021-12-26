
class CatalogModels {

 static final Product = [
    item(
        Id: 1,
        Name: "Iphone1",
        Description: "Apple Iphone 12Gen",
        Price: 999,
        Color: "black",
        image:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/IPhone_1st_Gen.svg/200px-IPhone_1st_Gen.svg.png")
  ];

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
}
