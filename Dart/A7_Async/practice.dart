// A7. Asynchronous Programming - Bài tập thực hành
// Thực hiện các bài tập bên dưới

// ============================================
// BÀI 1: Future cơ bản
// ============================================
// Yêu cầu:
// 1. Tạo Future<String> fetchGreeting() trả về "Xin chào!" sau 2 giây
// 2. Tạo Future<int> fetchNumber() trả về số 42 sau 1 giây
// 3. Trong testFutureBasic(), gọi cả 2 Future và in kết quả

// Code của bạn ở đây:
Future<String> fetchGreeting() {
  return Future.delayed(Duration(seconds: 2), () => 'Xin chào!');
}

Future<int> fetchNumber() {
  return Future.delayed(Duration(seconds: 1), () => 42);
}

Future<void> testFutureBasic() async {
  print('Bắt đầu gọi...');
  
  var greeting = await fetchGreeting();
  var number = await fetchNumber();
  
  print('Kết quả: $greeting, $number');
}


// ============================================
// BÀI 2: async/await với giả lập API
// ============================================
// Yêu cầu:
// 1. Tạo Future<Map<String, dynamic>> fetchProduct(int id)
//    - Delay 1.5 giây
//    - Trả về: {'id': id, 'name': 'iPhone 15', 'price': 25000000}
//
// 2. Tạo Future<List<String>> fetchReviews(int productId)
//    - Delay 1 giây
//    - Trả về: ['Tốt lắm!', 'Đáng mua', 'Ship nhanh']
//
// 3. Trong testAsyncAwait():
//    - Gọi fetchProduct(1)
//    - Gọi fetchReviews(1)
//    - In thông tin sản phẩm và reviews

// Code của bạn ở đây:

Future<Map<String, dynamic>> fetchProduct(int id) async {
  await Future.delayed(Duration(seconds: 1, milliseconds: 500));
  return {'id': id, 'name': 'iPhone 15', 'price': 25000000};
}

Future<List<String>> fetchReviews(int productId) async {
  await Future.delayed(Duration(seconds: 1));
  return ['Tốt lắm!', 'Đáng mua', 'Ship nhanh'];
}

Future<void> testAsyncAwait() async {
  print('Bắt đầu gọi...');
  
  var product = await fetchProduct(1);
  var reviews = await fetchReviews(product['id']);
  
  print('Thông tin sản phẩm: $product');
  print('Reviews: $reviews');
}

// ============================================
// BÀI 3: Future.wait() - Chạy song song
// ============================================
// Yêu cầu:
// Tạo 3 Future giả lập:
// - fetchWeather(): delay 2s, trả về "Sunny, 28°C"
// - fetchNews(): delay 3s, trả về ["Tin 1", "Tin 2", "Tin 3"]
// - fetchNotifications(): delay 1s, trả về 5 (số thông báo)
//
// Trong testFutureWait():
// - Dùng Future.wait() để gọi cả 3 cùng lúc
// - In thời gian tổng cộng (phải ~3 giây, không phải 6 giây)
// - In kết quả của cả 3 Future

// Code của bạn ở đây:
Future<String> fetchWeather() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Sunny, 28°C';
}

Future<List<String>> fetchNews() async {
  await Future.delayed(Duration(seconds: 3));
  return ['Tin 1', 'Tin 2', 'Tin 3'];
}

Future<int> fetchNotifications() async {
  await Future.delayed(Duration(seconds: 1));
  return 5;
}

Future<void> testFutureWait() async {
  var start = DateTime.now();
  print('Bắt đầu gọi...');
  
  var result = await Future.wait([
    fetchWeather(),
    fetchNews(),
    fetchNotifications(),
  ]);
  
  print(result);
  print('Thời gian tổng cộng: ${DateTime.now().difference(start).inSeconds} giây');
}


// ============================================
// BÀI 4: Xử lý lỗi với try-catch
// ============================================
// Yêu cầu:
// 1. Tạo Future<String> fetchUserData(int id):
//    - Nếu id < 0: throw ArgumentError('ID phải >= 0')
//    - Nếu id == 0: throw Exception('User không tồn tại')
//    - Nếu id > 0: delay 1s, trả về 'User $id: Nguyễn Văn A'
//
// 2. Trong testErrorHandling():
//    - Gọi fetchUserData với id = -1, 0, 1
//    - Xử lý tất cả các trường hợp lỗi bằng try-catch
//    - In thông báo phù hợp cho từng trường hợp

// Code của bạn ở đây:
Future<String> fetchUserData(int id) async {
  if (id < 0) {
    throw ArgumentError('ID phải >= 0');
  }
  if (id == 0) {
    throw Exception('User không tồn tại');
  }
  await Future.delayed(Duration(seconds: 1));
  return 'User $id: Nguyễn Văn A';
}

Future<void> testErrorHandling() async {
  print('Bắt đầu gọi...');
  for (var id in [-1, 0, 1]) {
    try {
      var result = await fetchUserData(id);
      print(result);
    } catch (e) {
      print(e);
    }
  }
}


// ============================================
// BÀI 5: Stream countdown (NÂNG CAO)
// ============================================
// Yêu cầu:
// 1. Tạo Stream<String> countdown(int from) đếm ngược từ 'from' về 0
//    - Mỗi giây phát ra 1 số dạng String: "5", "4", "3"...
//    - Khi về 0, phát "🎉 Happy New Year!"
//
// 2. Trong testStreamCountdown():
//    - Gọi countdown(5)
//    - In từng giây đếm ngược

// Code của bạn ở đây:
Stream<String> countdown (int from) async* {
  for (int i = from; i >= 0; i--) {
    await Future.delayed(Duration(seconds: 1));
    yield i.toString();
  }
  yield '🎉 Happy New Year!';
}

Future<void> testStreamCountdown() async {
  print('Bắt đầu gọi...');
  
  await for (var i in countdown(5)) {
    print(i);
  }
}


// ============================================
// MAIN - Test code của bạn
// ============================================
void main() async {
  // Uncomment từng bài để test

  // Bài 1: Future cơ bản
  await testFutureBasic();

  // Bài 2: async/await với API
  await testAsyncAwait();

  // Bài 3: Future.wait()
  await testFutureWait();

  // Bài 4: Error handling
  await testErrorHandling();

  // Bài 5: Stream countdown
  await testStreamCountdown();

  print('Hãy uncomment và hoàn thành từng bài!');
}
