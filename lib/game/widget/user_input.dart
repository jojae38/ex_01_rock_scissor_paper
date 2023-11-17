import 'package:flutter/material.dart';

import '../enum.dart';
import 'input_card.dart';

class UserInput extends StatelessWidget {
  final bool isDone;
  final InputType? userInput;
  final Function(InputType) callback;

  const UserInput({this.userInput,required this.isDone, required this.callback, super.key});

  @override
  Widget build(BuildContext context) {
    if (isDone) {
      return Row(
        children: [
          const Expanded(child: SizedBox.shrink()),
          InputCard(child: Image.asset(userInput!.path)),
          //isDone 시점에선 플레이어 결과값이 정해짐
          const Expanded(child: SizedBox.shrink()),
        ],
      );
    }
    return Row(
      children: _getInputs(callback),
    );
  }

  List<Widget> _getInputs(Function(InputType) callback) {
    return InputType.values
        .map((type) => InputCard(
              child: Image.asset(type.path),
              callback: () => callback.call(type),
            ))
        .toList(); //List 객체로 돌려줘야함
  }
}
