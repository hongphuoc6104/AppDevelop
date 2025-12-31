# A6. Collections trong Dart

> **Mục tiêu:** Hiểu và sử dụng thành thạo List, Set, Map trong Dart

---

## 1. Tổng quan về Collections

**Collections** (bộ sưu tập) là các cấu trúc dữ liệu dùng để lưu trữ **nhiều phần tử**.

| Collection | Đặc điểm | Ví dụ thực tế |
|------------|----------|---------------|
| **List** | Có thứ tự, cho phép trùng lặp | Danh sách sản phẩm trong giỏ hàng |
| **Set** | Không thứ tự, **không trùng lặp** | Danh sách tags của bài viết |
| **Map** | Cặp key-value | Thông tin user (name: "An", age: 20) |

---

## 2. LIST - Danh sách có thứ tự

### 2.1. Tạo List

```dart
void main() {
  // Cách 1: Literal syntax (thường dùng nhất)
  List<String> fruits = ['Apple', 'Banana', 'Orange'];
  
  // Cách 2: Dùng var (Dart tự suy kiểu)
  var numbers = [1, 2, 3, 4, 5];
  
  // Cách 3: List rỗng với kiểu cụ thể
  List<int> emptyList = [];
  var anotherEmpty = <String>[]; // Cách khác tạo list rỗng
  
  // Cách 4: List với độ dài cố định (ít dùng)
  // List<int> fixedList = List.filled(5, 0); // [0, 0, 0, 0, 0]
  
  print(fruits);   // [Apple, Banana, Orange]
  print(numbers);  // [1, 2, 3, 4, 5]
}
```

### 2.2. Truy cập phần tử (Access)

```dart
void main() {
  var fruits = ['Apple', 'Banana', 'Orange', 'Mango'];
  
  // Index bắt đầu từ 0
  print(fruits[0]);      // Apple (phần tử đầu tiên)
  print(fruits[2]);      // Orange (phần tử thứ 3)
  
  // Phần tử đầu và cuối
  print(fruits.first);   // Apple
  print(fruits.last);    // Mango
  
  // Độ dài list
  print(fruits.length);  // 4
  
  // Kiểm tra rỗng
  print(fruits.isEmpty);     // false
  print(fruits.isNotEmpty);  // true
}
```

### 2.3. Thêm phần tử (Add)

```dart
void main() {
  var fruits = ['Apple', 'Banana'];
  
  // Thêm 1 phần tử vào cuối
  fruits.add('Orange');
  print(fruits);  // [Apple, Banana, Orange]
  
  // Thêm nhiều phần tử
  fruits.addAll(['Mango', 'Grape']);
  print(fruits);  // [Apple, Banana, Orange, Mango, Grape]
  
  // Chèn vào vị trí cụ thể
  fruits.insert(1, 'Kiwi');  // Chèn vào index 1
  print(fruits);  // [Apple, Kiwi, Banana, Orange, Mango, Grape]
  
  // Chèn nhiều phần tử vào vị trí cụ thể
  fruits.insertAll(2, ['Peach', 'Plum']);
  print(fruits);  // [Apple, Kiwi, Peach, Plum, Banana, Orange, Mango, Grape]
}
```

### 2.4. Xóa phần tử (Remove)

```dart
void main() {
  var fruits = ['Apple', 'Banana', 'Orange', 'Banana', 'Mango'];
  
  // Xóa theo giá trị (chỉ xóa phần tử ĐẦU TIÊN tìm thấy)
  fruits.remove('Banana');
  print(fruits);  // [Apple, Orange, Banana, Mango]
  
  // Xóa theo index
  fruits.removeAt(0);
  print(fruits);  // [Orange, Banana, Mango]
  
  // Xóa phần tử cuối
  fruits.removeLast();
  print(fruits);  // [Orange, Banana]
  
  // Xóa theo điều kiện
  var numbers = [1, 2, 3, 4, 5, 6];
  numbers.removeWhere((n) => n % 2 == 0);  // Xóa số chẵn
  print(numbers);  // [1, 3, 5]
  
  // Xóa tất cả
  numbers.clear();
  print(numbers);  // []
}
```

### 2.5. Duyệt List (Iterate)

