import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia/core/error/failures.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/core/utilties/input_converter.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:number_trivia/features/number_trivia/presentation/view_logic/number_trivia_view_state.dart';

typedef GetTrivia = Future<Either<Failure, NumberTrivia>> Function();

const INVALID_INPUT_ERROR_STATE =
    NumberTriviaViewError(message: INVALID_INPUT_FAILURE_MESSAGE);
const SERVER_ERROR_STATE =
    NumberTriviaViewError(message: SERVER_FAILURE_MESSAGE);
const CACHE_ERROR_STATE = NumberTriviaViewError(message: CACHE_FAILURE_MESSAGE);

class NumberTriviaViewLogic extends Cubit<NumberTriviaViewState> {
  NumberTriviaViewLogic({
    required this.getConcreteNumberTrivia,
    required this.getRandomNumberTrivia,
    required this.inputConverter,
  }) : super(const NumberTriviaViewInitial());

  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

  Future<void> getTriviaForConcreteNumber(String number) async {
    final inputEither = inputConverter.stringToUnsignedInteger(number);
    await inputEither.fold(
      (_) async => emit(INVALID_INPUT_ERROR_STATE),
      (val) async {
        await _getTrivia(() => getConcreteNumberTrivia(Params(number: val)));
      },
    );
  }

  Future<void> getTriviaForRandomNumber() =>
      _getTrivia(() => getRandomNumberTrivia(NoParams()));

  Future<void> _getTrivia(GetTrivia callback) async {
    emit(NumberTriviaViewLoading());
    final triviaEither = await callback();
    triviaEither.fold(
      (failure) => emit(_mapFailureToErrorState(failure)),
      (numberTrivia) => emit(NumberTriviaViewLoaded(numberTrivia)),
    );
  }

  NumberTriviaViewError _mapFailureToErrorState(Failure failure) {
    // Instead of a regular 'if (failure is ServerFailure)...'
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_ERROR_STATE;
      case CacheFailure:
        return CACHE_ERROR_STATE;
      default:
        return NumberTriviaViewError(message: 'Unexpected Error');
    }
  }
}
