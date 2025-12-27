# Bài 4: Object-Oriented Programming (Lập trình hướng đối tượng)

OOP là nền tảng của Flutter. Chúng ta sẽ đi qua các khái niệm cốt lõi.

## 1. Class & Object (Lớp và Đối tượng)

- **Class** (Lớp): Bản thiết kế (`Blueprint`).
- **Object** (Đối tượng): Thực thể tạo ra từ Class.

```dart
class Car {
  String brand; // Hãng xe (Attribute/Property)
  int year;     // Năm sản xuất

  // Constructor (Hàm khởi tạo) - Shorthand syntax
  Car(this.brand, this.year);

  // Method (Phương thức/Hàm)
  void start() {
    print("$brand is starting...");
  }
}

void main() {
  var myCar = Car("Toyota", 2022); // Tạo Object
  myCar.start();
}
```

---

## 2. Constructors (Hàm khởi tạo)

### 2.1. Named Constructor (Constructor đặt tên)
Dart cho phép nhiều constructor với tên khác nhau.

```dart
class User {
  String name;
  int age;

  // Default Constructor
  User(this.name, this.age);

  // Named Constructor: Tạo từ JSON
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'];
        
  // Named Constructor: Tài khoản khách
  User.guest() 
      : name = "Guest", 
        age = 0;
}
```

---

## 3. Encapsulation (Tính đóng gói) - Private Members

Trong Dart, không có từ khóa `private` hay `public`.
- Thêm dấu gạch dưới `_` trước tên biến/hàm để biến nó thành **Private** (chỉ truy cập được trong cùng file).
- Dùng **Getter** (`get`) và **Setter** (`set`) để truy cập/kiểm soát.

**Code Example: Bank Account**
```dart
class BankAccount {
  // Private property (Thuộc tính riêng tư)
  double _balance = 0; 
  
  // Getter: Đọc số dư
  double get balance => _balance;
  
  // Setter: Nạp tiền (có kiểm tra)
  set balance(double amount) {
    if (amount > 0) {
      _balance = amount;
    }
  }

  void deposit(double amount) {
    _balance += amount;
  }
}
```

---

## 4. Inheritance (Tính kế thừa)

Dùng từ khóa `extends` để kế thừa. Class con có thể dùng lại hoặc sửa đổi (`override`) tính năng của class cha.

- `super`: Tham chiếu đến class cha.
- `@override`: Ghi đè phương thức.

**Code Example: Animals**
```dart
class Animal {
  void makeStyles() {
    print("Some sound...");
  }
}

class Dog extends Animal {
  @override
  void makeStyles() {
    super.makeStyles(); // Gọi hàm của cha nếu cần
    print("Bark! Bark!");
  }
}
```

---

## 5. Abstraction (Tính trừu tượng)

### 5.1. Abstract Class
- Không thể tạo object trực tiếp.
- Chứa các hàm chưa có nội dung (abstract method) để class con bắt buộc phải viết lại.

```dart
abstract class Shape {
  // Abstract method (Hàm trừu tượng - không có thân hàm)
  double calculateArea(); 
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);

  @override
  double calculateArea() => 3.14 * radius * radius;
}
```

### 5.2. Interface (Giao diện)
Dart không có từ khóa `interface`. Mọi class đều là interface ngầm định.
Dùng `implements` để bắt buộc định nghĩa lại **toàn bộ** hàm và biến.

```dart
class Flyable {
  void fly() {}
}

class Bird implements Flyable {
  @override
  void fly() {
    print("Bird flying");
  }
}
```

---

## 6. Mixin (Đa kế thừa)

Dùng `mixin` để chia sẻ code giữa các class không cùng cha. Dùng `with` để sử dụng.

```dart
mixin Swimmable {
  void swim() => print("Swimming...");
}

mixin Runnable {
  void run() => print("Running...");
}

class Human with Swimmable, Runnable {}

void main() {
  var person = Human();
  person.swim();
  person.run();
}
```

---

## 7. Từ Vựng (Vocabulary)
- `attribute` / `property` (thuộc tính)
- `method` (phương thức - hàm trong class)
- `instance` (thể hiện - object cụ thể)
- `inheritance` (kế thừa)
- `polymorphism` (đa hình)
- `encapsulation` (đóng gói)
- `abstraction` (trừu tượng)
- `override` (ghi đè)
- `extend` (mở rộng/kế thừa)
- `implement` (triển khai/thực thi)

---

## 8. Bài Tập Thực Hành (Exercises)

### Bài 1: Employee Management (Quản lý nhân viên)
1.  Tạo abstract class `Employee` với: property `name`, abstract method `calculateSalary()`.
2.  Tạo class `FullTimeEmployee` kế thừa `Employee`:
    - Có thêm `monthlySalary` (lương tháng).
    - `calculateSalary` trả về `monthlySalary`.
3.  Tạo class `PartTimeEmployee` kế thừa `Employee`:
    - Có thêm `hourlyRate` (lương giờ) và `hoursWorked` (giờ làm).
    - `calculateSalary` trả về `hourlyRate * hoursWorked`.
4.  Tạo hàm `main` để kiểm tra.

### Bài 2: Super Hero (Siêu anh hùng)
1.  Tạo mixin `Flyable` (có hàm `fly`) và `SuperStrength` (có hàm `smash`).
2.  Tạo class `SuperHero` dùng cả 2 mixin trên.
3.  Tạo object và gọi thử các hàm.

---
👉 **Tạo file `Dart/A4_OOP/practice.dart` để làm bài tập bạn nhé!**
