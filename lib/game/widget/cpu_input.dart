import 'package:ex_01_rock_scissor_paper/game/enum.dart';
import 'package:ex_01_rock_scissor_paper/game/widget/input_card.dart';
import 'package:flutter/material.dart';

class CpuInput extends StatelessWidget {
  final InputType cpuInput;
  final bool isDone;

  const CpuInput({required this.isDone, required this.cpuInput, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Expanded(child: SizedBox.shrink()),
          //컴퓨터 출력 크기를 맞춰주기위한 expanded box
          //리소스 차원에서 컨테이너 보다 SizedBox.shrink쪽이 좋다.
          InputCard(
              child:getCpuInput()
          ),
          Expanded(child: SizedBox.shrink())
          
        ]
    );
  }

  Widget getCpuInput() {
    if (isDone)
      {
        return Image.asset(cpuInput.path);
      }
    return const SizedBox(
        // width: 64,
        height: 80,
        child: Center(
            child: Text(
              '?',
              style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.bold),
            )
        )
    );
  }
}

