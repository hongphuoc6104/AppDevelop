# 📅 Ngày 1: OOP trong Dart - So sánh với Java

> **Mục tiêu:** Hiểu rõ cách OOP trong Dart khác với Java
> 
> **Thời lượng:** 2 giờ
> 
> **Ngày học:** 24/12/2024

---

## ✅ Checklist học hôm nay

- [ ] **Phần 1:** Named Constructor & This shorthand (30 phút)
- [ ] **Phần 2:** Named Parameters & Optional Parameters (30 phút)  
- [ ] **Phần 3:** Getter/Setter & Properties (20 phút)
- [ ] **Phần 4:** Mixin - Đa kế thừa trong Dart (25 phút)
- [ ] **Phần 5:** Bài tập thực hành (15 phút)

---

## 📚 Phần 1: Constructor trong Dart (30 phút)

### 1.1. Constructor cơ bản - Java vs Dart

**Java:**
```java
public class User {
    private String name;
    private int age;
    private String email;
    
    // Constructor dài dòng
    public User(String name, int age, String email) {
        this.name = name;
        this.age = age;
        this.email = email;
    }
}
```

**Dart - Cách 1 (tương tự Java):**
```dart
class User {
  String name;
  int age;
  String email;
  
  User(String name, int age, String email) {
    this.name = name;
    this.age = age;
    this.email = email;
  }
}
```

**Dart - Cách 2 (Shorthand - KHUYÊN DÙNG):**
```dart
class User {
  String name;
  int age;
  String email;
  
  // Ngắn gọn hơn rất nhiều!
  User(this.name, this.age, this.email);
}

// Sử dụng
var user = User('John', 25, 'john@email.com');
```

### 1.2. Named Constructor - Java KHÔNG CÓ!

**Vấn đề trong Java:**
```java
// Muốn tạo nhiều cách khởi tạo khác nhau?
public User(String name) { /* Guest user */ }
public User(String name, int age) { /* Partial info */ }
public User(Map<String, Object> json) { /* From JSON */ }

// ❌ KHÔNG THỂ - Java không cho phép overload như thế này!
```

**Giải pháp của Dart - Named Constructor:**
```dart
class User {
  String name;
  int age;
  String email;
  
  // Constructor chính
  User(this.name, this.age, this.email);
  
  // Named constructor cho guest user
  User.guest() 
    : name = 'Guest',
      age = 0,
      email = 'guest@example.com';
  
  // Named constructor từ JSON
  User.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      age = json['age'],
      email = json['email'];
  
  // Named constructor cho admin
  User.admin(String name)
    : name = name,
      age = 99,
      email = '$name@admin.com';
}

// Sử dụng - Rất rõ ràng!
void main() {
  var regularUser = User('John', 25, 'john@email.com');
  var guestUser = User.guest();
  var adminUser = User.admin('SuperAdmin');
  var jsonUser = User.fromJson({
    'name': 'Jane',
    'age': 30,
    'email': 'jane@email.com'
  });
  
  print(guestUser.name); // Guest
  print(adminUser.email); // SuperAdmin@admin.com
}
```

**💡 Khi nào dùng Named Constructor?**
- Tạo object từ nhiều nguồn khác nhau (JSON, Database, API)
- Tạo các "preset" objects (guest, default, empty)
- Làm code rõ ràng hơn: `User.fromJson()` vs `User(json)`

### 🏋️ Bài tập 1.2

Tạo class `Product` với:
- Properties: `name`, `price`, `stock`
- Constructor chính
- Named constructor `Product.free()` (price = 0)
- Named constructor `Product.fromMap(Map data)`
- Named constructor `Product.sample()` (tạo sản phẩm mẫu để test)

> Xem đáp án trong file `solutions.md`

---

## 📚 Phần 2: Named Parameters & Optional Parameters (30 phút)

### 2.1. Vấn đề với Positional Parameters

**Java/Dart với positional parameters:**
```dart
// Constructor có nhiều tham số
User(String name, int age, String email, String phone, bool isPremium, String address);

// Gọi hàm - Khó nhớ thứ tự!
var user = User('John', 25, 'john@email.com', '123456', true, 'Ha Noi');
//           ^^^^^^ Cái nào là gì? age hay phone đây?
```