```dart
void main() {
  var fruits = ['Apple', 'Banana', 'Orange'];
  
  // Cách 1: for-in (thường dùng nhất)
  print('--- for-in ---');
  for (var fruit in fruits) {
    print(fruit);
  }
  
  // Cách 2: for với index (khi cần biết vị trí)
  print('--- for index ---');
  for (var i = 0; i < fruits.length; i++) {
    print('$i: ${fruits[i]}');
  }
  
  // Cách 3: forEach (functional style)
  print('--- forEach ---');
  fruits.forEach((fruit) => print(fruit));
  
  // Cách 4: forEach với index (dùng asMap())
  print('--- forEach with index ---');
  fruits.asMap().forEach((index, fruit) {
    print('$index: $fruit');
  });
}
```

### 2.6. Các phương thức hữu ích của List

```dart
void main() {
  var numbers = [3, 1, 4, 1, 5, 9, 2, 6];
  
  // Kiểm tra phần tử tồn tại
  print(numbers.contains(5));  // true
  print(numbers.contains(99)); // false
  
  // Tìm vị trí
  print(numbers.indexOf(1));      // 1 (vị trí đầu tiên)
  print(numbers.lastIndexOf(1));  // 3 (vị trí cuối cùng)
  print(numbers.indexOf(99));     // -1 (không tìm thấy)
  
  // Sắp xếp (THAY ĐỔI list gốc)
  var sortedNumbers = [...numbers];  // Copy để không ảnh hưởng gốc
  sortedNumbers.sort();
  print(sortedNumbers);  // [1, 1, 2, 3, 4, 5, 6, 9]
  
  // Đảo ngược
  print(numbers.reversed.toList());  // [6, 2, 9, 5, 1, 4, 1, 3]
  
  // Lấy một phần (sublist)
  var sublist = numbers.sublist(2, 5);  // Từ index 2 đến 4 (không bao gồm 5)
  print(sublist);  // [4, 1, 5]
}
```

---

## 3. SET - Tập hợp không trùng lặp

### 3.1. Tạo Set

```dart
void main() {
  // Cách 1: Literal syntax
  Set<String> tags = {'flutter', 'dart', 'mobile'};
  
  // Cách 2: Dùng var
  var uniqueNumbers = {1, 2, 3, 4, 5};
  
  // ⚠️ CHÚ Ý: {} rỗng là Map, không phải Set!
  var emptySet = <String>{};  // Set rỗng
  // var wrong = {};  // Đây là Map, không phải Set!
  
  print(tags);           // {flutter, dart, mobile}
  print(uniqueNumbers);  // {1, 2, 3, 4, 5}
}
```

### 3.2. Đặc điểm quan trọng: Không trùng lặp

```dart
void main() {
  var tags = {'flutter', 'dart', 'flutter', 'mobile', 'dart'};
  print(tags);  // {flutter, dart, mobile} - tự động loại bỏ trùng lặp!
  
  // Thêm phần tử trùng
  tags.add('flutter');
  print(tags);  // {flutter, dart, mobile} - không thêm được vì đã có
  
  // Ứng dụng: Loại bỏ phần tử trùng trong List
  var listWithDuplicates = [1, 2, 2, 3, 3, 3, 4];
  var uniqueList = listWithDuplicates.toSet().toList();
  print(uniqueList);  // [1, 2, 3, 4]
}
```

### 3.3. Set Operations (Phép toán tập hợp)

```dart
void main() {
  var setA = {1, 2, 3, 4, 5};
  var setB = {4, 5, 6, 7, 8};
  
  // UNION (hợp): Tất cả phần tử từ cả 2 set
  print(setA.union(setB));  // {1, 2, 3, 4, 5, 6, 7, 8}
  
  // INTERSECTION (giao): Phần tử chung
  print(setA.intersection(setB));  // {4, 5}
  
  // DIFFERENCE (hiệu): Có trong A nhưng không có trong B
  print(setA.difference(setB));  // {1, 2, 3}
  print(setB.difference(setA));  // {6, 7, 8}
}
```

---

## 4. MAP - Cặp Key-Value

### 4.1. Tạo Map

```dart
void main() {
  // Cách 1: Literal syntax (thường dùng)
  Map<String, int> ages = {
    'An': 20,
    'Bình': 22,
    'Cường': 25,
  };
  
  // Cách 2: Dùng var
  var user = {
    'name': 'Nguyễn Văn A',
    'email': 'a@gmail.com',
    'age': 25,
  };
  
  // Map rỗng
  var emptyMap = <String, int>{};
  
  print(ages);  // {An: 20, Bình: 22, Cường: 25}
  print(user);  // {name: Nguyễn Văn A, email: a@gmail.com, age: 25}
}
```

