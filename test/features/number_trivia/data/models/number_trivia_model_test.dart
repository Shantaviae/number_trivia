import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../../core/fixtures/fixture_reader.dart';

void main() {
  const tNumberTriviaModel = NumberTriviaModel(text: 'Test Text', number: 1);

  test(
    'should be a subclass of NumberTrivia entity',
    () async {
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );

  group(
    'fromJson',
    () {
      test(
        "should return a valid model when the JSON number is an integer",
        () async {
          //arrange
          final Map<String, dynamic> jsonMap =
              json.decode(getFixture('trivia.json'));

          //act
          final result = NumberTriviaModel.fromJson(jsonMap);

          //assert
          expect(result, tNumberTriviaModel);
        },
      );
      test(
        "should return a valid model when the JSON number is a double",
        () async {
          //arrange
          final Map<String, dynamic> jsonMap =
              json.decode(getFixture('trivia_double.json'));

          //act
          final result = NumberTriviaModel.fromJson(jsonMap);

          //assert
          expect(result, tNumberTriviaModel);
        },
      );
    },
  );

  group(
    'toJson',
    () {
      test(
        "should return JSON map containing the proper data",
        () async {
          //arrange

          //act
          final result = tNumberTriviaModel.toJson();

          //assert
          final expectedMap = {"text": "Test Text", "number": 1};
          expect(result, expectedMap);
        },
      );
    },
  );
}
