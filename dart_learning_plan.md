# 📚 Kế hoạch học Dart cho Java Developer

> **Mục tiêu:** Nắm vững Dart trong 1-2 tuần với 2h/ngày
> 
> **Chiến lược:** Tập trung vào điểm khác biệt với Java + tính năng đặc trưng của Dart

---

## ✅ Đã học
- [ ] Biến, kiểu dữ liệu cơ bản
- [ ] Hàm, vòng lặp, điều kiện
- [ ] OOP cơ bản (classes, inheritance)

---

## 🎯 Phần cần học tiếp

### **Tuần 1: OOP Nâng cao & Null Safety**

#### **Ngày 1-2: OOP - Điểm khác biệt với Java** ⏱️ 4h

**So sánh quan trọng:**

| Tính năng | Java | Dart |
|-----------|------|------|
| Constructor | `public User(String name)` | `User(this.name)` - ngắn gọn hơn! |
| Named parameters | ❌ Không có | ✅ `User({required this.name})` |
| Getter/Setter | `getName()`, `setName()` | `String get name => _name;` |
| Interface | `interface IUser` | Mọi class đều là interface! |
| Abstract class | ✅ Giống nhau | ✅ Giống nhau |
| Multiple inheritance | ❌ | ✅ Dùng `mixin` |

**Thực hành:**
```dart
// 1. Named Constructor
class User {
  final String name;
  final int age;
  
  // Constructor thường
  User(this.name, this.age);
  
  // Named constructor - Java không có!
  User.guest() : name = 'Guest', age = 0;
  User.fromJson(Map<String, dynamic> json) 
      : name = json['name'], 
        age = json['age'];
}

// Sử dụng
var guest = User.guest();
var user = User.fromJson({'name': 'John', 'age': 25});

// 2. Mixin - Đa kế thừa theo kiểu Dart
mixin CanFly {
  void fly() => print('Flying!');
}

mixin CanSwim {
  void swim() => print('Swimming!');
}

class Duck extends Animal with CanFly, CanSwim {
  // Duck có thể bay VÀ bơi!
}

// 3. Extension methods - Thêm method vào class có sẵn!
extension StringExtension on String {
  bool get isEmail => contains('@');
  String capitalize() => 
    '${this[0].toUpperCase()}${substring(1)}';
}

// Sử dụng
print('hello'.capitalize()); // Hello
print('test@gmail.com'.isEmail); // true
```

**Bài tập:**
- [ ] Tạo class `BankAccount` với named constructor `fromSavings()`, `fromChecking()`
- [ ] Tạo mixin `Loggable` để thêm logging vào bất kỳ class nào
- [ ] Tạo extension cho `List<int>` để tính sum, average

---

#### **Ngày 3-4: Null Safety - Quan trọng nhất!** ⏱️ 4h

> Java có NullPointerException, Dart có Null Safety để **ngăn chặn lỗi ngay từ compile time!**

**Các khái niệm:**

```dart
// 1. Nullable vs Non-nullable
String name = 'John';      // Không thể null
String? nickname = null;   // Có thể null (có dấu ?)

// 2. Toán tử Null Safety
String? username;

// ?? - Toán tử null-coalescing
String display = username ?? 'Guest'; // Nếu null thì dùng 'Guest'

// ?. - Null-aware operator
int? length = username?.length; // Không crash nếu null

// ! - Null assertion (cẩn thận!)
String sure = username!; // Báo với Dart: "Tôi chắc không null!"
                         // Crash nếu null!

// 3. Late keyword - Khởi tạo sau
class User {
  late String token; // Sẽ gán sau, nhưng trước khi dùng
  
  void login() {
    token = 'abc123'; // Gán sau khi khởi tạo object
  }
}

// 4. Required parameters
class Product {
  final String name;
  final double price;
  
  // required - Bắt buộc phải truyền
  Product({required this.name, required this.price});
}

// Phải truyền đủ, không compile được nếu thiếu
var p = Product(name: 'Laptop', price: 1000);
```

**Bài tập:**
- [ ] Viết function `findUser(int id)` trả về `User?`
- [ ] Xử lý null an toàn với `?.`, `??`
- [ ] Tạo class với `late` initialization
- [ ] Debug: Tại sao code này lỗi? 
  ```dart
  String name;
  print(name); // ???
  ```

---

#### **Ngày 5-6: Collections (List, Set, Map)** ⏱️ 4h

**Dart Collections rất mạnh, có nhiều tính năng Java không có!**

