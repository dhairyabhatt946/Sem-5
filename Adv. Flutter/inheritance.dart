class Vehicle {
    int? tyres;
    String? name;

    void display() {
        print(name);
    }
}

class Car extends Vehicle {
    Car(String name) {
        super.name = name;
        super.tyres = 4;
    }
}

void main() {
    Car c1 = Car('BMW');
    c1.display();
}