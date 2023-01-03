import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

@GenerateNiceMocks([MockSpec<NumberTriviaRepository>()])
import 'get_random_number_trivia_test.mocks.dart';

void main() {
  final mockNumberTriviaRepository = MockNumberTriviaRepository();
  final usecase = GetRandomNumberTrivia(repository: mockNumberTriviaRepository);

  const tNumberTrivia = NumberTrivia(text: 'text', number: 1);

  test(
    'should get trivia for random number from the repository',
    () async {
      when(mockNumberTriviaRepository.getRandomNumberTrivia())
          .thenAnswer((_) async => const Right(tNumberTrivia));

      final result = await usecase(NoParams());

      expect(result, const Right(tNumberTrivia));

      verify(mockNumberTriviaRepository.getRandomNumberTrivia());
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
