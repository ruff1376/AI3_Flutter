void main(List<String> args) {
  int number = 0;

  // ⚜ if, ife
  if (number > 0) {
    print('양수입니다.');
  } else if (number < 0) {
    print('음수입니다.');
  } else {
    print('0입니다.');
  }

  String grade = "B";
  // ⚜ switch
  // Dart에서는 break 쓰지 않아도 case 블록만 실행한다.
  // case에서 break가 적용되지 않게 하려면 continue를 써야한다.
  switch (grade) {
    case "A":
      print('A 학점');
    // break;
    case "B":
      print('B 학점');
    // break;
    case "C":
      print('C 학점');
    // break;
    default:
      print('유효하지 않습니다');
  }
}
