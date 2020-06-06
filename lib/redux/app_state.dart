class AppState {
  final int counter;

  AppState({this.counter});
  factory AppState.initialState() {
    return AppState(counter: 0);
  }

  AppState copyWith({int counter}) {
    return AppState(counter: counter ?? this.counter);
  }
}
