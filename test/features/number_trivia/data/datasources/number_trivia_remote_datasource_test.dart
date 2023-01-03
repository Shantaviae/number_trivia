import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/core/error/exceptions.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/number_trivia_remote_datasource.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';

import '../../../../core/fixtures/fixture_reader.dart';
@GenerateNiceMocks([MockSpec<Client>()])
import 'number_trivia_remote_datasource_test.mocks.dart';

void main() {
  late MockClient mockHttpClient;
  late NumberTriviaRemoteDatasourceImpl datasource;

  setUp(
    () {
      mockHttpClient = MockClient();
      datasource = NumberTriviaRemoteDatasourceImpl(httpClient: mockHttpClient);
    },
  );

  group(
    'getConcreteNumberTrivia',
    () {
      const tNumber = 1;
      final uri = Uri.parse('$API_URL/$tNumber');
      final fixture = getFixture('trivia.json');
      final tNumberTriviaModel =
          NumberTriviaModel.fromJson(json.decode(fixture));
      test(
        "should perform GET requst on URL with number as endpoint and application/json as header",
        () async {
          //arrange
          when(mockHttpClient.get(uri, headers: API_HEADER))
              .thenAnswer((_) async => Response(fixture, 200));
          //act
          datasource.getConcreteNumberTrivia(tNumber);
          //assert
          verify(mockHttpClient.get(uri, headers: API_HEADER));
        },
      );
      test(
        "should return NumberTrivia when response code is 200 (sucess)",
        () async {
          //arrange
          when(mockHttpClient.get(uri, headers: API_HEADER))
              .thenAnswer((_) async => Response(fixture, 200));
          //act
          final result = await datasource.getConcreteNumberTrivia(tNumber);
          //assert
          expect(result, tNumberTriviaModel);
        },
      );
      test(
        "should throw Server Exception when response code is not 200 (failure)",
        () async {
          //arrange
          when(mockHttpClient.get(uri, headers: API_HEADER))
              .thenAnswer((_) async => Response('Error', 404));
          //act
          final call = datasource.getConcreteNumberTrivia(tNumber);
          //assert
          expect(() => call, throwsA(const TypeMatcher<ServerException>()));
        },
      );
    },
  );
  group(
    'getRandomNumberTrivia',
    () {
      final uri = Uri.parse('$API_URL/random');
      final fixture = getFixture('trivia.json');
      final tNumberTriviaModel =
          NumberTriviaModel.fromJson(json.decode(fixture));
      test(
        "should perform GET requst on URL with number as endpoint and application/json as header",
        () async {
          //arrange
          when(mockHttpClient.get(uri, headers: API_HEADER))
              .thenAnswer((_) async => Response(fixture, 200));
          //act
          datasource.getRandomNumberTrivia();
          //assert
          verify(mockHttpClient.get(uri, headers: API_HEADER));
        },
      );
      test(
        "should return NumberTrivia when response code is 200 (sucess)",
        () async {
          //arrange
          when(mockHttpClient.get(uri, headers: API_HEADER))
              .thenAnswer((_) async => Response(fixture, 200));
          //act
          final result = await datasource.getRandomNumberTrivia();
          //assert
          expect(result, tNumberTriviaModel);
        },
      );
      test(
        "should throw Server Exception when response code is not 200 (failure)",
        () async {
          //arrange
          when(mockHttpClient.get(uri, headers: API_HEADER))
              .thenAnswer((_) async => Response('Error', 404));
          //act
          final call = datasource.getRandomNumberTrivia();
          //assert
          expect(() => call, throwsA(const TypeMatcher<ServerException>()));
        },
      );
    },
  );
}
