import 'package:counterredux/redux/app_actions.dart';
import 'package:counterredux/redux/app_state.dart';
import 'package:counterredux/redux/produts/products_actions.dart';
import 'package:counterredux/redux/produts/products_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is IncrementCounter) {
    return state.copyWith(
      counter: state.counter + 1,
    );
  } else if (action is DecrementCounter) {
    return state.copyWith(
      counter: state.counter - 1,
    );
  } else if (action is ProductsAction) {
    return state.copyWith(
        productsState: productsReducer(
      state.productsState,
      action,
    ));
  }
  return state;
}
