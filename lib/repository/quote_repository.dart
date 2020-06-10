import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_block_demo/model/quote.dart';
import 'package:flutter_block_demo/network/network_client.dart';

class QuoteRepository{
  NetworkClient networkClient;
  QuoteRepository({@required this.networkClient});

  final _baseUrl = 'https://quote-garden.herokuapp.com';

  Future<Quote> fetchQuote() async {
    final result = await networkClient.getWithDio(url: '$_baseUrl/quotes/random');
    return Quote.fromJson(result);
  }
}