### 2.2. Named Parameters - Giải pháp của Dart

```dart
class User {
  String name;
  int age;
  String email;
  String? phone;        // ? = Optional (có thể null)
  bool isPremium;
  String? address;
  
  // Named parameters với {}
  User({
    required this.name,      // required = bắt buộc
    required this.age,
    required this.email,
    this.phone,              // optional, có thể null
    this.isPremium = false,  // optional với default value
    this.address,
  });
}

// Sử dụng - RÕ RÀNG HƠN NHIỀU!
void main() {
  var user1 = User(
    name: 'John',
    age: 25,
    email: 'john@email.com',
    isPremium: true,        // Tự do thứ tự
  );
  
  var user2 = User(
    email: 'jane@email.com',  // Thứ tự không quan trọng
    name: 'Jane',
    age: 30,
    phone: '123456',          // Optional parameters
    address: 'Ha Noi',
  );
  
  // ❌ LỖI - Thiếu required parameters
  // var user3 = User(name: 'Bob'); // Missing: age, email
}
```

### 2.3. So sánh đầy đủ

| Feature | Java | Dart Positional | Dart Named |
|---------|------|-----------------|------------|
| Thứ tự tham số | Bắt buộc | Bắt buộc | Tự do |
| Rõ ràng | ❌ | ❌ | ✅ |
| Optional params | Overloading | Default values | `?` hoặc default |
| Required params | - | - | `required` keyword |

### 2.4. Mix Positional & Named Parameters

```dart
class Product {
  String name;
  double price;
  String? description;
  int stock;
  
  // Positional (name, price) + Named (description, stock)
  Product(
    this.name,           // Positional - bắt buộc
    this.price,          // Positional - bắt buộc
    {                    // Named parameters bắt đầu
      this.description,
      this.stock = 0,
    }
  );
}

// Sử dụng
var product1 = Product('Laptop', 1200);
var product2 = Product('Phone', 800, stock: 10);
var product3 = Product(
  'Tablet', 
  500, 
  description: 'Best tablet',
  stock: 5
);
```

### 🏋️ Bài tập 2.4

Tạo class `BankAccount` với:
- Positional parameters: `accountNumber`, `balance`
- Named parameters: 
  - `ownerName` (required)
  - `type` (optional, default = 'savings')
  - `interestRate` (optional, default = 0.05)
  - `isActive` (optional, default = true)

> Xem đáp án trong file `solutions.md`

---

## 📚 Phần 3: Getter/Setter & Properties (20 phút)

### 3.1. Java vs Dart - Getter/Setter

**Java (dài dòng):**
```java
public class Rectangle {
    private double width;
    private double height;
    
    public double getWidth() {
        return width;
    }
    
    public void setWidth(double width) {
        if (width > 0) {
            this.width = width;
        }
    }
    
    public double getHeight() {
        return height;
    }
    
    public void setHeight(double height) {
        if (height > 0) {
            this.height = height;
        }
    }
    
    public double getArea() {
        return width * height;
    }
}

// Sử dụng
Rectangle rect = new Rectangle();
rect.setWidth(10);
rect.setHeight(5);
double area = rect.getArea();
```

**Dart (ngắn gọn, tự nhiên hơn):**
```dart
class Rectangle {
  double _width = 0;   // _ = private
  double _height = 0;
  
  // Getter
  double get width => _width;
  double get height => _height;
  
  // Setter với validation
  set width(double value) {
    if (value > 0) {
      _width = value;
    }
  }
  
  set height(double value) {
    if (value > 0) {
      _height = value;
    }
  }
  
  // Computed property (không cần lưu trữ)
  double get area => _width * _height;
  double get perimeter => 2 * (_width + _height);
}

// Sử dụng - Giống như property bình thường!
void main() {
  var rect = Rectangle();
  rect.width = 10;      // Gọi setter
  rect.height = 5;      // Gọi setter
  
  print(rect.width);    // Gọi getter: 10
  print(rect.area);     // Gọi getter: 50
  print(rect.perimeter); // 30
  
  rect.width = -5;      // Setter reject vì < 0
  print(rect.width);    // Vẫn là 10
}
```

### 3.2. Read-only Properties

