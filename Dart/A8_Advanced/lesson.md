# A8. Advanced Dart - Nâng cao Dart

> **Mục tiêu:** Nắm vững Generics, Extension, Records và Pattern Matching
> **Thời gian học:** 2-3 buổi (mỗi buổi ~2 giờ)

---

## 📚 Mục lục

1. [Generics - Kiểu dữ liệu tổng quát](#1-generics---kiểu-dữ-liệu-tổng-quát)
2. [Extension Methods - Mở rộng class](#2-extension-methods---mở-rộng-class)
3. [Enhanced Enum - Enum nâng cao](#3-enhanced-enum---enum-nâng-cao)
4. [Cascade Notation - Chuỗi thao tác](#4-cascade-notation---chuỗi-thao-tác)
5. [Records - Bản ghi (Dart 3.0)](#5-records---bản-ghi-dart-30)
6. [Pattern Matching - Đối sánh mẫu (Dart 3.0)](#6-pattern-matching---đối-sánh-mẫu-dart-30)
7. [Sealed Classes - Lớp đóng kín (Dart 3.0)](#7-sealed-classes---lớp-đóng-kín-dart-30)
8. [Bài tập thực hành](#8-bài-tập-thực-hành)

---

## 1. Generics - Kiểu dữ liệu tổng quát

### 1.1. Generics là gì?

**Generics** = Viết code **một lần**, dùng được với **nhiều kiểu dữ liệu**.

**Vấn đề không có Generics:**
```dart
// Phải viết nhiều class cho từng kiểu!
class IntBox {
  int value;
  IntBox(this.value);
}

class StringBox {
  String value;
  StringBox(this.value);
}

class DoubleBox {
  double value;
  DoubleBox(this.value);
}
```

**Giải pháp với Generics:**
```dart
// Viết 1 lần, dùng cho MỌI kiểu!
class Box<T> {  // T = Type parameter (tham số kiểu)
  T value;
  Box(this.value);
}

void main() {
  var intBox = Box<int>(42);
  var stringBox = Box<String>('Hello');
  var doubleBox = Box<double>(3.14);
  
  print(intBox.value);     // 42
  print(stringBox.value);  // Hello
  print(doubleBox.value);  // 3.14
}
```

### 1.2. Quy ước đặt tên Type Parameter

| Ký tự | Ý nghĩa | Ví dụ |
|-------|---------|-------|
| `T` | Type (kiểu chung) | `Box<T>`, `List<T>` |
| `E` | Element (phần tử) | `List<E>`, `Set<E>` |
| `K` | Key (khóa) | `Map<K, V>` |
| `V` | Value (giá trị) | `Map<K, V>` |
| `R` | Return (trả về) | `Function<R>` |

### 1.3. Generic Class

```dart
// Generic Stack (Ngăn xếp)
class Stack<T> {
  final List<T> _items = [];
  
  // Push - Thêm vào đỉnh
  void push(T item) {
    _items.add(item);
    print('📥 Pushed: $item');
  }
  
  // Pop - Lấy ra từ đỉnh
  T pop() {
    if (_items.isEmpty) {
      throw StateError('Stack is empty!');
    }
    var item = _items.removeLast();
    print('📤 Popped: $item');
    return item;
  }
  
  // Peek - Xem đỉnh (không lấy ra)
  T get peek => _items.last;
  
  bool get isEmpty => _items.isEmpty;
  int get length => _items.length;
  
  @override
  String toString() => 'Stack($_items)';
}

void main() {
  // Stack chứa int
  var numberStack = Stack<int>();
  numberStack.push(1);
  numberStack.push(2);
  numberStack.push(3);
  print(numberStack);  // Stack([1, 2, 3])
  numberStack.pop();   // 📤 Popped: 3
  
  print('---');
  
  // Stack chứa String
  var stringStack = Stack<String>();
  stringStack.push('A');
  stringStack.push('B');
  print(stringStack.peek);  // B
}
```

### 1.4. Generic Method

```dart
// Hàm generic - hoán đổi 2 phần tử trong list
void swap<T>(List<T> list, int i, int j) {
  T temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}

// Hàm generic - tìm phần tử đầu tiên thỏa điều kiện
T? findFirst<T>(List<T> list, bool Function(T) test) {
  for (var item in list) {
    if (test(item)) return item;
  }
  return null;
}

void main() {
  var numbers = [1, 2, 3, 4, 5];
  swap<int>(numbers, 0, 4);
  print(numbers);  // [5, 2, 3, 4, 1]
  
  var names = ['An', 'Bình', 'Cường'];
  swap(names, 0, 2);  // Dart tự suy luận kiểu
  print(names);  // [Cường, Bình, An]
  
  // Tìm số chẵn đầu tiên
  var firstEven = findFirst(numbers, (n) => n % 2 == 0);
  print('First even: $firstEven');  // 2
}
```

### 1.5. Type Constraints (Ràng buộc kiểu)

Giới hạn kiểu `T` phải là lớp con của một class cụ thể.

```dart
// T phải là lớp con của num (int, double)
class NumberBox<T extends num> {
  T value;
  NumberBox(this.value);
  
  // Có thể dùng các phương thức của num!
  T add(T other) => (value + other) as T;
  bool isPositive() => value > 0;
}

void main() {
  var intBox = NumberBox<int>(10);
  print(intBox.add(5));      // 15
  print(intBox.isPositive()); // true
  
  var doubleBox = NumberBox<double>(3.14);
  print(doubleBox.add(1.86)); // 5.0
  
  // ❌ LỖI: String không extends num
  // var stringBox = NumberBox<String>('hello');
}
```

### 1.6. Ví dụ thực tế: Generic Repository

```dart
// Model classes
class User {
  final int id;
  final String name;
  User(this.id, this.name);
  @override
  String toString() => 'User($id, $name)';
}

class Product {
  final int id;
  final String name;
  final double price;
  Product(this.id, this.name, this.price);
  @override
  String toString() => 'Product($id, $name, $price)';
}

// Generic Repository - Dùng cho MỌI Model!
class Repository<T> {
  final List<T> _items = [];
  
  void add(T item) {
    _items.add(item);
    print('✅ Added: $item');
  }
  
  List<T> getAll() => List.unmodifiable(_items);
  
  T? getById(int index) {
    if (index >= 0 && index < _items.length) {
      return _items[index];
    }
    return null;
  }
  
  void remove(T item) {
    _items.remove(item);
    print('🗑️ Removed: $item');
  }
  
  int get count => _items.length;
}

void main() {
  // Repository cho User
  var userRepo = Repository<User>();
  userRepo.add(User(1, 'Nguyễn Văn A'));
  userRepo.add(User(2, 'Trần Thị B'));
  
  // Repository cho Product
  var productRepo = Repository<Product>();
  productRepo.add(Product(1, 'iPhone 15', 25000000));
  productRepo.add(Product(2, 'MacBook Pro', 50000000));
  
  print('\n📋 All Users: ${userRepo.getAll()}');
  print('📋 All Products: ${productRepo.getAll()}');
}
```

---

## 2. Extension Methods - Mở rộng class

### 2.1. Extension là gì?

**Extension** = Thêm phương thức mới vào class **mà không cần sửa class gốc**.

**Ví dụ:** Thêm method cho `String` (class của Dart, bạn không thể sửa!)

```dart
// Mở rộng String với các phương thức mới
extension StringExtension on String {
  // Capitalize - Viết hoa chữ đầu
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
  
  // Đảo ngược chuỗi
  String get reversed => split('').reversed.join('');
  
  // Kiểm tra có phải email không
  bool get isEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }
  
  // Kiểm tra có phải số điện thoại VN không
  bool get isVietnamesePhone {
    return RegExp(r'^(0|\+84)[3|5|7|8|9][0-9]{8}$').hasMatch(this);
  }
  
  // Lặp lại chuỗi n lần
  String repeat(int times) => this * times;
}

void main() {
  print('hello'.capitalize);     // Hello
  print('WORLD'.capitalize);     // World
  print('dart'.reversed);        // trad
  
  print('test@email.com'.isEmail);     // true
  print('invalid-email'.isEmail);      // false
  
  print('0912345678'.isVietnamesePhone);  // true
  print('+84987654321'.isVietnamesePhone); // true
  
  print('Ha'.repeat(3));  // HaHaHa
}
```

### 2.2. Extension cho int

```dart
extension IntExtension on int {
  // Chuyển thành tiền VNĐ
  String get toVND {
    var str = toString();
    var result = '';
    var count = 0;
    
    for (var i = str.length - 1; i >= 0; i--) {
      result = str[i] + result;
      count++;
      if (count % 3 == 0 && i != 0) {
        result = '.$result';
      }
    }
    return '$result đ';
  }
  
  // Kiểm tra số chẵn/lẻ
  bool get isEven => this % 2 == 0;
  bool get isOdd => this % 2 != 0;
  
  // Giai thừa
  int get factorial {
    if (this <= 1) return 1;
    return this * (this - 1).factorial;
  }
  
  // Lặp n lần
  void times(void Function(int) action) {
    for (var i = 0; i < this; i++) {
      action(i);
    }
  }
}

void main() {
  print(25000000.toVND);  // 25.000.000 đ
  print(1500000.toVND);   // 1.500.000 đ
  
  print(5.factorial);     // 120 (5*4*3*2*1)
  
  3.times((i) => print('Lần $i'));
  // Lần 0
  // Lần 1
  // Lần 2
}
```

### 2.3. Extension cho List

```dart
extension ListExtension<T> on List<T> {
  // Lấy phần tử đầu tiên an toàn
  T? get firstOrNull => isEmpty ? null : first;
  
  // Lấy phần tử cuối cùng an toàn
  T? get lastOrNull => isEmpty ? null : last;
  
  // Lấy phần tử ngẫu nhiên
  T get random {
    if (isEmpty) throw StateError('List is empty');
    return this[(DateTime.now().millisecond % length)];
  }
  
  // Chunk - Chia thành các nhóm nhỏ
  List<List<T>> chunk(int size) {
    var chunks = <List<T>>[];
    for (var i = 0; i < length; i += size) {
      var end = (i + size < length) ? i + size : length;
      chunks.add(sublist(i, end));
    }
    return chunks;
  }
  
  // Loại bỏ trùng lặp
  List<T> get distinct => toSet().toList();
}

void main() {
  var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  print(numbers.firstOrNull);  // 1
  print(<int>[].firstOrNull);  // null
  
  print(numbers.chunk(3));  // [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]]
  
  var duplicates = [1, 2, 2, 3, 3, 3, 4];
  print(duplicates.distinct);  // [1, 2, 3, 4]
}
```

### 2.4. Extension cho DateTime

```dart
extension DateTimeExtension on DateTime {
  // Format: dd/MM/yyyy
  String get toVietnameseDate {
    return '${day.toString().padLeft(2, '0')}/'
           '${month.toString().padLeft(2, '0')}/'
           '$year';
  }
  
  // Format: HH:mm:ss
  String get toTimeString {
    return '${hour.toString().padLeft(2, '0')}:'
           '${minute.toString().padLeft(2, '0')}:'
           '${second.toString().padLeft(2, '0')}';
  }
  
  // Kiểm tra có phải hôm nay không
  bool get isToday {
    var now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }
  
  // Tính tuổi
  int get age {
    var now = DateTime.now();
    var age = now.year - year;
    if (now.month < month || (now.month == month && now.day < day)) {
      age--;
    }
    return age;
  }
}

void main() {
  var now = DateTime.now();
  print('Ngày: ${now.toVietnameseDate}');  // 31/12/2024
  print('Giờ: ${now.toTimeString}');       // 19:00:00
  
  var birthday = DateTime(2000, 5, 15);
  print('Tuổi: ${birthday.age}');  // 24
}
```

---

## 3. Enhanced Enum - Enum nâng cao

### 3.1. Enum cơ bản vs Enhanced Enum

```dart
// ❌ Enum cơ bản (hạn chế)
enum StatusOld { pending, approved, rejected }

// ✅ Enhanced Enum (Dart 2.17+)
enum Status {
  pending('Đang chờ', '🟡'),
  approved('Đã duyệt', '🟢'),
  rejected('Từ chối', '🔴');
  
  // Properties
  final String label;
  final String icon;
  
  // Constructor
  const Status(this.label, this.icon);
  
  // Methods
  bool get isApproved => this == Status.approved;
  
  // Static method
  static Status fromString(String value) {
    return Status.values.firstWhere(
      (s) => s.name == value,
      orElse: () => Status.pending,
    );
  }
}

void main() {
  var status = Status.approved;
  
  print(status.label);  // Đã duyệt
  print(status.icon);   // 🟢
  print(status.isApproved);  // true
  
  // Từ string → enum
  var parsed = Status.fromString('rejected');
  print('${parsed.icon} ${parsed.label}');  // 🔴 Từ chối
}
```

### 3.2. Ví dụ: Payment Method Enum

```dart
enum PaymentMethod {
  cash('Tiền mặt', 'cash_icon.png', 0),
  creditCard('Thẻ tín dụng', 'card_icon.png', 2.5),
  bankTransfer('Chuyển khoản', 'bank_icon.png', 0),
  momo('Ví MoMo', 'momo_icon.png', 1.0),
  zalopay('ZaloPay', 'zalo_icon.png', 1.0);
  
  final String label;
  final String iconPath;
  final double feePercent;  // Phí giao dịch %
  
  const PaymentMethod(this.label, this.iconPath, this.feePercent);
  
  // Tính phí giao dịch
  double calculateFee(double amount) => amount * feePercent / 100;
  
  // Kiểm tra có phí không
  bool get hasFee => feePercent > 0;
  
  // Tổng tiền phải trả
  double totalAmount(double amount) => amount + calculateFee(amount);
}

void main() {
  var amount = 1000000.0;  // 1 triệu VNĐ
  
  for (var method in PaymentMethod.values) {
    var fee = method.calculateFee(amount);
    var total = method.totalAmount(amount);
    
    print('${method.label}:');
    print('   Phí: ${fee.toStringAsFixed(0)} đ');
    print('   Tổng: ${total.toStringAsFixed(0)} đ');
    print('');
  }
}
```

### 3.3. Ví dụ: Order Status với implements

```dart
// Enum có thể implements interface!
abstract class StatusDisplay {
  String get displayName;
  String get color;
}

enum OrderStatus implements StatusDisplay {
  created('Đã tạo', '#808080'),
  confirmed('Đã xác nhận', '#2196F3'),
  shipping('Đang giao', '#FF9800'),
  delivered('Đã giao', '#4CAF50'),
  cancelled('Đã hủy', '#F44336');
  
  @override
  final String displayName;
  
  @override
  final String color;
  
  const OrderStatus(this.displayName, this.color);
  
  // Kiểm tra có thể hủy không
  bool get canCancel => this == created || this == confirmed;
  
  // Lấy bước tiếp theo
  OrderStatus? get nextStatus {
    switch (this) {
      case OrderStatus.created:
        return OrderStatus.confirmed;
      case OrderStatus.confirmed:
        return OrderStatus.shipping;
      case OrderStatus.shipping:
        return OrderStatus.delivered;
      default:
        return null;
    }
  }
}

void main() {
  var status = OrderStatus.confirmed;
  
  print('Trạng thái: ${status.displayName}');  // Đã xác nhận
  print('Có thể hủy: ${status.canCancel}');    // true
  print('Bước tiếp: ${status.nextStatus?.displayName}');  // Đang giao
}
```

---

## 4. Cascade Notation - Chuỗi thao tác

### 4.1. Cascade là gì?

**Cascade** (`..`) = Gọi nhiều phương thức trên **cùng một object** mà không cần lặp lại tên biến.

```dart
class User {
  String name = '';
  int age = 0;
  String email = '';
  
  void setName(String n) => name = n;
  void setAge(int a) => age = a;
  void setEmail(String e) => email = e;
  void printInfo() => print('$name, $age tuổi, $email');
}

void main() {
  // ❌ Không dùng cascade - Lặp lại "user" nhiều lần
  var user1 = User();
  user1.setName('Nguyễn Văn A');
  user1.setAge(25);
  user1.setEmail('a@email.com');
  user1.printInfo();
  
  // ✅ Dùng cascade - Gọn hơn!
  var user2 = User()
    ..setName('Trần Thị B')
    ..setAge(22)
    ..setEmail('b@email.com')
    ..printInfo();
}
```

### 4.2. Cascade với properties

```dart
class Rectangle {
  double width = 0;
  double height = 0;
  String color = 'white';
  
  double get area => width * height;
  
  void draw() {
    print('Drawing $color rectangle: ${width}x$height (area: $area)');
  }
}

void main() {
  var rect = Rectangle()
    ..width = 10
    ..height = 5
    ..color = 'red'
    ..draw();
  // Output: Drawing red rectangle: 10x5 (area: 50)
}
```

### 4.3. Null-aware Cascade (`?..`)

```dart
class Config {
  String? theme;
  int? fontSize;
  
  void apply() {
    print('Theme: $theme, Font: $fontSize');
  }
}

void main() {
  Config? config = null;
  
  // ❌ Sẽ lỗi nếu config null
  // config..theme = 'dark';
  
  // ✅ An toàn với ?..
  config
    ?..theme = 'dark'
    ..fontSize = 16
    ..apply();
  
  // Không in gì vì config = null
  
  config = Config();
  config
    ?..theme = 'light'
    ..fontSize = 14
    ..apply();
  // Output: Theme: light, Font: 14
}
```

### 4.4. Ví dụ thực tế: StringBuilder pattern

```dart
class HtmlBuilder {
  final StringBuffer _buffer = StringBuffer();
  
  HtmlBuilder tag(String name, String content) {
    _buffer.write('<$name>$content</$name>');
    return this;
  }
  
  HtmlBuilder br() {
    _buffer.write('<br/>');
    return this;
  }
  
  HtmlBuilder text(String content) {
    _buffer.write(content);
    return this;
  }
  
  String build() => _buffer.toString();
}

void main() {
  var html = HtmlBuilder()
    ..tag('h1', 'Welcome')
    ..br()
    ..tag('p', 'This is a paragraph.')
    ..br()
    ..tag('a', 'Click here');
  
  print(html.build());
  // <h1>Welcome</h1><br/><p>This is a paragraph.</p><br/><a>Click here</a>
}
```

---

## 5. Records - Bản ghi (Dart 3.0)

### 5.1. Records là gì?

**Records** = Kiểu dữ liệu **nhẹ** để nhóm nhiều giá trị lại với nhau, **không cần tạo class**.

```dart
void main() {
  // ❌ Trước đây: Phải tạo class hoặc dùng Map
  // class Point { int x; int y; }
  
  // ✅ Dart 3.0: Dùng Records!
  var point = (10, 20);  // Record positional
  print(point.$1);  // 10
  print(point.$2);  // 20
  
  // Named fields
  var user = (name: 'Nguyễn Văn A', age: 25);
  print(user.name);  // Nguyễn Văn A
  print(user.age);   // 25
  
  // Mix positional và named
  var product = (1, 'iPhone 15', price: 25000000);
  print(product.$1);     // 1
  print(product.$2);     // iPhone 15
  print(product.price);  // 25000000
}
```

### 5.2. Record Type Annotation

```dart
// Khai báo kiểu record
(int, int) getMinMax(List<int> numbers) {
  var min = numbers.reduce((a, b) => a < b ? a : b);
  var max = numbers.reduce((a, b) => a > b ? a : b);
  return (min, max);
}

// Named fields
({String name, int age}) createUser(String name, int age) {
  return (name: name, age: age);
}

// Mix
(int id, String name, {double price}) createProduct() {
  return (1, 'Product', price: 99.99);
}

void main() {
  var numbers = [5, 2, 8, 1, 9, 3];
  var (min, max) = getMinMax(numbers);  // Destructuring!
  print('Min: $min, Max: $max');  // Min: 1, Max: 9
  
  var user = createUser('An', 20);
  print('${user.name} - ${user.age} tuổi');
  
  var product = createProduct();
  print('${product.$2}: ${product.price}');
}
```

### 5.3. Record Equality

```dart
void main() {
  // Records so sánh theo GIÁ TRỊ, không phải tham chiếu
  var point1 = (x: 10, y: 20);
  var point2 = (x: 10, y: 20);
  
  print(point1 == point2);  // true! (So sánh giá trị)
  
  // Khác với class (so sánh tham chiếu)
  // var obj1 = Point(10, 20);
  // var obj2 = Point(10, 20);
  // print(obj1 == obj2);  // false! (trừ khi override ==)
}
```

### 5.4. Ví dụ thực tế: API Response

```dart
// Trả về nhiều giá trị từ function
(bool success, String? data, String? error) fetchData(bool shouldFail) {
  if (shouldFail) {
    return (false, null, 'Network error');
  }
  return (true, '{"userId": 1, "name": "An"}', null);
}

void main() {
  // Thành công
  var (success, data, error) = fetchData(false);
  if (success) {
    print('Data: $data');
  }
  
  // Thất bại
  var result = fetchData(true);
  if (!result.$1) {
    print('Error: ${result.$3}');
  }
}
```

---

## 6. Pattern Matching - Đối sánh mẫu (Dart 3.0)

### 6.1. Pattern Matching là gì?

**Pattern Matching** = So sánh và **phân rã** dữ liệu theo **cấu trúc**.

```dart
void main() {
  // Destructuring với List
  var list = [1, 2, 3];
  var [a, b, c] = list;
  print('$a, $b, $c');  // 1, 2, 3
  
  // Destructuring với Record
  var point = (x: 10, y: 20);
  var (x: px, y: py) = point;
  print('Point: ($px, $py)');  // Point: (10, 20)
  
  // Rest pattern (...)
  var numbers = [1, 2, 3, 4, 5];
  var [first, ...rest] = numbers;
  print('First: $first');  // 1
  print('Rest: $rest');    // [2, 3, 4, 5]
}
```

### 6.2. Switch với Patterns

```dart
String describe(Object obj) {
  return switch (obj) {
    // Literal pattern
    0 => 'Zero',
    1 => 'One',
    
    // Type pattern
    int n when n > 100 => 'Big number: $n',
    int n => 'Number: $n',
    
    // String length
    String s when s.isEmpty => 'Empty string',
    String s when s.length > 10 => 'Long string',
    String s => 'String: $s',
    
    // List pattern
    [] => 'Empty list',
    [var single] => 'Single element: $single',
    [var first, ...] => 'List starting with: $first',
    
    // Record pattern
    (int x, int y) => 'Point: ($x, $y)',
    
    // Default
    _ => 'Unknown type',
  };
}

void main() {
  print(describe(0));           // Zero
  print(describe(42));          // Number: 42
  print(describe(150));         // Big number: 150
  print(describe('Hi'));        // String: Hi
  print(describe([1, 2, 3]));   // List starting with: 1
  print(describe((5, 10)));     // Point: (5, 10)
}
```

### 6.3. If-case Pattern

```dart
void main() {
  var data = {'name': 'An', 'age': 25};
  
  // If-case với Map pattern
  if (data case {'name': String name, 'age': int age}) {
    print('$name is $age years old');
  }
  
  // Với guard (when)
  if (data case {'age': int age} when age >= 18) {
    print('Adult');
  } else {
    print('Minor');
  }
  
  // Với nullable
  String? input = '123';
  if (input case String s when int.tryParse(s) != null) {
    print('Valid number: ${int.parse(s)}');
  }
}
```

### 6.4. Ví dụ thực tế: JSON Parsing

```dart
void processApiResponse(Map<String, dynamic> json) {
  switch (json) {
    case {'status': 'success', 'data': List items}:
      print('Got ${items.length} items');
      for (var item in items) {
        if (item case {'id': int id, 'name': String name}) {
          print('  - $id: $name');
        }
      }
    
    case {'status': 'error', 'message': String msg}:
      print('Error: $msg');
    
    case {'status': 'loading'}:
      print('Loading...');
    
    default:
      print('Unknown response format');
  }
}

void main() {
  // Success response
  processApiResponse({
    'status': 'success',
    'data': [
      {'id': 1, 'name': 'Product A'},
      {'id': 2, 'name': 'Product B'},
    ]
  });
  
  // Error response
  processApiResponse({
    'status': 'error',
    'message': 'Network timeout',
  });
}
```

---

## 7. Sealed Classes - Lớp đóng kín (Dart 3.0)

### 7.1. Sealed Class là gì?

**Sealed Class** = Class mà **tất cả subclass phải nằm trong cùng file**. Compiler biết hết các subclass → hỗ trợ **exhaustive switch**.

```dart
// file: result.dart
sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T data;
  Success(this.data);
}

class Failure<T> extends Result<T> {
  final String error;
  Failure(this.error);
}

class Loading<T> extends Result<T> {}

// Sử dụng
void handleResult(Result<String> result) {
  // Compiler BIẾT chỉ có 3 trường hợp!
  switch (result) {
    case Success(:final data):
      print('✅ Success: $data');
    case Failure(:final error):
      print('❌ Error: $error');
    case Loading():
      print('⏳ Loading...');
    // Không cần default! Compiler biết đã cover hết!
  }
}

void main() {
  handleResult(Success('Data loaded'));
  handleResult(Failure('Network error'));
  handleResult(Loading());
}
```

### 7.2. Ví dụ: Payment State

```dart
sealed class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentProcessing extends PaymentState {
  final String transactionId;
  PaymentProcessing(this.transactionId);
}

class PaymentSuccess extends PaymentState {
  final String orderId;
  final double amount;
  PaymentSuccess(this.orderId, this.amount);
}

class PaymentFailed extends PaymentState {
  final String reason;
  PaymentFailed(this.reason);
}

String getPaymentMessage(PaymentState state) {
  return switch (state) {
    PaymentInitial() => 'Sẵn sàng thanh toán',
    PaymentProcessing(:final transactionId) => 'Đang xử lý: $transactionId',
    PaymentSuccess(:final orderId, :final amount) => 'Thành công! Đơn hàng: $orderId, Số tiền: $amount đ',
    PaymentFailed(:final reason) => 'Thất bại: $reason',
  };
}

void main() {
  print(getPaymentMessage(PaymentInitial()));
  print(getPaymentMessage(PaymentProcessing('TXN123')));
  print(getPaymentMessage(PaymentSuccess('ORD456', 500000)));
  print(getPaymentMessage(PaymentFailed('Số dư không đủ')));
}
```

---

## 8. Bài tập thực hành

### 📝 Bài 1: Generic Stack với constraints

```dart
// Yêu cầu:
// 1. Tạo class Stack<T extends Comparable> - chỉ chấp nhận kiểu so sánh được
// 2. Thêm method min() và max() trả về phần tử nhỏ nhất/lớn nhất
// 3. Test với Stack<int> và Stack<String>
```

### 📝 Bài 2: Extension methods

```dart
// Yêu cầu:
// 1. Tạo extension NumExtension on num:
//    - toCurrency(String symbol) - format tiền tệ
//    - toPercentage() - chuyển thành %
// 2. Tạo extension StringValidation on String:
//    - isValidPassword (ít nhất 8 ký tự, có chữ và số)
//    - toSlug() - chuyển thành URL slug (lowercase, thay space bằng -)
```

### 📝 Bài 3: Enhanced Enum

```dart
// Yêu cầu:
// Tạo enum HttpStatus với các giá trị:
// - ok(200, 'OK')
// - created(201, 'Created')
// - badRequest(400, 'Bad Request')
// - unauthorized(401, 'Unauthorized')
// - notFound(404, 'Not Found')
// - serverError(500, 'Internal Server Error')
//
// Thêm các method:
// - isSuccess (2xx)
// - isClientError (4xx)
// - isServerError (5xx)
```

### 📝 Bài 4: Records và Pattern Matching

```dart
// Yêu cầu:
// 1. Tạo function parseCoordinate(String input) trả về (double, double)?
//    - Input: "10.5,20.3" → (10.5, 20.3)
//    - Input invalid → null
//
// 2. Tạo function describeShape(Object shape) dùng pattern matching:
//    - (double r,) → "Circle with radius r"
//    - (double w, double h) → "Rectangle WxH"
//    - (double a, double b, double c) → "Triangle with sides a, b, c"
```

### 📝 Bài 5: Sealed Class - Network State

```dart
// Yêu cầu:
// 1. Tạo sealed class NetworkState<T>:
//    - Idle
//    - Loading
//    - Success(T data)
//    - Error(String message, int? code)
//
// 2. Tạo function renderState<T>(NetworkState<T> state) → String
//    Dùng exhaustive switch để xử lý tất cả các trường hợp
```

---

## 📌 Tóm tắt

| Khái niệm | Ý nghĩa | Cú pháp |
|-----------|---------|---------|
| **Generics** | Code dùng cho nhiều kiểu | `class Box<T> { }` |
| **Type constraints** | Giới hạn kiểu | `<T extends num>` |
| **Extension** | Thêm method cho class | `extension on String { }` |
| **Enhanced Enum** | Enum có properties/methods | `enum Status { ok('OK'); }` |
| **Cascade** | Gọi chuỗi trên 1 object | `obj..method1()..method2()` |
| **Records** | Nhóm giá trị nhẹ | `(int, String)` hoặc `({int x})` |
| **Pattern Matching** | Phân rã theo cấu trúc | `switch (obj) { case ... }` |
| **Sealed Class** | Subclass đóng kín | `sealed class Result { }` |

---

*Bài học tiếp theo: A9. Error Handling (Exceptions, Custom Errors)*
