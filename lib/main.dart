import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:number_trivia/features/number_trivia/presentation/view_logic/number_trivia_view_logic.dart';
import 'package:number_trivia/features/number_trivia/presentation/views/number_trivia_view.dart';
import 'package:number_trivia/injection_container.dart' as di;

final sl = GetIt.instance;
void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    BlocProvider(
      create: (_) => NumberTriviaViewLogic(
        getConcreteNumberTrivia: sl(),
        getRandomNumberTrivia: sl(),
        inputConverter: sl(),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Trivia',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const NumberTriviaView(),
    );
  }
}
