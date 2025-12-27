# Bài Bổ Sung: A3 & A4 Advanced Concepts

Chúng ta sẽ học bù những kiến thức quan trọng đã bị bỏ sót trong checklist. Đây là những kỹ thuật "Pro" mà code Flutter thực tế dùng hàng ngày.

## 1. Anonymous Functions (Hàm ẩn danh / Lambda)
Là hàm **không có tên**. Thường dùng khi bạn muốn truyền một hành động vào chỗ nào đó mà chỉ dùng một lần.

**Cú pháp:**
```dart
(parameters) {
  // body
}
```

**Ví dụ:**
```dart
void main() {
  var list = ['Apple', 'Banana', 'Orange'];

  // Cách cũ: Dùng vòng lặp for
  // Cách mới: Dùng forEach kết hợp hàm ẩn danh
  list.forEach((item) {
    print(item); // Hàm này không có tên, được "nhúng" trực tiếp vào đây
  });
}
```

---

## 2. Higher-Order Functions (Hàm bậc cao)
Là hàm **nhận một hàm khác làm tham số** HOẶC **trả về một hàm**.

**Ví dụ kinh điển: Xử lý List** (Sau này dùng rất nhiều!)
- `map`: Biến đổi từng phần tử.
- `where`: Lọc phần tử.

```dart
void main() {
  List<int> numbers = [1, 2, 3, 4, 5];

  // Lọc số chẵn (where nhận vào hàm kiểm tra)
  var evenNumbers = numbers.where((n) => n % 2 == 0); 

  // Nhân đôi các số (map nhận vào hàm biến đổi)
  var doubled = numbers.map((n) => n * 2);

  print(evenNumbers); // (2, 4)
  print(doubled);     // (2, 4, 6, 8, 10)
}
```

---

## 3. Static Keyword (Tĩnh)
`static` biến một thuộc tính/hàm thành tài sản của **Lớp (Class)** chứ không phải của **Đối tượng (Object)**.
Dùng khi muốn chia sẻ dữ liệu chung hoặc viết hàm tiện ích (Utility).

**Ví dụ:**
```dart
class MathUtils {
  // Biến static: Dùng chung cho toàn bộ app
  static const double pi = 3.14159;

  // Hàm static: Gọi trực tiếp từ tên Class, không cần tạo object
  static double calculateCircleArea(double radius) {
    return pi * radius * radius;
  }
}

void main() {
  // Không cần: var math = MathUtils();
  // Gọi trực tiếp:
  print(MathUtils.pi); 
  print(MathUtils.calculateCircleArea(10));
}
```

---

## 4. Factory Constructor (Hàm khởi tạo Nhà máy)
Constructor bình thường **luôn luôn** tạo ra object mới.
`factory` constructor **có quyền quyết định**:
- Trả về object mới.
- HOẶC trả về object cũ (Cache/Singleton).
- HOẶC trả về object của class con.

**Ví dụ: Singleton (Chỉ tạo 1 object duy nhất trong suốt vòng đời app)**
```dart
class DatabaseConnection {
  // 1. Biến static để lưu instance duy nhất
  static final DatabaseConnection _instance = DatabaseConnection._internal();

  // 2. Private constructor (để không ai gọi new lung tung được)
  DatabaseConnection._internal() {
    print("Kết nối db thật..."); // Chỉ chạy đúng 1 lần
  }

  // 3. Factory constructor: Luôn trả về _instance có sẵn
  factory DatabaseConnection() {
    return _instance;
  }
}

void main() {
  var db1 = DatabaseConnection();
  var db2 = DatabaseConnection();

  // db1 và db2 thực chất là MỘT object duy nhất
  print(db1 == db2); // true
}
```

---

## 5. Từ Vựng (Vocabulary)
- `anonymous` (ẩn danh - không tên)
- `lambda` (tên gọi khác của hàm ẩn danh)
- `higher-order` (bậc cao)
- `static` (tĩnh - đứng yên, dùng chung)
- `factory` (nhà máy - nơi sản xuất object)
- `instance` (thể hiện - object cụ thể)
- `singleton` (đơn độc - mẫu thiết kế chỉ có 1 object duy nhất)

---

## 6. Bài Tập Thực Hành

### Bài 1: List Processing (Xử lý danh sách)
Cho danh sách điểm số: `[8, 5, 9, 3, 10, 4, 7]`
1.  Dùng `where` (kết hợp lambda) để lọc ra các điểm **>= 5** (Đậu).
2.  Dùng `map` để cộng thêm 1 điểm bonus cho các bạn Đậu.
3.  In danh sách cuối cùng.

### Bài 2: MathConstants (Hằng số toán học)
1.  Tạo class `MathConstants` chứa biến `static const double e = 2.71`.
2.  Thêm hàm `static double power(double base, int exp)` để tính lũy thừa.
3.  Gọi thử trong `main` mà không tạo object.

### Bài 3: Logger (Singleton)
1.  Tạo class `Logger` sử dụng `factory` constructor để đảm bảo chỉ có **duy nhất 1 Logger** trong app.
2.  Class có hàm `log(String msg)` in ra thông báo.
3.  Test bằng cách tạo `logger1` và `logger2`, cho `logger1` log gì đó, kiểm tra xem `logger1 == logger2` không.

---
👉 **Tạo file `Dart/A3_A4_Supplement/practice.dart` để chiến ngay nhé!**
