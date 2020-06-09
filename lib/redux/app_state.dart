import 'package:counterredux/redux/produts/products_state.dart';

class AppState {
  final int counter;
  final ProductsState productsState;
  AppState({
    this.counter,
    this.productsState,
  });
  factory AppState.initialState() {
    return AppState(
      counter: 0,
      productsState: ProductsState.initialState(),
    );
  }

  AppState copyWith({
    int counter,
    ProductsState productsState,
  }) {
    return AppState(
      counter: counter ?? this.counter,
      productsState: productsState ?? this.productsState,
    );
  }
}
