import 'package:counterredux/redux/app_actions.dart';
import 'package:counterredux/redux/app_state.dart';
import 'package:counterredux/redux/produts/products_actions.dart';
import 'package:counterredux/redux/produts/products_reducer.dart';
import 'package:redux/redux.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, IncrementCounter>(_incrementCounter),
  TypedReducer<AppState, DecrementCounter>(_decrementCounter),
  TypedReducer<AppState, ProductsAction>(_productsReducer),
]);

AppState _incrementCounter(AppState state, IncrementCounter action) {
  return state.copyWith(
    counter: state.counter + 1,
  );
}

AppState _decrementCounter(AppState state, DecrementCounter action) {
  return state.copyWith(
    counter: state.counter - 1,
  );
}

AppState _productsReducer(AppState state, ProductsAction action) {
  return state.copyWith(
      productsState: productsReducer(
    state.productsState,
    action,
  ));
}

// AppState appReducer(AppState state, dynamic action) {
//   if (action is IncrementCounter) {
//     return state.copyWith(
//       counter: state.counter + 1,
//     );
//   } else if (action is DecrementCounter) {
//     return state.copyWith(
//       counter: state.counter - 1,
//     );
//   } else if (action is ProductsAction) {
//     return state.copyWith(
//         productsState: productsReducer(
//       state.productsState,
//       action,
//     ));
//   }
//   return state;
// }
