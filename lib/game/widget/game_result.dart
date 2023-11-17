import 'package:flutter/material.dart';
import '../enum.dart';

class GameResult extends StatelessWidget {
  final bool isDone;
  final Result? result;
  //플레이어가 입력 전에는 결과는 알 수 없음
  final VoidCallback callback;

  const GameResult(
      {required this.isDone, required this.callback, this.result, super.key});

  @override
  Widget build(BuildContext context) {
    if (isDone) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            result!.displayString,
            //isDone 시점엔 result가 널일 수 없음
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          TextButton(
              onPressed: () => callback.call(),
              child: const Text(
                '다시하기',
                style: TextStyle(fontSize: 20),
              ))
          //다시 초기화 하는 버튼
        ],
      );
    }
    return const Center(
      child: Text(
        '가위, 바위, 보 중 하나를 선택 해 주세요',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