```dart
class User {
  final String id;          // final = không thể thay đổi
  String _name;
  DateTime _createdAt;
  
  User(this.id, this._name) : _createdAt = DateTime.now();
  
  // Read-only - chỉ getter, không có setter
  String get name => _name;
  DateTime get createdAt => _createdAt;
  
  // Computed property
  String get displayName => '${name.toUpperCase()} (#$id)';
  int get accountAge => DateTime.now().difference(_createdAt).inDays;
}

void main() {
  var user = User('U001', 'john');
  
  print(user.name);         // john
  print(user.displayName);  // JOHN (#U001)
  print(user.accountAge);   // 0 (mới tạo hôm nay)
  
  // ❌ LỖI - Không có setter
  // user.name = 'Jane';
  // user.createdAt = DateTime.now();
}
```

### 🏋️ Bài tập 3.2

Tạo class `Temperature` với:
- Private field `_celsius`
- Getter/Setter cho `celsius`
- Computed getter cho `fahrenheit` (F = C * 9/5 + 32)
- Computed getter cho `kelvin` (K = C + 273.15)
- Setter cho `fahrenheit` (tính ngược lại celsius)

> Xem đáp án trong file `solutions.md`

---

## 📚 Phần 4: Mixin - Đa kế thừa trong Dart (25 phút)

### 4.1. Vấn đề trong Java

**Java:**
```java
// Java chỉ cho phép kế thừa 1 class
class Duck extends Animal {
    // Muốn thêm khả năng bay và bơi?
    // ❌ KHÔNG THỂ: class Duck extends Animal, Flyable, Swimmable
}

// Phải dùng Interface
interface Flyable {
    void fly();
}

interface Swimmable {
    void swim();
}

class Duck extends Animal implements Flyable, Swimmable {
    @Override
    public void fly() {
        System.out.println("Duck flying");  // Phải implement lại
    }
    
    @Override
    public void swim() {
        System.out.println("Duck swimming"); // Phải implement lại
    }
}
```

### 4.2. Giải pháp của Dart - Mixin

```dart
// Mixin - Không phải class, không thể khởi tạo
mixin Flyable {
  void fly() {
    print('Flying in the sky! 🦅');
  }
  
  void land() {
    print('Landing safely.');
  }
}

mixin Swimmable {
  void swim() {
    print('Swimming in water! 🏊');
  }
  
  void dive() {
    print('Diving deep!');
  }
}

// Base class
class Animal {
  String name;
  Animal(this.name);
  
  void breathe() => print('$name is breathing');
}

// Duck có cả bay VÀ bơi!
class Duck extends Animal with Flyable, Swimmable {
  Duck(String name) : super(name);
}

// Fish chỉ bơi
class Fish extends Animal with Swimmable {
  Fish(String name) : super(name);
}

// Bird chỉ bay
class Bird extends Animal with Flyable {
  Bird(String name) : super(name);
}

void main() {
  var duck = Duck('Donald');
  duck.breathe();  // Từ Animal
  duck.fly();      // Từ Flyable mixin
  duck.swim();     // Từ Swimmable mixin
  duck.land();     // Từ Flyable mixin
  duck.dive();     // Từ Swimmable mixin
  
  print('\n---\n');
  
  var fish = Fish('Nemo');
  fish.breathe();  // Từ Animal
  fish.swim();     // Từ Swimmable mixin
  // fish.fly();   // ❌ LỖI - Fish không có Flyable
}
```

### 4.3. Mixin thực tế trong Flutter

```dart
// Ví dụ thực tế: Logger mixin
mixin Logger {
  void log(String message) {
    print('[${DateTime.now()}] $message');
  }
  
  void logError(String error) {
    print('[ERROR] $error');
  }
}

// Mixin với state
mixin Validator {
  bool isValidEmail(String email) {
    return email.contains('@') && email.contains('.');
  }
  
  bool isValidPassword(String password) {
    return password.length >= 8;
  }
  
  bool isValidPhone(String phone) {
    return RegExp(r'^\d{10,11}$').hasMatch(phone);
  }
}

// Sử dụng nhiều mixins
class UserService with Logger, Validator {
  void registerUser(String email, String password) {
    log('Registering user: $email');
    
    if (!isValidEmail(email)) {
      logError('Invalid email format');
      return;
    }
    
    if (!isValidPassword(password)) {
      logError('Password too weak');
      return;
    }
    
    log('User registered successfully!');
  }
}

void main() {
  var service = UserService();
  service.registerUser('test@email.com', '12345678');
}
```

