abstract class abstractClass {
  void display();

  void printHello() {
    print('HELLO');
  }
}

class Demo extends abstractClass {
  void display() {
    print('Method called from Demo class');
  }
}

void main() {
  Demo demo = Demo();
  demo.display();
  demo.printHello();
}