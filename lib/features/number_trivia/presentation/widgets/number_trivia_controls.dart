import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia/features/number_trivia/presentation/view_logic/number_trivia_view_logic.dart';

class NumberTriviaControls extends StatefulWidget {
  const NumberTriviaControls({super.key});

  @override
  State<NumberTriviaControls> createState() => _NumberTriviaControlsState();
}

class _NumberTriviaControlsState extends State<NumberTriviaControls> {
  final controller = TextEditingController();
  String? inputStr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //TextField
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 12),
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Input a number',
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            onChanged: (value) => inputStr = value,
            onSubmitted: (_) => _dispatchConcrete(),
          ),
        ),
        Row(
          children: [
            //Search Concrete Button
            Expanded(
              child: ElevatedButton(
                child: Text('Search'),
                onPressed: _dispatchConcrete,
              ),
            ),
            SizedBox(width: 12),
            //Search Random Button
            Expanded(
              child: ElevatedButton(
                child: Text('Get Random Trivia'),
                onPressed: _dispatchRandom,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _dispatchConcrete() {
    if (inputStr != null) {
      // Clearing the TextField to prepare it for the next inputted number
      controller.clear();
      context
          .read<NumberTriviaViewLogic>()
          .getTriviaForConcreteNumber(inputStr!);
      inputStr = null;
    }
  }

  void _dispatchRandom() {
    controller.clear();
    inputStr = null;
    context.read<NumberTriviaViewLogic>().getTriviaForRandomNumber();
  }
}
