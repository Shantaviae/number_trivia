import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/core/error/exceptions.dart';
import 'package:number_trivia/core/error/failures.dart';
import 'package:number_trivia/core/network/network_info.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/number_trivia_local_datasource.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/number_trivia_remote_datasource.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:number_trivia/features/number_trivia/data/repositiories/number_trivia_repository_impl.dart';

@GenerateNiceMocks([MockSpec<NumberTriviaRemoteDatasource>()])
@GenerateNiceMocks([MockSpec<NumberTriviaLocalDatasource>()])
@GenerateNiceMocks([MockSpec<NetworkInfo>()])
import 'number_trivia_repository_impl_test.mocks.dart';

void main() {
  late MockNumberTriviaRemoteDatasource mockRemoteDatasource;
  late MockNumberTriviaLocalDatasource mockLocalDatasource;
  late MockNetworkInfo mockNetworkInfo;
  late NumberTriviaRepositoryImpl repository;

  setUp(
    () {
      mockRemoteDatasource = MockNumberTriviaRemoteDatasource();
      mockLocalDatasource = MockNumberTriviaLocalDatasource();
      mockNetworkInfo = MockNetworkInfo();
      repository = NumberTriviaRepositoryImpl(
        remoteDatasource: mockRemoteDatasource,
        localDatasource: mockLocalDatasource,
        networkInfo: mockNetworkInfo,
      );
    },
  );

  void runTestASConnected({
    required bool isOnline,
    required Function testBody,
  }) {
    group(
      'device is ${isOnline ? "online" : "offline"}',
      () {
        setUp(
          () {
            when(mockNetworkInfo.isConnected).thenAnswer((_) async => isOnline);
          },
        );
        testBody();
      },
    );
  }

  group(
    'getConcreteNumberTrivia',
    () {
      const tNumber = 1;
      const tNumberTriviaModel = NumberTriviaModel(text: 'Test', number: 1);

      test(
        "should check if device is online",
        () async {
          //arrange
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          //act
          repository.getConcreteNumberTrivia(tNumber);
          //assert
          verify(mockNetworkInfo.isConnected);
        },
      );

      runTestASConnected(
        isOnline: true,
        testBody: () {
          test(
            "should return remote data when the call to remote data source is succesful",
            () async {
              //arrange
              when(mockRemoteDatasource.getConcreteNumberTrivia(tNumber))
                  .thenAnswer((_) async => tNumberTriviaModel);
              //act
              final result = await repository.getConcreteNumberTrivia(tNumber);
              //assert
              expect(result, equals(const Right(tNumberTriviaModel)));
              verify(mockRemoteDatasource.getConcreteNumberTrivia(tNumber));
            },
          );
          test(
            "should cache data locally when the call to remote data source is succesful",
            () async {
              //arrange
              when(mockRemoteDatasource.getConcreteNumberTrivia(tNumber))
                  .thenAnswer((_) async => tNumberTriviaModel);
              //act
              await repository.getConcreteNumberTrivia(tNumber);
              //assert
              verify(mockRemoteDatasource.getConcreteNumberTrivia(tNumber));
              verify(mockLocalDatasource.cacheNumberTrivia(tNumberTriviaModel));
            },
          );
          test(
            "should return failure when the call to remote data source is unsuccesful",
            () async {
              //arrange
              when(mockRemoteDatasource.getConcreteNumberTrivia(tNumber))
                  .thenThrow(ServerException());
              //act
              final result = await repository.getConcreteNumberTrivia(tNumber);
              //assert
              expect(result, equals(Left(ServerFailure())));
              verify(mockRemoteDatasource.getConcreteNumberTrivia(tNumber));
              verifyZeroInteractions(mockLocalDatasource);
            },
          );
        },
      );
      runTestASConnected(
        isOnline: false,
        testBody: () {
          test(
            "should return last locally cached data when the cache data is present",
            () async {
              //arrange
              when(mockLocalDatasource.getLastNumberTrivia())
                  .thenAnswer((_) async => tNumberTriviaModel);
              //act
              final result = await repository.getConcreteNumberTrivia(tNumber);
              //assert
              expect(result, equals(const Right(tNumberTriviaModel)));
              verifyZeroInteractions(mockRemoteDatasource);
              verify(mockLocalDatasource.getLastNumberTrivia());
            },
          );
          test(
            "should return cache failure when there is no cached data",
            () async {
              //arrange
              when(mockLocalDatasource.getLastNumberTrivia())
                  .thenThrow(CacheException());
              //act
              final result = await repository.getConcreteNumberTrivia(tNumber);
              //assert
              expect(result, equals(Left(CacheFailure())));
              verifyZeroInteractions(mockRemoteDatasource);
              verify(mockLocalDatasource.getLastNumberTrivia());
            },
          );
        },
      );
    },
  );
  group(
    'getRandomNumberTrivia',
    () {
      const tNumberTriviaModel = NumberTriviaModel(text: 'Test', number: 123);

      test(
        "should check if device is online",
        () async {
          //arrange
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          //act
          repository.getRandomNumberTrivia();
          //assert
          verify(mockNetworkInfo.isConnected);
        },
      );

      runTestASConnected(
        isOnline: true,
        testBody: () {
          test(
            "should return remote data when the call to remote data source is succesful",
            () async {
              //arrange
              when(mockRemoteDatasource.getRandomNumberTrivia())
                  .thenAnswer((_) async => tNumberTriviaModel);
              //act
              final result = await repository.getRandomNumberTrivia();
              //assert
              expect(result, equals(const Right(tNumberTriviaModel)));
              verify(mockRemoteDatasource.getRandomNumberTrivia());
            },
          );
          test(
            "should cache data locally when the call to remote data source is succesful",
            () async {
              //arrange
              when(mockRemoteDatasource.getRandomNumberTrivia())
                  .thenAnswer((_) async => tNumberTriviaModel);
              //act
              await repository.getRandomNumberTrivia();
              //assert
              verify(mockRemoteDatasource.getRandomNumberTrivia());
              verify(mockLocalDatasource.cacheNumberTrivia(tNumberTriviaModel));
            },
          );
          test(
            "should return failure when the call to remote data source is unsuccesful",
            () async {
              //arrange
              when(mockRemoteDatasource.getRandomNumberTrivia())
                  .thenThrow(ServerException());
              //act
              final result = await repository.getRandomNumberTrivia();
              //assert
              expect(result, equals(Left(ServerFailure())));
              verify(mockRemoteDatasource.getRandomNumberTrivia());
              verifyZeroInteractions(mockLocalDatasource);
            },
          );
        },
      );
      runTestASConnected(
        isOnline: false,
        testBody: () {
          test(
            "should return last locally cached data when the cache data is present",
            () async {
              //arrange
              when(mockLocalDatasource.getLastNumberTrivia())
                  .thenAnswer((_) async => tNumberTriviaModel);
              //act
              final result = await repository.getRandomNumberTrivia();
              //assert
              expect(result, equals(const Right(tNumberTriviaModel)));
              verifyZeroInteractions(mockRemoteDatasource);
              verify(mockLocalDatasource.getLastNumberTrivia());
            },
          );
          test(
            "should return cache failure when there is no cached data",
            () async {
              //arrange
              when(mockLocalDatasource.getLastNumberTrivia())
                  .thenThrow(CacheException());
              //act
              final result = await repository.getRandomNumberTrivia();
              //assert
              expect(result, equals(Left(CacheFailure())));
              verifyZeroInteractions(mockRemoteDatasource);
              verify(mockLocalDatasource.getLastNumberTrivia());
            },
          );
        },
      );
    },
  );
}
