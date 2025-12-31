# A7. Asynchronous Programming - Lập trình Bất đồng bộ

> **Mục tiêu:** Hiểu và sử dụng thành thạo Future, async/await, Stream trong Dart
> **Thời gian học:** 2-3 buổi (mỗi buổi ~2 giờ)

---

## 📚 Mục lục

1. [Giới thiệu: Tại sao cần Async?](#1-giới-thiệu-tại-sao-cần-async)
2. [Future - Khái niệm cốt lõi](#2-future---khái-niệm-cốt-lõi)
3. [async / await - Cú pháp hiện đại](#3-async--await---cú-pháp-hiện-đại)
4. [Các phương thức Future](#4-các-phương-thức-future)
5. [Xử lý lỗi trong Async](#5-xử-lý-lỗi-trong-async)
6. [Stream - Luồng dữ liệu](#6-stream---luồng-dữ-liệu)
7. [Bài tập thực hành](#7-bài-tập-thực-hành)

---

## 1. Giới thiệu: Tại sao cần Async?

### 1.1. Vấn đề với Synchronous (Đồng bộ)

**Synchronous** (đồng bộ) = Thực hiện **tuần tự**, từng dòng một.

```dart
void main() {
  print('Bước 1: Bắt đầu');
  
  // Giả sử đây là thao tác tốn 5 giây (gọi API, đọc file...)
  // Trong synchronous, chương trình sẽ ĐỨNG YÊN chờ!
  var data = fetchDataFromServer();  // ⏳ Chờ 5 giây...
  
  print('Bước 2: Xử lý dữ liệu');
  print('Bước 3: Hoàn thành');
}
```

**Vấn đề:**
- 🔴 Ứng dụng bị **"đơ"** trong lúc chờ
- 🔴 Người dùng không thể tương tác
- 🔴 UX (User Experience) rất tệ

### 1.2. Giải pháp: Asynchronous (Bất đồng bộ)

**Asynchronous** (bất đồng bộ) = **Không chờ đợi**, tiếp tục thực hiện các tác vụ khác.

```dart
void main() {
  print('Bước 1: Bắt đầu');
  
  // Gọi API nhưng KHÔNG CHỜ, tiếp tục chạy code bên dưới
  fetchDataFromServer().then((data) {
    print('Bước 2: Nhận dữ liệu: $data');
  });
  
  print('Bước 3: Code này chạy NGAY, không chờ API');
}
```

**Output:**
```
Bước 1: Bắt đầu
Bước 3: Code này chạy NGAY, không chờ API
Bước 2: Nhận dữ liệu: {...}  ← Sau khi API trả về
```

### 1.3. Ví dụ thực tế

| Tình huống | Synchronous 😢 | Asynchronous 😊 |
|------------|----------------|-----------------|
| Gọi API | App đơ 3 giây | Loading spinner, app vẫn chạy |
| Đọc file lớn | Không làm gì được | Đọc nền, báo khi xong |
| Tải ảnh | Màn hình trắng | Hiện placeholder, ảnh load dần |

### 1.4. Từ vựng quan trọng

| Tiếng Anh | Tiếng Việt | Giải thích |
|-----------|------------|------------|
| **Synchronous** | Đồng bộ | Chờ xong mới làm tiếp |
| **Asynchronous** | Bất đồng bộ | Không chờ, làm song song |
| **Future** | Tương lai | Kết quả sẽ có trong tương lai |
| **await** | Chờ đợi | Đợi Future hoàn thành |
| **async** | Bất đồng bộ | Đánh dấu hàm bất đồng bộ |
| **Stream** | Luồng | Nhiều giá trị theo thời gian |

---

## 2. Future - Khái niệm cốt lõi

### 2.1. Future là gì?

**Future** = Một **"lời hứa"** rằng sẽ có kết quả trong **tương lai**.

```
┌─────────────────────────────────────────────────────────┐
│                         FUTURE                          │
├─────────────────────────────────────────────────────────┤
│                                                         │
│   Trạng thái 1: UNCOMPLETED (Chưa hoàn thành)          │
│   ┌─────────────────────────────────────────┐          │
│   │  🔄 Đang xử lý... chờ kết quả           │          │
│   └─────────────────────────────────────────┘          │
│                         │                               │
│                         ▼                               │
│   ┌─────────────────────┬─────────────────────┐        │
│   │                     │                     │        │
│   ▼                     ▼                     │        │
│  Trạng thái 2A:      Trạng thái 2B:          │        │
│  COMPLETED           COMPLETED                │        │
│  with VALUE          with ERROR               │        │
│  ✅ Thành công       ❌ Thất bại              │        │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### 2.2. Tạo Future đơn giản

```dart
// Future trả về sau 2 giây
Future<String> fetchUserName() {
  return Future.delayed(
    Duration(seconds: 2),
    () => 'Nguyễn Văn A',  // Giá trị trả về sau 2 giây
  );
}

void main() {
  print('Bắt đầu gọi...');
  
  Future<String> futureResult = fetchUserName();
  print('Future được tạo: $futureResult');  // Instance of 'Future<String>'
  
  // Sau 2 giây, nhận kết quả
  futureResult.then((name) {
    print('Kết quả: $name');
  });
  
  print('Code tiếp tục chạy...');
}
```

**Output:**
```
Bắt đầu gọi...
Future được tạo: Instance of 'Future<String>'
Code tiếp tục chạy...
Kết quả: Nguyễn Văn A  ← Sau 2 giây
```

### 2.3. Các cách tạo Future

```dart
void main() {
  // 1. Future.value() - Tạo Future với giá trị ngay lập tức
  Future<int> immediateValue = Future.value(42);
  
  // 2. Future.delayed() - Tạo Future với độ trễ
  Future<String> delayedValue = Future.delayed(
    Duration(seconds: 2),
    () => 'Xin chào!',
  );
  
  // 3. Future.error() - Tạo Future với lỗi
  Future<String> errorFuture = Future.error('Có lỗi xảy ra!');
  
  // 4. Trả về Future từ async function
  Future<String> asyncResult = fetchData();
  
  print('Tất cả Future đã được tạo');
}

Future<String> fetchData() async {
  return 'Dữ liệu từ server';
}
```

### 2.4. Xử lý kết quả Future với .then()

```dart
void main() {
  // .then() - Xử lý khi Future THÀNH CÔNG
  fetchUserData()
    .then((user) {
      print('Tên: ${user['name']}');
      print('Email: ${user['email']}');
    });
  
  print('Đang tải dữ liệu...');
}

Future<Map<String, String>> fetchUserData() {
  return Future.delayed(
    Duration(seconds: 1),
    () => {
      'name': 'Nguyễn Văn A',
      'email': 'nguyenvana@email.com',
    },
  );
}
```

**Output:**
```
Đang tải dữ liệu...
Tên: Nguyễn Văn A
Email: nguyenvana@email.com
```

---

## 3. async / await - Cú pháp hiện đại

### 3.1. Vấn đề với .then() chains

Khi có nhiều Future phụ thuộc nhau, code trở nên phức tạp:

```dart
// ❌ Callback Hell - Khó đọc!
void fetchMultipleData() {
  fetchUserId()
    .then((userId) {
      return fetchUserProfile(userId)
        .then((profile) {
          return fetchUserPosts(userId)
            .then((posts) {
              print('User: $profile');
              print('Posts: $posts');
            });
        });
    });
}
```

### 3.2. Giải pháp: async / await

**`async`** = Đánh dấu hàm là bất đồng bộ  
**`await`** = Đợi Future hoàn thành trước khi tiếp tục

```dart
// ✅ Dùng async/await - Dễ đọc như code đồng bộ!
Future<void> fetchMultipleData() async {
  String userId = await fetchUserId();
  Map profile = await fetchUserProfile(userId);
  List posts = await fetchUserPosts(userId);
  
  print('User: $profile');
  print('Posts: $posts');
}
```

### 3.3. Quy tắc sử dụng async/await

```dart
// ===== QUY TẮC 1: Hàm dùng await PHẢI có async =====
Future<String> getUserName() async {  // ← async ở đây
  String name = await fetchName();    // ← await bên trong
  return name;
}

// ===== QUY TẮC 2: Hàm async LUÔN trả về Future =====
Future<int> calculate() async {
  return 42;  // Tự động wrap thành Future<int>
}

// ===== QUY TẮC 3: await CHỈ dùng trong hàm async =====
void main() async {  // ← main cũng có thể async!
  String name = await getUserName();
  print(name);
}

// ===== QUY TẮC 4: await chờ Future hoàn thành =====
Future<void> demo() async {
  print('Trước await');
  await Future.delayed(Duration(seconds: 2));  // Chờ 2 giây
  print('Sau await');  // Chạy sau 2 giây
}
```

### 3.4. Ví dụ thực tế: Giả lập gọi API

```dart
// Giả lập gọi API lấy thông tin người dùng
Future<Map<String, dynamic>> fetchUser(int userId) async {
  print('📡 Đang gọi API lấy user $userId...');
  
  // Giả lập delay mạng 2 giây
  await Future.delayed(Duration(seconds: 2));
  
  // Trả về dữ liệu giả
  return {
    'id': userId,
    'name': 'Nguyễn Văn A',
    'email': 'nguyenvana@gmail.com',
    'age': 25,
  };
}

// Giả lập gọi API lấy danh sách bài viết
Future<List<String>> fetchPosts(int userId) async {
  print('📡 Đang gọi API lấy posts của user $userId...');
  
  await Future.delayed(Duration(seconds: 1));
  
  return [
    'Bài viết 1: Học Dart cơ bản',
    'Bài viết 2: Async/Await trong Dart',
    'Bài viết 3: Flutter cho người mới',
  ];
}

void main() async {
  print('🚀 Bắt đầu chương trình\n');
  
  // Gọi tuần tự (sequential) - Tổng: 3 giây
  var user = await fetchUser(1);
  print('✅ Nhận được user: ${user['name']}\n');
  
  var posts = await fetchPosts(1);
  print('✅ Nhận được ${posts.length} bài viết\n');
  
  // In kết quả
  print('═══════════════════════════════');
  print('👤 Thông tin người dùng:');
  print('   Tên: ${user['name']}');
  print('   Email: ${user['email']}');
  print('   Tuổi: ${user['age']}');
  print('');
  print('📝 Danh sách bài viết:');
  for (var post in posts) {
    print('   - $post');
  }
  print('═══════════════════════════════');
}
```

---

## 4. Các phương thức Future

### 4.1. Future.delayed()

Tạo Future hoàn thành sau một khoảng thời gian.

```dart
void main() async {
  print('Bắt đầu: ${DateTime.now()}');
  
  // Chờ 3 giây
  await Future.delayed(Duration(seconds: 3));
  
  print('Sau 3 giây: ${DateTime.now()}');
  
  // Chờ và trả về giá trị
  String message = await Future.delayed(
    Duration(seconds: 2),
    () => 'Xin chào sau 2 giây!',
  );
  print(message);
}
```

### 4.2. Future.wait() - Chạy song song

Chờ **nhiều Future** hoàn thành **đồng thời**.

```dart
Future<String> fetchUserName() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Nguyễn Văn A';
}

Future<int> fetchUserAge() async {
  await Future.delayed(Duration(seconds: 3));
  return 25;
}

Future<String> fetchUserEmail() async {
  await Future.delayed(Duration(seconds: 1));
  return 'nguyenvana@email.com';
}

void main() async {
  print('🚀 Bắt đầu');
  var startTime = DateTime.now();
  
  // ❌ CÁCH 1: Tuần tự - Tổng 6 giây (2+3+1)
  // var name = await fetchUserName();
  // var age = await fetchUserAge();
  // var email = await fetchUserEmail();
  
  // ✅ CÁCH 2: Song song với Future.wait() - Chỉ 3 giây (max)
  var results = await Future.wait([
    fetchUserName(),   // 2 giây
    fetchUserAge(),    // 3 giây  ← Lâu nhất
    fetchUserEmail(),  // 1 giây
  ]);
  
  var name = results[0] as String;
  var age = results[1] as int;
  var email = results[2] as String;
  
  var endTime = DateTime.now();
  var duration = endTime.difference(startTime).inSeconds;
  
  print('👤 Name: $name');
  print('🎂 Age: $age');
  print('📧 Email: $email');
  print('⏱️ Tổng thời gian: $duration giây');  // ~3 giây
}
```

### 4.3. .then(), .catchError(), .whenComplete()

```dart
void main() {
  fetchData()
    .then((data) {
      // Chạy khi THÀNH CÔNG
      print('✅ Dữ liệu: $data');
    })
    .catchError((error) {
      // Chạy khi CÓ LỖI
      print('❌ Lỗi: $error');
    })
    .whenComplete(() {
      // LUÔN chạy (dù thành công hay lỗi)
      print('🏁 Hoàn thành!');
    });
}

Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 1));
  
  // Uncomment để test lỗi:
  // throw Exception('Không thể kết nối server!');
  
  return 'Dữ liệu từ server';
}
```

### 4.4. Future.timeout()

Giới hạn thời gian chờ Future.

```dart
void main() async {
  try {
    // Nếu quá 2 giây → throw TimeoutException
    var result = await slowOperation().timeout(
      Duration(seconds: 2),
      onTimeout: () => 'Timeout! Trả về giá trị mặc định',
    );
    print('Kết quả: $result');
  } catch (e) {
    print('Lỗi: $e');
  }
}

Future<String> slowOperation() async {
  await Future.delayed(Duration(seconds: 5));  // 5 giây
  return 'Kết quả chậm';
}
```

---

## 5. Xử lý lỗi trong Async

### 5.1. try-catch-finally

```dart
Future<void> fetchDataWithErrorHandling() async {
  try {
    print('🔄 Đang tải dữ liệu...');
    
    // Có thể throw error
    var data = await fetchFromApi();
    print('✅ Dữ liệu: $data');
    
  } catch (e) {
    // Bắt mọi loại lỗi
    print('❌ Lỗi xảy ra: $e');
    
  } finally {
    // Luôn chạy (cleanup)
    print('🧹 Dọn dẹp resources...');
  }
}

Future<String> fetchFromApi() async {
  await Future.delayed(Duration(seconds: 1));
  throw Exception('Server không phản hồi!');
}

void main() async {
  await fetchDataWithErrorHandling();
}
```

### 5.2. Bắt lỗi cụ thể với on

```dart
void main() async {
  try {
    await riskyOperation();
  } on FormatException catch (e) {
    // Chỉ bắt FormatException
    print('Lỗi format: $e');
  } on HttpException catch (e) {
    // Chỉ bắt HttpException
    print('Lỗi HTTP: $e');
  } catch (e) {
    // Bắt các lỗi khác
    print('Lỗi không xác định: $e');
  }
}

// Tự định nghĩa Exception
class HttpException implements Exception {
  final String message;
  final int statusCode;
  
  HttpException(this.message, this.statusCode);
  
  @override
  String toString() => 'HttpException: $statusCode - $message';
}

Future<void> riskyOperation() async {
  throw HttpException('Not Found', 404);
}
```

### 5.3. Ví dụ thực tế: Retry pattern

```dart
Future<String> fetchWithRetry({int maxRetries = 3}) async {
  int attempts = 0;
  
  while (attempts < maxRetries) {
    try {
      attempts++;
      print('📡 Lần thử $attempts...');
      
      var result = await fetchData();
      return result;  // Thành công → thoát
      
    } catch (e) {
      print('❌ Thất bại: $e');
      
      if (attempts >= maxRetries) {
        print('💀 Đã thử $maxRetries lần, bỏ cuộc!');
        rethrow;  // Ném lại lỗi
      }
      
      // Chờ trước khi thử lại
      var waitTime = Duration(seconds: attempts);
      print('⏳ Chờ ${waitTime.inSeconds} giây...\n');
      await Future.delayed(waitTime);
    }
  }
  
  throw Exception('Unexpected error');
}

Future<String> fetchData() async {
  await Future.delayed(Duration(milliseconds: 500));
  
  // Giả lập: 70% thất bại
  if (DateTime.now().millisecond % 10 < 7) {
    throw Exception('Network error');
  }
  
  return 'Dữ liệu thành công!';
}

void main() async {
  try {
    var result = await fetchWithRetry(maxRetries: 5);
    print('✅ Kết quả: $result');
  } catch (e) {
    print('💔 Thất bại hoàn toàn: $e');
  }
}
```

---

## 6. Stream - Luồng dữ liệu

### 6.1. Future vs Stream

| Đặc điểm | Future | Stream |
|----------|--------|--------|
| Số giá trị | **1** giá trị duy nhất | **Nhiều** giá trị theo thời gian |
| Ví dụ | Gọi API 1 lần | Real-time chat, timer |
| Hoàn thành | 1 lần | Có thể mãi mãi |

```
Future:   ──────────────────●  (1 giá trị)
                            ↑
                         Hoàn thành

Stream:   ──●───●───●───●───●───●───●───  (nhiều giá trị)
             ↑   ↑   ↑   ↑   ↑   ↑   ↑
          Các giá trị phát ra theo thời gian
```

### 6.2. Tạo Stream đơn giản

```dart
// Stream phát số từ 1 đến 5, mỗi giây 1 số
Stream<int> countStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;  // "Phát" giá trị
  }
}

void main() async {
  print('🚀 Bắt đầu lắng nghe Stream...\n');
  
  // Cách 1: await for
  await for (var number in countStream()) {
    print('📨 Nhận được: $number');
  }
  
  print('\n✅ Stream kết thúc!');
}
```

**Output:**
```
🚀 Bắt đầu lắng nghe Stream...

📨 Nhận được: 1
📨 Nhận được: 2
📨 Nhận được: 3
📨 Nhận được: 4
📨 Nhận được: 5

✅ Stream kết thúc!
```

### 6.3. Stream.listen()

```dart
void main() {
  // Tạo stream
  var stream = countStream();
  
  // Lắng nghe stream
  var subscription = stream.listen(
    (data) {
      print('📨 Data: $data');
    },
    onError: (error) {
      print('❌ Error: $error');
    },
    onDone: () {
      print('✅ Stream hoàn thành!');
    },
    cancelOnError: false,  // Tiếp tục dù có lỗi
  );
  
  // Có thể pause/resume/cancel
  // subscription.pause();
  // subscription.resume();
  // subscription.cancel();
}

Stream<int> countStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}
```

### 6.4. Stream.periodic() - Timer

```dart
void main() async {
  print('⏱️ Bắt đầu đếm giờ...\n');
  
  // Stream phát giá trị mỗi giây
  var timerStream = Stream.periodic(
    Duration(seconds: 1),
    (count) => count + 1,  // Biến đổi giá trị
  ).take(10);  // Chỉ lấy 10 giá trị
  
  await for (var second in timerStream) {
    print('⏰ Giây thứ: $second');
  }
  
  print('\n✅ Hết 10 giây!');
}
```

### 6.5. Ví dụ: Giả lập Stock Price Stream

```dart
import 'dart:math';

