class AppState {
  final int counter;
  final int counterX;

  AppState({
    this.counter,
    this.counterX,
  });
  factory AppState.initialState() {
    return AppState(
      counter: 0,
      counterX: 10,
    );
  }

  AppState copyWith({
    int counter,
    int counterX,
  }) {
    return AppState(
      counter: counter ?? this.counter,
      counterX: counterX ?? this.counterX,
    );
  }
}
