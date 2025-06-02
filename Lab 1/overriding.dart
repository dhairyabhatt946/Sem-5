class Demo {
  void display() {
    print('Demo Class Method');
  }
}

class Demo2 extends Demo {
  void display() {
    print('Demo2 Class Method');
    super.display();
  }
}

void main() {
  Demo2 d2 = Demo2();
  d2.display();
}