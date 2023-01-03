import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/presentation/view_logic/number_trivia_view_logic.dart';
import 'package:number_trivia/features/number_trivia/presentation/view_logic/number_trivia_view_state.dart';

class MessageOrLoadingDisplay extends StatelessWidget {
  const MessageOrLoadingDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final simpleTextStyle = Theme.of(context).textTheme.titleLarge;
    return BlocBuilder<NumberTriviaViewLogic, NumberTriviaViewState>(
      builder: (_, viewState) => Expanded(
        flex: 3,
        child: Center(
          child: viewState.map(
            initial: (_) => Text('Start searching!', style: simpleTextStyle),
            loading: (_) => CircularProgressIndicator(),
            loaded: (loaded) => _LoadedNumberTriviaDisplay(loaded.trivia),
            error: (error) => Text(error.message, style: simpleTextStyle),
          ),
        ),
      ),
    );
  }
}

class _LoadedNumberTriviaDisplay extends StatelessWidget {
  const _LoadedNumberTriviaDisplay(this.numberTrivia);
  final NumberTrivia numberTrivia;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Fixed size, doesn't scroll
        Text(
          numberTrivia.number.toString(),
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Expanded makes it fill in all the remaining space
        Expanded(
          child: Center(
            // Only the trivia "message" part will be scrollable
            child: SingleChildScrollView(
              child: Text(
                numberTrivia.text,
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }
}
