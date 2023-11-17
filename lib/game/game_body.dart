import 'dart:math';

import 'package:flutter/material.dart';

import 'enum.dart';
import 'widget/cpu_input.dart';
import 'widget/game_result.dart';
import 'widget/user_input.dart';

class GameBody extends StatefulWidget {
  const GameBody({super.key});

  @override
  State<GameBody> createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  late bool isDone;
  InputType? _userInput;
  late InputType _cpuInput;
  //외부로 나갈 필요가 없는 변수는 _를 붙여준다.

  @override
  void initState() {
    super.initState();
    isDone = false;
    setCpuInput();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: CpuInput(isDone: isDone,cpuInput: _cpuInput,)),//컴퓨터 출력
        Expanded(child: GameResult(isDone: isDone,callback: reset,result: getResult())),//게임 결과 출력
        Expanded(child: UserInput(isDone: isDone,callback: setUserInput,userInput: _userInput,)),//유저 선택
      ],
    );
  }
  void setUserInput(InputType userInput)
  {
    setState(() {
      isDone = true;
      _userInput = userInput;
      //userInput 동기화 및 isDone 트리거
    });
  }

  void setCpuInput()
  {
    final random = Random();
    _cpuInput = InputType.values[random.nextInt(3)];
  }

  void reset()
  {
    setState(() {
      isDone = false;
      setCpuInput();
      //cpu 입력 값 랜덤으로 돌리기
    });
  }

  Result? getResult(){
    if(_userInput == null) return null;
    switch(_userInput!){
      case InputType.rock:
        switch(_cpuInput) {
          case InputType.rock:
            return Result.draw;
          case InputType.scissors:
            return Result.playerWin;
          case InputType.paper:
            return Result.cpuWin;
        }
      case InputType.scissors:
        switch(_cpuInput) {
          case InputType.rock:
            return Result.cpuWin;
          case InputType.scissors:
            return Result.draw;
          case InputType.paper:
            return Result.playerWin;
        }
      case InputType.paper:
        switch(_cpuInput) {
          case InputType.rock:
            return Result.playerWin;
          case InputType.scissors:
            return Result.cpuWin;
          case InputType.paper:
            return Result.draw;
        }
    }

  }
}
