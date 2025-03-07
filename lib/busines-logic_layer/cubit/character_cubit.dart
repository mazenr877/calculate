import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit() : super(CharacterInitial());
  static CharacterCubit get(context) => BlocProvider.of(context);
  var question = '';
  var answer = '';
  questions(var x) {
    question += x;
    print(question);
    emit(CharacterLodded());
  }

  clacuateanswer(context) {
    final qustioning = CharacterCubit.get(context).question;
    Parser p = Parser();
    Expression exp = p.parse(qustioning);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    CharacterCubit.get(context).answer = eval.toString();
    emit(CharacterLodded());
  }

  dell(context) {
    CharacterCubit.get(context).question = CharacterCubit.get(context)
        .question
        .substring(0, CharacterCubit.get(context).question.length - 1);
    emit(CharacterLodded());
  }

  removeall(context) {
    CharacterCubit.get(context).question = '';
    CharacterCubit.get(context).answer = '';
    emit(CharacterLodded());
  }

  answers(var x) {
    answer += x;
    print(answer);
    emit(CharacterLodded());
  }

  List calculate = [
    "c",
    "DELL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "*",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ANS",
    "="
  ];
  bool isoperate(var x) {
    if (x == "/" || x == "%" || x == "*" || x == "+" || x == "-" || x == "=") {
      return true;
    }
    return false;
  }
}
