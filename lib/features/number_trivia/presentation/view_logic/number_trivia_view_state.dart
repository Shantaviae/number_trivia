import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

part 'number_trivia_view_state.freezed.dart';

@freezed
class NumberTriviaViewState with _$NumberTriviaViewState {
  const factory NumberTriviaViewState.loaded(NumberTrivia trivia) =
      NumberTriviaViewLoaded;
  const factory NumberTriviaViewState.initial() = NumberTriviaViewInitial;
  const factory NumberTriviaViewState.loading() = NumberTriviaViewLoading;
  const factory NumberTriviaViewState.error({required String message}) =
      NumberTriviaViewError;
}

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';
