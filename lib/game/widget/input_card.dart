import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  final VoidCallback? callback;
  //터치가 필요하지 않은 영역이 존재할 수 있기에 ? 로 nullable이 가능하게 만든다.
  final Widget child;

  const InputCard({this.callback,required this.child, super.key,});
  //required는 꼭 필요한거 필요할 수도 안할수도 있는 것은 required를 안 붙여준다.
  //그래서 위에서 callback 변수에 ? nullable을 설정한 것!

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(onTap: ()=>callback?.call(),child: InputContests(child: child)),
      //InkWell로 onTap 활성화
    );
  }
}

class InputContests extends StatelessWidget {
  const InputContests({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey,width: 8),
      ),
      child: child,
    );
  }
}
