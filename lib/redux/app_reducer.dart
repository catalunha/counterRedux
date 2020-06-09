import 'package:counterredux/redux/app_actions.dart';
import 'package:counterredux/redux/app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is IncrementCounter) {
    return state.copyWith(
      counter: state.counter + 1,
      counterX: state.counter * 2,
    );
  } else if (action is DecrementCounter) {
    return state.copyWith(counter: state.counter - 1);
  }
  return state;
}
