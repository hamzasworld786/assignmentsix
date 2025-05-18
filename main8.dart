main() {
  int age = 20;
  double height = 5.9;
  String name = "Hamza";
  bool isStudent = true;
  var city = "Lahore";
  dynamic anyValue = 123;

  List<int> numbers = [1, 2, 3];
  numbers.add(4);
  print(numbers[0]);
  print(numbers.length);

  Map<String, int> marks = {"Math": 90, "English": 85};
  marks["Science"] = 92;
  print(marks["Math"]);

  for (int i = 0; i < 5; i++) {
    print("For loop: $i");
  }

  int i = 0;
  while (i < 5) {
    print("While loop: $i");
    i++;
  }

  List<String> names = ["Ali", "Hamza", "Sara"];
  for (var name in names) {
    print("Hello $name");
  }

  int number = 10;

  if (number > 0) {
    print("Positive");
  } else if (number == 0) {
    print("Zero");
  } else {
    print("Negative");
  }

  int add(int a, int b) {
    return a + b;
  }

  void greet(String name) {
    print("Hello $name");
  }

  void greet2(String name, [String title = ""]) {
    print("Hello $title $name");
  }

  int marksObtained = 78;

  if (marksObtained >= 80) {
    print("Grade: A");
  } else if (marksObtained >= 60) {
    print("Grade: B");
  } else if (marksObtained >= 40) {
    print("Grade: C");
  } else {
    print("Fail");
  }

  List<int> nums = [10, 20, 30, 40];
  int sum = 0;

  for (var n in nums) {
    sum += n;
  }
  double avg = sum / nums.length;
  print("Sum = $sum, Average = $avg");

  Map<String, int> studentScores = {"Ali": 88, "Hamza": 74, "Sara": 92};

  for (var entry in studentScores.entries) {
    if (entry.value > 80) {
      print("${entry.key} scored ${entry.value}");
    }
  }

  List<int> mixedNums = [5, 12, 7, 8, 3, 14];
  for (var n in mixedNums) {
    if (n % 2 == 0) {
      print("$n is even");
    }
  }

  int findMax(List<int> list) {
    int max = list[0];
    for (var num in list) {
      if (num > max) {
        max = num;
      }
    }
    return max;
  }

  print("Max number: ${findMax([5, 9, 12, 3, 7])}");

  String bestSubject(Map<String, int> subjectMarks) {
    String best = subjectMarks.keys.first;
    int highest = subjectMarks[best]!;

    subjectMarks.forEach((subject, mark) {
      if (mark > highest) {
        highest = mark;
        best = subject;
      }
    });

    return best;
  }

  Map<String, int> myMarks = {"Math": 85, "English": 78, "Physics": 91};

  print("Best subject: ${bestSubject(myMarks)}");
}
