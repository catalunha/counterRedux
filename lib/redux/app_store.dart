import 'package:counterredux/redux/app_reducer.dart';
import 'package:counterredux/redux/app_state.dart';
import 'package:redux/redux.dart';

Store<AppState> appStore = Store<AppState>(
appReducer,
initialState: AppState.initialState()
);