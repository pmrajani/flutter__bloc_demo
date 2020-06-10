import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_demo/bloc/bloc.dart';
import 'package:flutter_block_demo/network/network_client.dart';
import 'package:flutter_block_demo/repository/quote_repository.dart';
import '../bloc/counter_bloc.dart';
import 'quote_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  QuoteRepository _quoteRepository =
      QuoteRepository(networkClient: new NetworkClient(dio: new Dio()));

  @override
  Widget build(BuildContext context) {
    final CounterBlock counterbloc = BlocProvider.of<CounterBlock>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: BlocBuilder<CounterBlock, int>(
        builder: (context, count) {
          return Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$count',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  MaterialButton(
                      color: Colors.green,
                      child: Text(
                        "My Daily Quotes",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BlocProvider(
                                create: (context) => QuoteBloc(
                                    quoteRepository: _quoteRepository),
                                child: QuotesScreen())));
                      })
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterbloc.add(CounterEvent.increment);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
