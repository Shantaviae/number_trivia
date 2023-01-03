import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';

@GenerateNiceMocks([MockSpec<NumberTriviaRepository>()])
import 'get_concrete_number_trivia_test.mocks.dart';

void main() {
  final mockNumberTriviaRepository = MockNumberTriviaRepository();
  final usecase = GetConcreteNumberTrivia(
    repository: mockNumberTriviaRepository,
  );

  const tNumber = 1;
  const tNumberTrivia = NumberTrivia(text: 'text', number: 1);

  test(
    'should get trivia from the number from the repository',
    () async {
      when(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber))
          .thenAnswer((_) async => const Right(tNumberTrivia));

      final result = await usecase(const Params(number: tNumber));

      expect(result, const Right(tNumberTrivia));

      verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
