import 'package:counterredux/redux/app_actions.dart';
import 'package:counterredux/redux/app_state.dart';
import 'package:counterredux/redux/app_store.dart';
import 'package:counterredux/redux/produts/products_actions.dart';
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
          home: MyHomePage(title: 'Flutter counter'),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

String _generationString(){
  return DateTime.now().toString();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: StoreConnector<AppState, List<String>>(
            converter: (store) => store.state.productsState.products,
            builder: (context, products) {
              return Text(
                '$title. Products: ${products.length}',
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
              StoreConnector<AppState, List<String>>(
                converter: (store) => store.state.productsState.products,
                builder: (context, products) {
                  if (products.isEmpty) {
                    return Text('List is empty');
                  }
                  return Container(
                    height:  MediaQuery.of(context).size.height/2,
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final item = products.elementAt(index);
                        print(item);
                        return ListTile(
                          title: Text('$item'),
                          // subtitle: Text('${item.length}'),
                        );
                      },
                    ),
                  );
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
                    StoreProvider.of<AppState>(context)
                    .dispatch(AddProductsAction(_generationString()));
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ],
        ));
  }
}
