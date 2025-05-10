import 'dart:math';

void main() {
  q1();
  q2();
  q3();
  q3Alt();
  q4();
  q5();
  q6();
  q7();
  q8();
  q9();
  q10();
  q11();
  q12();
  q13();
  q14();
  q15();
  q16();
  q17();
  q18();
  q19();
}

void q1() {
  int number = 12345, count = 0;
  while (number != 0) {
    number ~/= 10;
    count++;
  }
  print("Q1: Number of digits: $count");
}

void q2() {
  int length = 8;
  String chars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  String password = '';
  Random rnd = Random();
  int i = 0;
  while (i < length) {
    password += chars[rnd.nextInt(chars.length)];
    i++;
  }
  print("Q2: Random Password: $password");
}

void q3() {
  String str = "";
  print(str.isEmpty ? "Q3: String is empty" : "Q3: String is not empty");
}

void q3Alt() {
  int number = 5, i = 1;
  print("Q3 (Alt): Multiplication Table of $number");
  while (i <= 10) {
    print("$number x $i = ${number * i}");
    i++;
  }
}

void q4() {
  int i = 1, sum = 0;
  do {
    if (i % 2 != 0) sum += i;
    i++;
  } while (i <= 50);
  print("Q4: Sum of odd numbers from 1 to 50: $sum");
}

void q5() {
  int number = -5;
  String result =
      number > 0
          ? "Positive"
          : number < 0
          ? "Negative"
          : "Zero";
  print("Q5: $result");
}

void q6() {
  int number = 5, factorial = 1;
  while (number > 0) {
    factorial *= number;
    number--;
  }
  print("Q6: Factorial: $factorial");
}

void q7() {
  print("Q7: First 10 prime numbers:");
  int count = 0, num = 2;
  while (count < 10) {
    bool isPrime = true;
    for (int i = 2; i <= num ~/ 2; i++) {
      if (num % i == 0) {
        isPrime = false;
        break;
      }
    }
    if (isPrime) {
      print(num);
      count++;
    }
    num++;
  }
}

void q8() {
  int i = 10;
  print("Q8: Reverse Natural Numbers:");
  while (i >= 1) {
    print(i);
    i--;
  }
}

void q9() {
  int i = 1;
  print("Q9: Squares of numbers from 1 to 5:");
  do {
    print(i * i);
    i++;
  } while (i <= 5);
}

void q10() {
  List<int> numbers = [10, 20, 30, 40, 50];
  int sum = 0, i = 0;
  do {
    sum += numbers[i];
    i++;
  } while (i < numbers.length);
  double average = sum / numbers.length;
  print("Q10: Average: $average");
}

void q11() {
  int number = 39841, largest = 0;
  do {
    int digit = number % 10;
    if (digit > largest) largest = digit;
    number ~/= 10;
  } while (number > 0);
  print("Q11: Largest digit: $largest");
}

void q12() {
  int i = 1;
  print("Q12: Even numbers from 1 to 20:");
  do {
    if (i % 2 == 0) print(i);
    i++;
  } while (i <= 20);
}

void q13() {
  int limit = 10, a = 0, b = 1;
  print("Q13: Fibonacci up to $limit:");
  while (a <= limit) {
    print(a);
    int next = a + b;
    a = b;
    b = next;
  }
}

void q14() {
  List<int> numbers = [3, 9, 1, 6, 4, 2, 8, 5, 7];
  int largest = numbers[0];
  for (int i = 1; i < numbers.length; i++) {
    if (numbers[i] > largest) largest = numbers[i];
  }
  print("Q14: Largest element: $largest");
}

void q15() {
  int number = 5;
  print("Q15: Multiplication Table of $number:");
  for (int i = 1; i <= 10; i++) {
    print("$number x $i = ${number * i}");
  }
}

void q16() {
  String input = "radar";
  String reversed = input.split('').reversed.join();
  print(
    "Q16: ${input == reversed ? '"$input" is a palindrome.' : '"$input" is not a palindrome.'}",
  );
}

void q17() {
  print("Q17: Triangle Pattern:");
  for (int i = 1; i <= 4; i++) {
    print('${'$i' * i}');
  }
}

void q18() {
  List<int> numbers = [1, 3, 5, 7, 9, 2, 6];
  print("Q18: Numbers > 5:");
  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] > 5) print(numbers[i]);
  }
}

void q19() {
  String str = "Hello World";
  int count = 0;
  String vowels = "aeiouAEIOU";
  for (int i = 0; i < str.length; i++) {
    if (vowels.contains(str[i])) count++;
  }
  print("Q19: Number of vowels: $count");
}