### 4.2. Truy cập và Thao tác Map

```dart
void main() {
  var user = {
    'name': 'An',
    'age': 20,
    'city': 'HCM',
  };
  
  // Đọc giá trị theo key
  print(user['name']);  // An
  print(user['age']);   // 20
  print(user['job']);   // null (key không tồn tại)
  
  // Thêm/Cập nhật
  user['job'] = 'Developer';  // Thêm key mới
  user['age'] = 21;           // Cập nhật giá trị
  print(user);  // {name: An, age: 21, city: HCM, job: Developer}
  
  // Xóa
  user.remove('city');
  print(user);  // {name: An, age: 21, job: Developer}
  
  // Kiểm tra key tồn tại
  print(user.containsKey('name'));   // true
  print(user.containsValue(21));     // true
  
  // Lấy tất cả keys và values
  print(user.keys);    // (name, age, job)
  print(user.values);  // (An, 21, Developer)
  print(user.length);  // 3
}
```

### 4.3. Duyệt Map

```dart
void main() {
  var scores = {'Math': 90, 'English': 85, 'Physics': 88};
  
  // Cách 1: forEach
  scores.forEach((subject, score) {
    print('$subject: $score điểm');
  });
  
  // Cách 2: for-in với entries
  for (var entry in scores.entries) {
    print('${entry.key}: ${entry.value} điểm');
  }
  
  // Cách 3: Duyệt chỉ keys hoặc values
  for (var subject in scores.keys) {
    print('Môn: $subject');
  }
}
```

---

## 5. Spread Operator (`...` và `...?`)

**Spread operator** dùng để "trải" các phần tử của collection vào collection khác.

```dart
void main() {
  // === SPREAD với List ===
  var list1 = [1, 2, 3];
  var list2 = [4, 5, 6];
  
  // Gộp 2 list
  var combined = [...list1, ...list2];
  print(combined);  // [1, 2, 3, 4, 5, 6]
  
  // Thêm phần tử vào giữa
  var withMiddle = [...list1, 100, ...list2];
  print(withMiddle);  // [1, 2, 3, 100, 4, 5, 6]
  
  // === NULL-AWARE SPREAD (...?) ===
  List<int>? nullableList = null;
  
  // Dùng ...? để tránh lỗi khi list có thể null
  var safeList = [0, ...?nullableList, 99];
  print(safeList);  // [0, 99] - không lỗi dù nullableList = null
  
  // === SPREAD với Set ===
  var set1 = {1, 2, 3};
  var set2 = {3, 4, 5};
  var combinedSet = {...set1, ...set2};
  print(combinedSet);  // {1, 2, 3, 4, 5} - tự loại bỏ trùng
  
  // === SPREAD với Map ===
  var map1 = {'a': 1, 'b': 2};
  var map2 = {'c': 3, 'd': 4};
  var combinedMap = {...map1, ...map2};
  print(combinedMap);  // {a: 1, b: 2, c: 3, d: 4}
}
```

---

## 6. Collection if và Collection for

### 6.1. Collection if

Thêm phần tử vào collection **có điều kiện**.

```dart
void main() {
  var isAdmin = true;
  var isLoggedIn = true;
  
  // Thêm phần tử nếu điều kiện đúng
  var menu = [
    'Home',
    'Products',
    if (isLoggedIn) 'Profile',      // Chỉ thêm nếu đã đăng nhập
    if (isAdmin) 'Admin Panel',     // Chỉ thêm nếu là admin
  ];
  print(menu);  // [Home, Products, Profile, Admin Panel]
  
  // Collection if với Map
  var user = {
    'name': 'An',
    if (isAdmin) 'role': 'admin',
  };
  print(user);  // {name: An, role: admin}
}
```

### 6.2. Collection for

Tạo phần tử từ vòng lặp **ngay trong collection**.

```dart
void main() {
  // Tạo list bình phương
  var squares = [
    for (var i = 1; i <= 5; i++) i * i,
  ];
  print(squares);  // [1, 4, 9, 16, 25]
  
  // Kết hợp với Collection if
  var evenSquares = [
    for (var i = 1; i <= 10; i++)
      if (i % 2 == 0) i * i,  // Chỉ thêm bình phương của số chẵn
  ];
  print(evenSquares);  // [4, 16, 36, 64, 100]
  
  // Biến đổi từ list khác
  var names = ['an', 'bình', 'cường'];
  var upperNames = [
    for (var name in names) name.toUpperCase(),
  ];
  print(upperNames);  // [AN, BÌNH, CƯỜNG]
}
```

