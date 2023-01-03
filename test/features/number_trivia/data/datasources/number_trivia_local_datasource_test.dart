import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/core/error/exceptions.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/number_trivia_local_datasource.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/fixtures/fixture_reader.dart';
@GenerateNiceMocks([MockSpec<SharedPreferences>()])
import 'number_trivia_local_datasource_test.mocks.dart';

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late NumberTriviaLocalDatasourceImpl datasource;

  setUp(
    () {
      mockSharedPreferences = MockSharedPreferences();
      datasource = NumberTriviaLocalDatasourceImpl(
        sharedPreferences: mockSharedPreferences,
      );
    },
  );

  group(
    'getLastNumberTrivia',
    () {
      final fixture = getFixture('trivia_cached.json');
      final tNumberTriviaModel =
          NumberTriviaModel.fromJson(json.decode(fixture));
      test(
        "should return NumberTriviaModel from SharedPreferences when there is one cached",
        () async {
          //arrange
          when(mockSharedPreferences.getString(CACHE_KEY)).thenReturn(fixture);
          //act
          final result = await datasource.getLastNumberTrivia();
          //assert
          verify(mockSharedPreferences.getString(CACHE_KEY));
          expect(result, tNumberTriviaModel);
        },
      );
      test(
        "should throw Cache Exception when there no cached vaue",
        () async {
          //arrange
          when(mockSharedPreferences.getString(CACHE_KEY)).thenReturn(null);
          //act
          final call = datasource.getLastNumberTrivia;
          //assert
          expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
        },
      );
    },
  );

  group(
    'cacheNumberTrivia',
    () {
      const tNumberTriviaModel =
          NumberTriviaModel(number: 1, text: 'test trivia');
      final jsonString = json.encode(tNumberTriviaModel.toJson());

      test(
        "should call SharedPreferences to cache the data",
        () async {
          //act
          datasource.cacheNumberTrivia(tNumberTriviaModel);
          //assert
          verify(mockSharedPreferences.setString(CACHE_KEY, jsonString));
        },
      );
    },
  );
}
