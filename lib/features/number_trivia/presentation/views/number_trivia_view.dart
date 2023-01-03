import 'package:flutter/material.dart';
import 'package:number_trivia/features/number_trivia/presentation/widgets/message_or_loading_display.dart';
import 'package:number_trivia/features/number_trivia/presentation/widgets/number_trivia_controls.dart';

class NumberTriviaView extends StatelessWidget {
  const NumberTriviaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Trivia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(height: 10),
            MessageOrLoadingDisplay(),
            NumberTriviaControls(),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