### 🏋️ Bài tập 4.3

Tạo:
1. Mixin `Serializable` với methods:
   - `Map<String, dynamic> toJson()`
   - `String toJsonString()`
2. Mixin `Timestamped` với:
   - `DateTime createdAt`
   - `DateTime updatedAt`
   - `void updateTimestamp()`
3. Class `Article` kế thừa cả 2 mixins

> Xem đáp án trong file `solutions.md`

---

## 🎯 Phần 5: Bài tập tổng hợp (15 phút)

### Bài tập cuối ngày - Hệ thống quản lý thư viện 📚

**Yêu cầu:**

1. **Mixin `Borrowable`:**
   - Property `bool isBorrowed`
   - Method `void borrow()`
   - Method `void returnItem()`

2. **Mixin `Searchable`:**
   - Method `bool matchesQuery(String query)`

3. **Class `Book`:**
   - Properties: `title`, `author`, `isbn`, `year`
   - Sử dụng cả 2 mixins (`Borrowable` và `Searchable`)
   - Named constructors:
     - `Book.fromJson(Map data)`
     - `Book.sample()` (tạo sách mẫu)
   - Getter `description` (tính toán từ các fields)
   - Override `toString()` để hiển thị thông tin đầy đủ

4. **Class `Library`:**
   - Property: `List<Book> books`
   - Method `addBook(Book book)` - thêm sách
   - Method `searchBooks(String query)` - tìm sách (sử dụng Searchable mixin)
   - Method `borrowBook(String isbn)` - mượn sách (sử dụng Borrowable mixin)
   - Method `returnBook(String isbn)` - trả sách
   - Method `showAllBooks()` - hiển thị tất cả sách

**Test cases để kiểm tra:**
```dart
void main() {
  var library = Library();
  
  // 1. Thêm sách bằng constructor thường
  library.addBook(Book(
    title: 'Clean Code',
    author: 'Robert Martin',
    isbn: '978-0132350884',
    year: 2008,
  ));
  
  // 2. Thêm sách bằng fromJson
  library.addBook(Book.fromJson({
    'title': 'Design Patterns',
    'author': 'Gang of Four',
    'isbn': '978-0201633612',
    'year': 1994,
  }));
  
  // 3. Hiển thị tất cả sách
  library.showAllBooks();
  
  // 4. Tìm kiếm sách
  var results = library.searchBooks('clean');
  
  // 5. Mượn sách
  library.borrowBook('978-0132350884');
  
  // 6. Hiển thị lại (sách đã mượn phải có dấu [BORROWED])
  library.showAllBooks();
  
  // 7. Trả sách
  library.returnBook('978-0132350884');
}
```

> Xem đáp án trong file `solutions.md`

---

## ✅ Checklist kết thúc ngày

Trước khi kết thúc, hãy đảm bảo bạn đã:

- [ ] Hiểu và code được Named Constructor
- [ ] Hiểu sự khác biệt giữa Positional và Named Parameters
- [ ] Sử dụng `required` keyword
- [ ] Tạo Getter/Setter với `get` và `set`
- [ ] Hiểu và sử dụng được Mixin
- [ ] Hoàn thành bài tập tổng hợp về Library
- [ ] Chạy thử tất cả code examples

---

## 🚀 Chuẩn bị cho Ngày 2

**Ngày mai học gì?**
- Null Safety (RẤT QUAN TRỌNG!)
- `?`, `!`, `??`, `late`, `required`
- Cách tránh NullPointerException

**Chuẩn bị:**
- Đọc trước về null safety trong Dart
- Nghĩ về những lần bị NullPointerException trong Java

---

## 📝 Ghi chú của bạn

Viết những gì bạn học được hôm nay:

```
[Ghi chú của bạn ở đây]




```

---

**🎉 Chúc mừng bạn đã hoàn thành Ngày 1!**

> Nhớ: **Practice makes perfect!** Hãy code lại tất cả examples thay vì chỉ đọc.
