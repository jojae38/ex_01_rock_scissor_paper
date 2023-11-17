const assetPath = 'assets/images';


enum InputType
{
  rock,
  scissors,
  paper;

  String get path => '$assetPath/$name.png';
  //name 은 enum 의 element 값을 가져온다.
}

enum Result{
  playerWin('Player 승리'),
  draw('무승부'),
  cpuWin('Player 패배');

  const Result(this.displayString);
  final String displayString;
}