import 'package:untitled/core/store.dart';
import 'package:untitled/models/catalog.dart';
import 'package:untitled/widget/home_widgets/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatalogModels _catalog;

  final List<int> _itemsIds = [];

  //get Catalog
  CatalogModels get catalog => _catalog;

  //set Catalog
  set catalog(CatalogModels newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // get items in the cart
  List<item> get items => _itemsIds.map((Id) => _catalog.getById(Id)).toList();

// Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.Price);


//remove item
  void remove(item Item) {
    _itemsIds.remove(Item.Id);
  }
}


class AddMutation extends VxMutation<MyStore>{
  final item Item;

  AddMutation(this.Item);
  @override
  perform() {

    store!.cart._itemsIds.add(Item.Id);

  }
}