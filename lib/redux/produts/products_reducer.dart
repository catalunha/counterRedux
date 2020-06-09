import 'package:counterredux/redux/produts/products_actions.dart';
import 'package:counterredux/redux/produts/products_state.dart';
import 'package:redux/redux.dart';

final productsReducer = combineReducers<ProductsState>([
  TypedReducer<ProductsState,AddProductsAction>(_addProductsAction),
]);

ProductsState _addProductsAction(ProductsState state, AddProductsAction action){
  final updateList = state.products;
    updateList.add(action.product);
    return state.copy(
      products: updateList,
    );
}

// ProductsState productsReducer(ProductsState state, ProductsAction action) {
//   if (action is AddProductsAction) {
//     final updateList = state.products;
//     updateList.add(action.product);
//     return state.copy(
//       products: updateList,
//     );
//   }
//   return state;
// }