```dart
// 1. List - Tương tự ArrayList
var numbers = [1, 2, 3];
var names = <String>['John', 'Jane']; // Generic

// Spread operator - Java không có!
var moreNumbers = [0, ...numbers, 4]; // [0, 1, 2, 3, 4]

// Collection if - Điều kiện trong collection!
var cart = [
  'Apple',
  'Banana',
  if (isPremium) 'Premium Item', // Chỉ thêm nếu true
];

// Collection for - Vòng lặp trong collection!
var doubles = [
  for (var i in numbers) i * 2
]; // [2, 4, 6]

// 2. Map - Tương tự HashMap
var user = {
  'name': 'John',
  'age': 25,
  'email': 'john@example.com'
};

// Type-safe map
var scores = <String, int>{
  'math': 90,
  'english': 85
};

// 3. Set - Không duplicate
var uniqueNumbers = <int>{1, 2, 2, 3}; // {1, 2, 3}

// 4. Methods quan trọng (Functional Programming!)
var list = [1, 2, 3, 4, 5];

// map - Transform
var doubled = list.map((n) => n * 2).toList(); // [2, 4, 6, 8, 10]

// where - Filter
var evens = list.where((n) => n % 2 == 0).toList(); // [2, 4]

// reduce - Tính tổng
var sum = list.reduce((a, b) => a + b); // 15

// any, every
bool hasEven = list.any((n) => n % 2 == 0); // true
bool allPositive = list.every((n) => n > 0); // true

// first, last, firstWhere
var first = list.first; // 1
var firstEven = list.firstWhere((n) => n % 2 == 0); // 2
```

**Bài tập:**
- [ ] Tạo list students, filter theo điểm > 8
- [ ] Dùng spread operator để merge 3 lists
- [ ] Tạo Map lưu thông tin sản phẩm, convert sang JSON string
- [ ] Dùng `collection if` tạo menu khác nhau cho user/admin

---

### **Tuần 2: Async Programming - RẤT QUAN TRỌNG cho Flutter!**

#### **Ngày 7-8: Future & async/await** ⏱️ 4h

> Giống Promise trong JavaScript, CompletableFuture trong Java

```dart
// 1. Future - Giá trị trong tương lai
Future<String> fetchUser() async {
  // Giả lập API call
  await Future.delayed(Duration(seconds: 2));
  return 'User Data';
}

// 2. async/await - Viết async code như sync code
void main() async {
  print('Start');
  
  String user = await fetchUser(); // Đợi 2 giây
  print(user);
  
  print('End');
}

// 3. Error handling
Future<String> fetchUserSafe() async {
  try {
    var response = await http.get('api.example.com/user');
    return response.body;
  } catch (e) {
    return 'Error: $e';
  }
}

// 4. Multiple Futures - Chạy song song
Future<void> fetchAll() async {
  // Chạy tuần tự (chậm)
  var user = await fetchUser();
  var posts = await fetchPosts();
  
  // Chạy song song (nhanh hơn!)
  var results = await Future.wait([
    fetchUser(),
    fetchPosts(),
    fetchComments()
  ]);
  
  print(results); // [user, posts, comments]
}

// 5. .then() vs await
// Style 1: then (giống Promise)
fetchUser().then((user) {
  print(user);
}).catchError((error) {
  print(error);
});

// Style 2: await (dễ đọc hơn!)
try {
  var user = await fetchUser();
  print(user);
} catch (error) {
  print(error);
}
```

**Bài tập trong Flutter:**
```dart
// Ví dụ thực tế: Call API
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<User>> fetchUsers() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/users')
  );
  
  if (response.statusCode == 200) {
    List jsonList = json.decode(response.body);
    return jsonList.map((json) => User.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}
```

**Bài tập:**
- [ ] Viết function fetch data từ API (dùng http package)
- [ ] Xử lý timeout với `Future.timeout()`
- [ ] Chạy 3 API calls song song với `Future.wait()`

---

#### **Ngày 9-10: Stream - Real-time data** ⏱️ 4h

> Stream = nhiều Futures theo thời gian. Quan trọng cho Firebase, WebSocket!

```dart
// 1. Stream cơ bản - Dòng dữ liệu
Stream<int> countStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i; // Emit giá trị
  }
}

// Lắng nghe stream
void main() async {
  await for (var count in countStream()) {
    print(count); // In từng giây: 1, 2, 3, 4, 5
  }
}

// 2. StreamController - Tạo stream tùy chỉnh
import 'dart:async';

var controller = StreamController<String>();

// Thêm data vào stream
controller.sink.add('Hello');
controller.sink.add('World');

// Lắng nghe
controller.stream.listen((data) {
  print(data);
});

// Đóng stream khi xong
controller.close();

// 3. Stream transformations
var numbers = Stream.fromIterable([1, 2, 3, 4, 5]);

// map - Transform
var doubled = numbers.map((n) => n * 2);

// where - Filter
var evens = numbers.where((n) => n % 2 == 0);

// listen với error handling
numbers.listen(
  (data) => print(data),
  onError: (error) => print('Error: $error'),
  onDone: () => print('Stream done!'),
);

// 4. Broadcast stream - Nhiều listeners
var stream = Stream.fromIterable([1, 2, 3]);
var broadcast = stream.asBroadcastStream();

broadcast.listen((data) => print('Listener 1: $data'));
broadcast.listen((data) => print('Listener 2: $data'));
```