---

## 7. Higher-Order Methods cho Collections

### 7.1. `map()` - Biến đổi từng phần tử

```dart
void main() {
  var numbers = [1, 2, 3, 4, 5];
  
  // Nhân đôi mỗi phần tử
  <!-- var doubled = numbers.map((n) => n * 2).toList(); -->
  print(doubled);  // [2, 4, 6, 8, 10]
  
  // Chuyển thành String
  var strings = numbers.map((n) => 'Số: $n').toList();
  print(strings);  // [Số: 1, Số: 2, Số: 3, Số: 4, Số: 5]
  
  // Ứng dụng thực tế: Lấy tên từ list users
  var users = [
    {'name': 'An', 'age': 20},
    {'name': 'Bình', 'age': 22},
    {'name': 'Cường', 'age': 25},
  ];
  var names = users.map((user) => user['name']).toList();
  print(names);  // [An, Bình, Cường]
}
```

### 7.2. `where()` - Lọc phần tử

```dart
void main() {
  var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  // Lọc số chẵn
  var evens = numbers.where((n) => n % 2 == 0).toList();
  print(evens);  // [2, 4, 6, 8, 10]
  
  // Lọc số lớn hơn 5
  var bigNumbers = numbers.where((n) => n > 5).toList();
  print(bigNumbers);  // [6, 7, 8, 9, 10]
  
  // Kết hợp: Số chẵn và lớn hơn 5
  var filtered = numbers
      .where((n) => n % 2 == 0)
      .where((n) => n > 5)
      .toList();
  print(filtered);  // [6, 8, 10]
}
```

### 7.3. `reduce()` và `fold()` - Gộp giá trị

```dart
void main() {
  var numbers = [1, 2, 3, 4, 5];
  
  // === REDUCE: Gộp từ phần tử đầu tiên ===
  // Tính tổng
  var sum = numbers.reduce((a, b) => a + b);
  print('Tổng: $sum');  // 15
  
  // Tìm max
  var max = numbers.reduce((a, b) => a > b ? a : b);
  print('Max: $max');  // 5
  
  // === FOLD: Gộp với giá trị khởi tạo ===
  // Tính tổng bắt đầu từ 100
  var sumFrom100 = numbers.fold(100, (a, b) => a + b);
  print('Tổng từ 100: $sumFrom100');  // 115
  
  // Tính tích
  var product = numbers.fold(1, (a, b) => a * b);
  print('Tích: $product');  // 120
  
  // Nối string từ list số
  var text = numbers.fold('Numbers:', (a, b) => '$a $b');
  print(text);  // Numbers: 1 2 3 4 5
}
```

### 7.4. `any()` và `every()` - Kiểm tra điều kiện

```dart
void main() {
  var numbers = [1, 2, 3, 4, 5];
  
  // any(): Có BẤT KỲ phần tử nào thỏa mãn?
  print(numbers.any((n) => n > 3));   // true (có 4, 5 > 3)
  print(numbers.any((n) => n > 10));  // false (không có số > 10)
  
  // every(): TẤT CẢ phần tử đều thỏa mãn?
  print(numbers.every((n) => n > 0));  // true (tất cả đều > 0)
  print(numbers.every((n) => n > 3));  // false (1, 2, 3 không > 3)
  
  // Ứng dụng: Kiểm tra form validation
  var passwords = ['abc123', 'password', '12345'];
  var allValid = passwords.every((p) => p.length >= 6);
  print('Tất cả password hợp lệ: $allValid');  // true
}
```

### 7.5. `firstWhere()` và `lastWhere()` - Tìm phần tử

```dart
void main() {
  var numbers = [1, 2, 3, 4, 5, 6, 7, 8];
  
  // Tìm số chẵn đầu tiên
  var firstEven = numbers.firstWhere((n) => n % 2 == 0);
  print('Số chẵn đầu tiên: $firstEven');  // 2
  
  // Tìm số chẵn cuối cùng
  var lastEven = numbers.lastWhere((n) => n % 2 == 0);
  print('Số chẵn cuối cùng: $lastEven');  // 8
  
  // Xử lý khi không tìm thấy
  var notFound = numbers.firstWhere(
    (n) => n > 100,
    orElse: () => -1,  // Giá trị mặc định
  );
  print('Số > 100: $notFound');  // -1
}
```

