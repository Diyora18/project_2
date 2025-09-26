abstract class ProductEvent {}

class FetchAllProducts extends ProductEvent {}

class FetchByCategory extends ProductEvent {
  final int categoryId;

  FetchByCategory(this.categoryId);
}

class SearchProducts extends ProductEvent {
  final String query;

  SearchProducts(this.query);
}

class SaveProduct extends ProductEvent {
  final int productId;

  SaveProduct(this.productId);
}

class UnsaveProduct extends ProductEvent {
  final int productId;

  UnsaveProduct(this.productId);
}
