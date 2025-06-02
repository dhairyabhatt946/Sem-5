class Student {
  int? rollno;
  String? name;
  double? spi;

  Student(int rollno, String name, double spi) {
    this.rollno = rollno;
    this.name = name;
    this.spi = spi;
  }

  void displayStudent() {
    print('Roll no: $rollno');
    print('Name: $name');
    print('SPI: $spi');
  }
}

void main() {
  Student s1 = Student(322, 'Dhairya', 9.3);
  s1.displayStudent();
}