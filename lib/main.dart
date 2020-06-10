import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';
import 'views/home_page.dart';

void main() => runApp(MyApp());

//Reference
//https://medium.com/flutter-community/flutter-essential-what-you-need-to-know-567ad25dcd8f

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => CounterBlock(),
          child: MyHomePage(),
        ));
  }
}

