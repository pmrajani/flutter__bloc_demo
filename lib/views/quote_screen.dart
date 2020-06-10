import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_demo/bloc/bloc.dart';

class QuotesScreen extends StatefulWidget {
  @override
  _QuotesScreenState createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Quotes"),
        ),
        body: BlocBuilder<QuoteBloc, QuoteState>(
          builder: (context, state) {
            if (state is QuoteEmpty) {
              BlocProvider.of<QuoteBloc>(context).add(FetchQuote());
            }
            if (state is QuoteError) {
              return Center(
                child: Text(state.errorMsg),
              );
            }
            if (state is QuoteLoaded) {
              return ListTile(
                title: Text(
                  state.quote.quoteText,
                  textAlign: TextAlign.center,
                ),
                isThreeLine: true,
                subtitle:
                    Text('~ ${state.quote.quoteAuthor}', textAlign: TextAlign.center),
                dense: false,
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
