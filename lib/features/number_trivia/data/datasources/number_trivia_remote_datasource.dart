import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' show Client;
import 'package:number_trivia/core/error/exceptions.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';

const API_URL = 'http://numbersapi.com/';
const API_HEADER = {HttpHeaders.contentTypeHeader: 'application/json'};

abstract class NumberTriviaRemoteDatasource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDatasourceImpl implements NumberTriviaRemoteDatasource {
  final Client httpClient;

  NumberTriviaRemoteDatasourceImpl({required this.httpClient});

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) =>
      _getTriviaAtEndpoint('$number');

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() =>
      _getTriviaAtEndpoint('random');

  Future<NumberTriviaModel> _getTriviaAtEndpoint(String endpoint) async {
    final uri = Uri.parse('$API_URL$endpoint');
    print('URL: $API_URL/$endpoint');
    final response = await httpClient.get(uri, headers: API_HEADER);
    print('api response: ${response.body}');
    if (response.statusCode == 200) {
      return NumberTriviaModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
