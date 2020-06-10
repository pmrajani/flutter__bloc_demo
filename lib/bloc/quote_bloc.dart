import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_block_demo/model/quote.dart';
import 'package:flutter_block_demo/repository/quote_repository.dart';
import './bloc.dart';
import '../network/error_utils.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteRepository quoteRepository;
  QuoteBloc({@required this.quoteRepository});

  @override
  QuoteState get initialState => QuoteEmpty();

  @override
  Stream<QuoteState> mapEventToState(QuoteEvent event) async* {
    // TODO: Add Logic
    if(event is FetchQuote){
      yield QuoteLoading();
      try {
        Quote quote = await quoteRepository.fetchQuote();
        yield QuoteLoaded(quote: quote);
      } catch (e) {
        yield QuoteError(errorMsg: onError(e));
      }
    }
  }
}
