import 'package:counterredux/redux/app_actions.dart';
import 'package:counterredux/redux/app_state.dart';
import 'package:counterredux/redux/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: appStore,
        child: MaterialApp(
          title: 'Flutter Demo',
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (context, appState) {
              return Text(
                '$title: ${appState.counter}',
              );
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Redux: Ao clicar o counter aumenta para:',
              ),
              StoreConnector<AppState, int>(
                converter: (store) => store.state.counter,
                builder: (context, counter) {
                  return Text(
                    '$counter',
                  );
                },
              ),
              StoreConnector<AppState, int>(
                converter: (store) => store.state.counterX,
                builder: (context, counterX) {
                  return Text('CounterX: $counterX');
                },
              )
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                StoreProvider.of<AppState>(context)
                    .dispatch(DecrementCounter());
              },
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                StoreProvider.of<AppState>(context)
                    .dispatch(IncrementCounter());
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ],
        ));
  }
}
