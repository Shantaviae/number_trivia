import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/core/error/failures.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/core/utilties/input_converter.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:number_trivia/features/number_trivia/presentation/view_logic/number_trivia_view_logic.dart';
import 'package:number_trivia/features/number_trivia/presentation/view_logic/number_trivia_view_state.dart';

@GenerateNiceMocks([MockSpec<GetConcreteNumberTrivia>()])
@GenerateNiceMocks([MockSpec<GetRandomNumberTrivia>()])
@GenerateNiceMocks([MockSpec<InputConverter>()])
import 'number_trivia_view_logic_test.mocks.dart';

void main() {
  late NumberTriviaViewLogic viewLogic;
  late MockGetConcreteNumberTrivia mockGetConcreteNumberTrivia;
  late MockGetRandomNumberTrivia mockGetRandomNumberTrivia;
  late MockInputConverter mockInputConverter;

  setUp(
    () {
      mockGetConcreteNumberTrivia = MockGetConcreteNumberTrivia();
      mockGetRandomNumberTrivia = MockGetRandomNumberTrivia();
      mockInputConverter = MockInputConverter();
      viewLogic = NumberTriviaViewLogic(
        getConcreteNumberTrivia: mockGetConcreteNumberTrivia,
        getRandomNumberTrivia: mockGetRandomNumberTrivia,
        inputConverter: mockInputConverter,
      );
    },
  );

  test(
    "initialState should by Empty",
    () async {
      //assert
      expect(viewLogic.state, equals(const NumberTriviaViewInitial()));
    },
  );

  group(
    'getTriviaForConcreteNumber',
    () {
      const tNumber = 1;
      const tNumberTrivia = NumberTrivia(text: 'Text Trivia', number: 1);

      test(
        "should call the InputConverter to validate and convert the number to an unsigned integer",
        () async {
          //arrange
          const number = '1';
          when(mockInputConverter.stringToUnsignedInteger(number))
              .thenReturn(const Right(tNumber));
          when(mockGetConcreteNumberTrivia(Params(number: tNumber)))
              .thenAnswer((_) async => Right(tNumberTrivia));
          //act
          viewLogic.getTriviaForConcreteNumber(number);
          //assert
          verify(mockInputConverter.stringToUnsignedInteger(number));
        },
      );

      test(
        'should set state to [Error] when the input is invalid',
        () async {
          //assert
          expect(viewLogic.state, equals(const NumberTriviaViewInitial()));
          // arrange
          const number = '-1';
          when(mockInputConverter.stringToUnsignedInteger(number))
              .thenReturn(Left(InvalidInputFailure()));
          // act
          viewLogic.getTriviaForConcreteNumber(number);
          // assert
          expect(viewLogic.state,
              NumberTriviaViewError(message: INVALID_INPUT_FAILURE_MESSAGE));
        },
      );
      test(
        'should get data from the concrete use case',
        () async {
          // arrange
          const number = '1';
          when(mockInputConverter.stringToUnsignedInteger(number))
              .thenReturn(Right(tNumber));
          when(mockGetConcreteNumberTrivia(Params(number: tNumber)))
              .thenAnswer((_) async => Right(tNumberTrivia));
          // act
          viewLogic.getTriviaForConcreteNumber(number);
          // assert
          verify(mockGetConcreteNumberTrivia(Params(number: tNumber)));
        },
      );
      test(
        'should emit [Loading] state while data is being retrieved',
        () async {
          // arrange
          const number = '1';
          when(mockInputConverter.stringToUnsignedInteger(number))
              .thenReturn(Right(tNumber));
          when(mockGetConcreteNumberTrivia(Params(number: tNumber)))
              .thenAnswer((_) async => Right(tNumberTrivia));
          //assert
          expect(viewLogic.state, equals(const NumberTriviaViewInitial()));
          // act
          viewLogic.getTriviaForConcreteNumber(number);
          // assert
          expect(viewLogic.state, NumberTriviaViewLoading());
        },
      );
      test(
        'should emit [Loaded] state when data is gotten successfully',
        () async {
          // arrange
          const number = '1';
          when(mockInputConverter.stringToUnsignedInteger(number))
              .thenReturn(Right(tNumber));
          when(mockGetConcreteNumberTrivia(Params(number: tNumber)))
              .thenAnswer((_) async => Right(tNumberTrivia));
          //assert
          expect(viewLogic.state, equals(const NumberTriviaViewInitial()));
          // act
          await viewLogic.getTriviaForConcreteNumber(number);
          // assert
          expect(viewLogic.state, NumberTriviaViewLoaded(tNumberTrivia));
        },
      );
      test(
        'should emit [Error] state when there is a server failure',
        () async {
          // arrange
          const number = '1';
          when(mockInputConverter.stringToUnsignedInteger(number))
              .thenReturn(Right(tNumber));
          when(mockGetConcreteNumberTrivia(Params(number: tNumber)))
              .thenAnswer((_) async => Left(ServerFailure()));
          //assert
          expect(viewLogic.state, equals(const NumberTriviaViewInitial()));
          // act
          await viewLogic.getTriviaForConcreteNumber(number);
          // assert
          expect(viewLogic.state,
              NumberTriviaViewError(message: SERVER_FAILURE_MESSAGE));
        },
      );
      test(
        'should emit [Error] state when there is a cache failure',
        () async {
          // arrange
          const number = '1';
          when(mockInputConverter.stringToUnsignedInteger(number))
              .thenReturn(Right(tNumber));
          when(mockGetConcreteNumberTrivia(Params(number: tNumber)))
              .thenAnswer((_) async => Left(CacheFailure()));
          //assert
          expect(viewLogic.state, equals(const NumberTriviaViewInitial()));
          // act
          await viewLogic.getTriviaForConcreteNumber(number);
          // assert
          expect(viewLogic.state,
              NumberTriviaViewError(message: CACHE_FAILURE_MESSAGE));
        },
      );
    },
  );
  group(
    'getTriviaForRandomNumber',
    () {
      const tNumberTrivia = NumberTrivia(text: 'Text Trivia', number: 1);
      test(
        'should get data from the random use case',
        () async {
          // arrange
          when(mockGetRandomNumberTrivia(NoParams()))
              .thenAnswer((_) async => Right(tNumberTrivia));
          // act
          viewLogic.getTriviaForRandomNumber();
          // assert
          verify(mockGetRandomNumberTrivia(NoParams()));
        },
      );
      test(
        'should emit [Loading] state while data is being retrieved',
        () async {
          // arrange
          when(mockGetRandomNumberTrivia(NoParams()))
              .thenAnswer((_) async => Right(tNumberTrivia));
          //assert
          expect(viewLogic.state, equals(const NumberTriviaViewInitial()));
          // act
          viewLogic.getTriviaForRandomNumber();
          // assert
          expect(viewLogic.state, NumberTriviaViewLoading());
        },
      );
      test(
        'should emit [Loaded] state when data is gotten successfully',
        () async {
          // arrange
          when(mockGetRandomNumberTrivia(NoParams()))
              .thenAnswer((_) async => Right(tNumberTrivia));
          //assert
          expect(viewLogic.state, equals(const NumberTriviaViewInitial()));
          // act
          await viewLogic.getTriviaForRandomNumber();
          // assert
          expect(viewLogic.state, NumberTriviaViewLoaded(tNumberTrivia));
        },
      );
      test(
        'should emit [Error] state when there is a server failure',
        () async {
          // arrange
          when(mockGetRandomNumberTrivia(NoParams()))
              .thenAnswer((_) async => Left(ServerFailure()));
          //assert
          expect(viewLogic.state, equals(const NumberTriviaViewInitial()));
          // act
          await viewLogic.getTriviaForRandomNumber();
          // assert
          expect(viewLogic.state,
              NumberTriviaViewError(message: SERVER_FAILURE_MESSAGE));
        },
      );
      test(
        'should emit [Error] state when there is a cache failure',
        () async {
          // arrange
          when(mockGetRandomNumberTrivia(NoParams()))
              .thenAnswer((_) async => Left(CacheFailure()));
          //assert
          expect(viewLogic.state, equals(const NumberTriviaViewInitial()));
          // act
          await viewLogic.getTriviaForRandomNumber();
          // assert
          expect(viewLogic.state,
              NumberTriviaViewError(message: CACHE_FAILURE_MESSAGE));
        },
      );
    },
  );
}
