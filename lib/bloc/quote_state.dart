import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_block_demo/model/quote.dart';

abstract class QuoteState extends Equatable {
  const QuoteState();

  @override
  List<Object> get props => [];
}

class QuoteEmpty extends QuoteState {}

class QuoteLoading extends QuoteState {}

class QuoteLoaded extends QuoteState {
  final Quote quote;

  const QuoteLoaded({@required this.quote}) : assert(quote != null);

  @override
  List<Object> get props => [quote];
}

class QuoteError extends QuoteState {
  final String errorMsg;
  const QuoteError({@required this.errorMsg});
}
