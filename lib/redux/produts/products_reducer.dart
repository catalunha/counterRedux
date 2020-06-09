import 'package:counterredux/redux/produts/products_actions.dart';
import 'package:counterredux/redux/produts/products_state.dart';

ProductsState productsReducer(ProductsState state, ProductsAction action) {
  if (action is AddProductsAction) {
    final updateList = state.products;
    updateList.add(action.product);
    return state.copy(
      products: updateList,
    );
  }

  return state;
}