### 7.6. `sort()` và `reversed` - Sắp xếp

```dart
void main() {
  var numbers = [3, 1, 4, 1, 5, 9, 2, 6];
  
  // Sort tăng dần (THAY ĐỔI list gốc!)
  var original = [...numbers];  // Copy trước khi sort
  numbers.sort();
  print('Tăng dần: $numbers');  // [1, 1, 2, 3, 4, 5, 6, 9]
  
  // Sort giảm dần
  numbers.sort((a, b) => b.compareTo(a));
  print('Giảm dần: $numbers');  // [9, 6, 5, 4, 3, 2, 1, 1]
  
  // Reversed (KHÔNG thay đổi gốc, trả về Iterable)
  print('Đảo ngược: ${original.reversed.toList()}');
  
  // Sort object theo property
  var users = [
    {'name': 'Bình', 'age': 22},
    {'name': 'An', 'age': 20},
    {'name': 'Cường', 'age': 25},
  ];
  users.sort((a, b) => (a['age'] as int).compareTo(b['age'] as int));
  print(users);  // Sorted by age
}
```

---

## 8. Chaining Methods - Kết hợp nhiều phương thức

```dart
void main() {
  var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  // Chain: Lọc số chẵn -> Nhân 3 -> Tính tổng
  var result = numbers
      .where((n) => n % 2 == 0)    // [2, 4, 6, 8, 10]
      .map((n) => n * 3)           // [6, 12, 18, 24, 30]
      .reduce((a, b) => a + b);    // 90
  
  print('Kết quả: $result');  // 90
  
  // Ứng dụng thực tế: Xử lý danh sách sản phẩm
  var products = [
    {'name': 'iPhone', 'price': 1000, 'inStock': true},
    {'name': 'MacBook', 'price': 2000, 'inStock': false},
    {'name': 'AirPods', 'price': 200, 'inStock': true},
    {'name': 'iPad', 'price': 800, 'inStock': true},
  ];
  
  // Lấy tên sản phẩm còn hàng, giá < 1000
  var affordableProducts = products
      .where((p) => p['inStock'] == true)
      .where((p) => (p['price'] as int) < 1000)
      .map((p) => p['name'])
      .toList();
  
  print('Sản phẩm giá rẻ còn hàng: $affordableProducts');
  // [AirPods, iPad]
}
```

---

## 📌 Tóm tắt

| Collection | Đặc điểm | Khi nào dùng |
|------------|----------|--------------|
| **List** | Có thứ tự, cho phép trùng | Danh sách sản phẩm, todo items |
| **Set** | Không trùng lặp | Tags, unique IDs, loại bỏ duplicate |
| **Map** | Key-Value | Config, user info, JSON data |

| Operator/Feature | Cú pháp | Mục đích |
|------------------|---------|----------|
| Spread | `...list` | Gộp collections |
| Null-aware spread | `...?list` | Spread an toàn với nullable |
| Collection if | `if (cond) item` | Thêm có điều kiện |
| Collection for | `for (x in list) expr` | Tạo từ vòng lặp |

| Method | Mục đích | Ví dụ |
|--------|----------|-------|
| `map()` | Biến đổi phần tử | `[1,2].map((x) => x*2)` → `[2,4]` |
| `where()` | Lọc phần tử | `[1,2,3].where((x) => x>1)` → `[2,3]` |
| `reduce()` | Gộp giá trị | `[1,2,3].reduce((a,b) => a+b)` → `6` |
| `fold()` | Gộp với giá trị đầu | `[1,2].fold(10, (a,b) => a+b)` → `13` |
| `any()` | Có phần tử thỏa mãn? | `[1,2,3].any((x) => x>2)` → `true` |
| `every()` | Tất cả thỏa mãn? | `[1,2,3].every((x) => x>0)` → `true` |
| `firstWhere()` | Tìm phần tử đầu | Tìm user theo ID |
| `sort()` | Sắp xếp | `[3,1,2].sort()` → `[1,2,3]` |

---

*Tiếp theo: Bài tập thực hành trong file `practice.dart`*


