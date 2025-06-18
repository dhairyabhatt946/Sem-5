class CounterVariables {
  static int COUNTER = 1;
}

class Demo {
  void incrementCounter() {
    CounterVariables.COUNTER++;
  }
}

class Demo2 {
  void incrementCounter() {
    CounterVariables.COUNTER++;
  }
}

void main() {
  Demo d1 = Demo();
  d1.incrementCounter();
  Demo2 d2 = Demo2();
  d2.incrementCounter();

  print('Value of Counter : ${CounterVariables.COUNTER}');
}