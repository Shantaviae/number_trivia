import 'dart:convert';

import 'package:number_trivia/core/error/exceptions.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CACHE_KEY = 'CACHED_NUMBER_TRIVIA';

abstract class NumberTriviaLocalDatasource {
  /// Gets the cached [NumberTriviaModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<NumberTriviaModel> getLastNumberTrivia();

  /// Caches [NumberTriviaModel] locally.
  Future<void> cacheNumberTrivia(NumberTriviaModel numberTriva);
}

class NumberTriviaLocalDatasourceImpl implements NumberTriviaLocalDatasource {
  final SharedPreferences sharedPreferences;

  NumberTriviaLocalDatasourceImpl({required this.sharedPreferences});

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() async {
    final triviaJsonString = sharedPreferences.getString(CACHE_KEY);
    if (triviaJsonString != null) {
      final triviaJson = json.decode(triviaJsonString);
      return Future.value(NumberTriviaModel.fromJson(triviaJson));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel numberTriva) async {
    final jsonString = json.encode(numberTriva.toJson());
    sharedPreferences.setString(CACHE_KEY, jsonString);
  }
}
