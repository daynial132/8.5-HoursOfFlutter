import 'package:untitled/models/catalog.dart';
import 'package:untitled/widget/home_widgets/catalog_image.dart';

class CartModel {
  CatalogModels _catalog;

  final List<int> _itemsIds = [];

  //get Catalog
  CatalogModels get catalogI => _catalog;

  //set Catalog
  set catalog(CatalogModels newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // get items in the cart
  List<item> get items => _itemsIds.map((Id) => _catalog.getById(Id)).toList();

// Get total price
num get totalPrice => items.fold(0, (total, current) => total + current.Price);

//Add item
void add(item Item){
  _itemsIds.add(Item.Id);

}
//remove item
  void remove(item Item){
    _itemsIds.remove(Item.Id);

  }




}
