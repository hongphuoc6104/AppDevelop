# Bài 1: Dart Basics - Biến và Kiểu Dữ Liệu

Chào mừng bạn quay lại với Dart! Bài này sẽ củng cố nền tảng quan trọng nhất: **Lưu trữ dữ liệu**.

## 1. Biến (Variables)
Trong Dart, chúng ta dùng biến để lưu giá trị. Có 3 từ khóa chính cần nhớ: `var`, `final`, `const`.

### 1.1. `var` vs `final` vs `const`

| Từ khóa | Ý nghĩa | Khi nào dùng? |
|---------|---------|---------------|
| `var` | Biến có thể **thay đổi** giá trị sau này. | Dùng cho dữ liệu sẽ thay đổi (ví dụ: số dư tài khoản, giỏ hàng). |
| `final` | Biến **không thể** thay đổi sau khi gán lần đầu. | Dùng cho dữ liệu cố định trong lúc chạy (ví dụ: ngày sinh, ID giao dịch). |
| `const` | Hằng số **bất biến** ngay từ khi biên dịch (compile-time). | Dùng cho giá trị không bao giờ đổi (ví dụ: sô PI, link API cố định). |

### Code Example (Banking & E-commerce)

```dart
void main() {
  // 1. var: Mutable (Có thể thay đổi)
  // Example: Bank Account Balance (Số dư tài khoản ngân hàng)
  var accountBalance = 1000.0;
  print("Initial Balance: $accountBalance");
  
  accountBalance = 1500.50; // Changing value is allowed
  print("Updated Balance: $accountBalance");

  // 2. final: Immutable (Không thể thay đổi sau khi gán)
  // Example: Transaction ID (Mã giao dịch - Duy nhất cho mỗi giao dịch)
  final String transactionId = "TRX-2024-001";
  print("Transaction ID: $transactionId");
  
  // transactionId = "TRX-999"; // ❌ Error: The final variable 'transactionId' can only be set once.

  // 3. const: Compile-time constant (Hằng số tuyệt đối)
  // Example: Tax Rate (Thuế suất - Cố định theo luật)
  const double taxRate = 0.10; 
  print("Tax Rate: $taxRate");
  
  // taxRate = 0.12; // ❌ Error: Constant variables can't be assigned a value.
}
```

---

## 2. Kiểu Dữ Liệu (Data Types)
Dart là ngôn ngữ **định kiểu tĩnh** (statically typed), nhưng nó có thể tự suy luận kiểu (type inference).

| Kiểu | Mô tả | Ví dụ |
|------|-------|-------|
| `int` | Số nguyên | `10`, `-5`, `2024` |
| `double` | Số thực (có dấu phẩy) | `3.14`, `9.99`, `-0.5` |
| `String` | Chuỗi ký tự | `"Hello"`, `'Dart'` |
| `bool` | Logic (Đúng/Sai) | `true`, `false` |

### Code Example (Healthcare Profile - Hồ sơ y tế)

```dart
void main() {
  // Patient Details (Thông tin bệnh nhân)
  String patientName = "John Doe"; // Tên bệnh nhân
  int patientAge = 35; // Tuổi bệnh nhân
  double bodyTemperature = 36.6; // Nhiệt độ cơ thể
  bool isSmoker = false; // Có hút thuốc không?

  print("Patient: " + patientName); // Old way to combine strings
  print(patientAge);
  print(bodyTemperature);
  print("Is Smoker? $isSmoker");
}
```

---

## 3. Ghép Chuỗi (String Interpolation)
Thay vì dùng dấu cộng `+` để nối chuỗi (dễ lỗi và dài dòng), Dart dùng cú pháp `$bien` hoặc `${bieu_thuc}`.

### Code Example (Travel Booking - Đặt vé du lịch)

```dart
void main() {
  String destination = "Paris"; // Điểm đến
  double flightPrice = 550.0; // Giá vé máy bay
  int nights = 3; // Số đêm ở lại
  double hotelPricePerNight = 120.0; // Giá khách sạn mỗi đêm
  
  // 💡 Note: Use $variable for simple variables
  print("Destination: $destination");
  
  // 💡 Note: Use ${expression} for calculations
  print("Total Cost: \$${flightPrice + (nights * hotelPricePerNight)}");
  // Note: The first \$ prints the dollar sign, the second ${...} performs logic.
}
```

---

## 4. Bài Tập Thực Hành (Exercises)

### Bài tập 1: Student Profile (Hồ sơ sinh viên)
Tạo một chương trình quản lý thông tin sinh viên:
1.  Tạo biến `studentName` (tên sinh viên).
2.  Tạo biến `studentId` (mã sinh viên - không thay đổi được).
3.  Tạo biến `averageScore` (điểm trung bình).
4.  Tạo biến `isEnrolled` (đang nhập học hay không - kiểu bool).
5.  In ra thông tin theo định dạng đẹp mắt dùng String Interpolation.

### Bài tập 2: Shopping Cart (Giỏ hàng)
1.  Tạo biến `productName` (tên sản phẩm) = "Laptop".
2.  Tạo biến `price` (giá tiền) = 1500.
3.  Tạo biến `quantity` (số lượng) = 2.
4.  Tính tổng tiền và in ra: `"Invoice: Bought 2 Laptop(s). Total: $3000"`.

---

👉 **Hãy tạo file mới `Dart/A1_Basics/practice.dart` và làm bài tập nhé!**
Làm xong hãy dán code vào đây để mình chấm điểm.
