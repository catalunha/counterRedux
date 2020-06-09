class ProductsState {
  final List<String> products;

  ProductsState({this.products});
  
  factory ProductsState.initialState() {
    return ProductsState(
      products: [],
    );
  }
  ProductsState copy({List<String> products}) {
    return ProductsState(
      products: products ?? this.products,
    );
  }
}