// Stream giá cổ phiếu cập nhật liên tục
Stream<double> stockPriceStream(String symbol, double startPrice) async* {
  var random = Random();
  var currentPrice = startPrice;
  
  while (true) {  // Stream vô hạn
    await Future.delayed(Duration(seconds: 2));
    
    // Giá dao động ±2%
    var change = (random.nextDouble() - 0.5) * 0.04;
    currentPrice *= (1 + change);
    
    yield double.parse(currentPrice.toStringAsFixed(2));
  }
}

void main() async {
  print('📈 Theo dõi giá cổ phiếu VNM...\n');
  
  // Lấy 5 lần cập nhật giá
  await for (var price in stockPriceStream('VNM', 100.0).take(5)) {
    print('💰 VNM: \$$price');
  }
  
  print('\n🛑 Ngừng theo dõi');
}
```

---

## 7. Bài tập thực hành

### 📝 Bài 1: Future cơ bản

```dart
// Yêu cầu:
// 1. Tạo Future<String> fetchGreeting() trả về "Xin chào!" sau 2 giây
// 2. Tạo Future<int> fetchNumber() trả về số 42 sau 1 giây
// 3. Trong main(), gọi cả 2 Future và in kết quả
```

### 📝 Bài 2: async/await với giả lập API

```dart
// Yêu cầu:
// 1. Tạo Future<Map> fetchProduct(int id) - giả lập lấy sản phẩm (delay 1.5s)
//    Trả về: {'id': id, 'name': 'iPhone 15', 'price': 25000000}
// 2. Tạo Future<List<String>> fetchReviews(int productId) - lấy reviews (delay 1s)
//    Trả về: ['Tốt lắm!', 'Đáng mua', 'Ship nhanh']
// 3. Trong main():
//    - Gọi fetchProduct(1)
//    - Gọi fetchReviews(1)
//    - In thông tin sản phẩm và reviews
```

### 📝 Bài 3: Future.wait() - Song song

```dart
// Yêu cầu:
// Tạo 3 Future giả lập:
// - fetchWeather(): delay 2s, trả về "Sunny, 28°C"
// - fetchNews(): delay 3s, trả về ["News 1", "News 2"]
// - fetchNotifications(): delay 1s, trả về 5 (số thông báo)
//
// Dùng Future.wait() để gọi cả 3 cùng lúc
// In thời gian tổng cộng (phải ~3 giây, không phải 6 giây)
```

### 📝 Bài 4: Xử lý lỗi

```dart
// Yêu cầu:
// 1. Tạo Future<String> fetchUserData(int id):
//    - Nếu id < 0: throw ArgumentError('ID không hợp lệ')
//    - Nếu id == 0: throw Exception('User không tồn tại')
//    - Nếu id > 0: delay 1s, trả về 'User $id'
//
// 2. Trong main(), gọi fetchUserData với id = -1, 0, 1
//    Xử lý tất cả các trường hợp lỗi bằng try-catch
```

### 📝 Bài 5: Stream countdown

```dart
// Yêu cầu:
// 1. Tạo Stream<int> countdown(int from) đếm ngược từ 'from' về 0
//    - Mỗi giây phát ra 1 số
//    - Khi về 0, phát "🎉 Happy New Year!" (dùng yield*)
//
// 2. Trong main(), gọi countdown(5) và in từng giây
```

---

## 📌 Tóm tắt

### Cú pháp quan trọng

```dart
// Future
Future<T> myFunction() async {
  return value;
}

// Gọi Future
var result = await myFunction();

// Future.wait() - song song
var [a, b, c] = await Future.wait([future1, future2, future3]);

// Stream
Stream<T> myStream() async* {
  yield value;      // Phát 1 giá trị
  yield* stream;    // Phát cả stream khác
}

// Lắng nghe Stream
await for (var item in stream) { }
stream.listen((data) { });
```

### Checklist kiến thức

- [ ] Hiểu sự khác biệt Sync vs Async
- [ ] Tạo và sử dụng Future
- [ ] Dùng async/await
- [ ] Future.delayed(), Future.wait()
- [ ] Xử lý lỗi với try-catch
- [ ] Tạo Stream với async*
- [ ] Lắng nghe Stream với await for hoặc listen()

---

*Bài học tiếp theo: A8. Advanced Dart (Generics, Extensions, Records)*
