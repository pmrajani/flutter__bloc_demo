import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final CounterBlock counterbloc = BlocProvider.of<CounterBlock>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: BlocBuilder<CounterBlock, int>(
        builder: (context, count) {
          return Container(child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$count',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          ),);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          counterbloc.add(CounterEvent.increment);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}