**Ví dụ thực tế trong Flutter:**
```dart
// Firebase Firestore real-time updates
Stream<List<Message>> getMessages() {
  return FirebaseFirestore.instance
    .collection('messages')
    .orderBy('timestamp')
    .snapshots()
    .map((snapshot) => 
      snapshot.docs.map((doc) => Message.fromFirestore(doc)).toList()
    );
}

// Trong widget
StreamBuilder<List<Message>>(
  stream: getMessages(),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return ListView(children: snapshot.data!.map(...).toList());
    }
    return CircularProgressIndicator();
  },
)
```

**Bài tập:**
- [ ] Tạo stream đếm ngược từ 10 về 0
- [ ] Dùng StreamController để tạo chat simulation
- [ ] Transform stream: filter số chẵn, nhân đôi

---

#### **Ngày 11-12: Dart nâng cao cho Flutter** ⏱️ 4h

**1. Typedef - Định nghĩa type alias**
```dart
// Thay vì viết Function(String) callback nhiều lần
typedef OnDataReceived = void Function(String data);

class ApiClient {
  void fetchData(OnDataReceived callback) {
    callback('Data here');
  }
}
```

**2. Generics - Type parameters**
```dart
// Generic class
class Box<T> {
  final T value;
  Box(this.value);
  
  T getValue() => value;
}

var intBox = Box<int>(123);
var stringBox = Box<String>('hello');

// Generic method
T getFirst<T>(List<T> items) {
  return items.first;
}
```

**3. Enum - Tốt hơn Java từ Dart 2.17+**
```dart
// Enhanced enum (có methods!)
enum Status {
  loading,
  success,
  error;
  
  bool get isLoading => this == Status.loading;
  
  String get message {
    switch (this) {
      case Status.loading: return 'Loading...';
      case Status.success: return 'Success!';
      case Status.error: return 'Error occurred';
    }
  }
}

// Sử dụng
var status = Status.loading;
print(status.isLoading); // true
print(status.message); // Loading...
```

**4. Cascade notation (..) - Chuỗi method calls**
```dart
// Thay vì
var button = Button();
button.text = 'Click me';
button.color = Colors.blue;
button.onClick = () => print('Clicked');

// Dùng cascade
var button = Button()
  ..text = 'Click me'
  ..color = Colors.blue
  ..onClick = () => print('Clicked');
```

**5. Records & Patterns (Dart 3.0+) - MỚI!**
```dart
// Records - Return nhiều giá trị
(String, int) getUserInfo() {
  return ('John', 25); // Tuple
}

var (name, age) = getUserInfo(); // Destructuring
print('$name is $age years old');

// Pattern matching
var user = {'name': 'John', 'age': 25};
switch (user) {
  case {'name': String n, 'age': int a} when a >= 18:
    print('$n is adult');
  default:
    print('Child');
}
```

---

## 📝 Tổng kết & Checklist cuối

### ✅ Kiểm tra kiến thức
- [ ] Hiểu null safety (`?`, `!`, `??`, `late`, `required`)
- [ ] Tạo class với named constructor, mixin
- [ ] Dùng collection operators (spread, if, for)
- [ ] Viết async code với `Future` và `async/await`
- [ ] Làm việc với `Stream` và `StreamController`
- [ ] Dùng functional methods (`map`, `where`, `reduce`)
- [ ] Hiểu generics, typedef, cascade notation

### 🎯 Dự án mini để practice

**Weather App Console (Tích hợp tất cả)**
```dart
// Kết hợp:
// - API call (Future/async)
// - JSON parsing (Map, fromJson)
// - Null safety
// - Collection operations
// - Error handling

class WeatherApp {
  Future<void> run() async {
    try {
      var weather = await fetchWeather('Hanoi');
      if (weather != null) {
        print(weather.display);
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  
  Future<Weather?> fetchWeather(String city) async {
    // Call API
    // Parse JSON
    // Return Weather object
  }
}
```

---

## 🚀 Bước tiếp theo

Sau khi hoàn thành Dart:
1. ✅ Cài đặt Flutter SDK
2. ✅ Tạo project Flutter đầu tiên
3. ✅ Học Widget cơ bản
4. ✅ Áp dụng kiến thức Dart vào Flutter

---

## 📚 Tài nguyên học

### Tài liệu chính thức
- [dart.dev/language](https://dart.dev/language) - Ngắn gọn, chính xác
- [dart.dev/codelabs](https://dart.dev/codelabs) - Thực hành

### Practice online
- [dartpad.dev](https://dartpad.dev) - Code trực tiếp
- [exercism.org/tracks/dart](https://exercism.org/tracks/dart) - Bài tập

### Video (nếu thích)
- Dart từ A-Z (YouTube tiếng Việt)
- Dart Programming Tutorial - Full Course (FreeCodeCamp)

---

**💪 Lời khuyên cuối:**
- Đừng học thuộc lòng, hãy CODE NHIỀU!
- Mỗi khái niệm mới, viết 3-5 ví dụ khác nhau
- So sánh với Java để nhớ lâu hơn
- Sau 2 tuần, sang Flutter ngay, đừng kéo dài việc học Dart!
