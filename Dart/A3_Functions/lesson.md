# Bài 3: Functions (Hàm)

Hàm (Function) giúp chúng ta gom nhóm các đoạn code để tái sử dụng nhiều lần. Viết một lần, dùng mọi nơi!

## 1. Khai Báo Hàm (Function Declaration)

Cấu trúc cơ bản:
```dart
returnType functionName(parameters) {
  // Body of function
  return value;
}
```

**Code Example: Banking (Tính lãi suất)**
```dart
// double: Kiểu dữ liệu trả về (Return Type)
// calculateInterest: Tên hàm (Function Name)
// principal, rate: Tham số (Parameters)
double calculateInterest(double principal, double rate) {
  double interest = principal * rate / 100;
  return interest; // Trả về kết quả
}

void main() {
  double myInterest = calculateInterest(1000, 5); // Gọi hàm
  print("Interest: \$$myInterest");
}
```

---

## 2. Tham Số (Parameters)

### 2.1. Positional Parameters (Tham số theo vị trí)
Là các tham số bắt buộc, phải truyền đúng thứ tự.

```dart
void printInfo(String name, int age) {
  print("$name is $age years old.");
}

// Gọi hàm: printInfo("Alex", 25); // Đúng
// Gọi hàm: printInfo(25, "Alex"); // ❌ Sai thứ tự
```

### 2.2. Named Parameters (Tham số đặt tên)
Giúp code dễ đọc hơn, không cần nhớ thứ tự. Dùng dấu ngoặc nhọn `{}` và từ khóa `required`.

**Code Example: E-commerce (Tạo đơn hàng)**
```dart
// required: Bắt buộc phải truyền
void createOrder({required String product, required int quantity}) {
  print("Ordered $quantity x $product");
}

void main() {
  // Khi gọi phải gọi tên tham số
  createOrder(quantity: 2, product: "Phone"); 
  createOrder(product: "Laptop", quantity: 1); // Thứ tự không quan trọng
}
```

### 2.3. Optional Parameters (Tham số tùy chọn)
Dùng dấu ngoặc vuông `[]` cho tham số có thể bỏ qua.

```dart
void greet(String name, [String? title]) {
  if (title != null) {
    print("Hello $title $name");
  } else {
    print("Hello $name");
  }
}

// greet("John"); -> Hello John
// greet("Doe", "Mr."); -> Hello Mr. Doe
```

---

## 3. Arrow Function (Hàm Mũi Tên)
Cú pháp rút gọn cho các hàm chỉ có **một dòng lệnh** trả về giá trị.

```dart
// Cách thường
int add(int a, int b) {
  return a + b;
}

// Cách Arrow Function (=>)
int addShort(int a, int b) => a + b;
```

---

## 4. Từ Vựng (Vocabulary)
- `function` (hàm/chức năng)
- `declaration` (khai báo)
- `parameter` (tham số - biến trong định nghĩa hàm)
- `argument` (đối số - giá trị truyền vào khi gọi hàm)
- `return` (trả về)
- `void` (không trả về gì cả)
- `required` (bắt buộc)
- `optional` (tùy chọn)

---

## 5. Bài Tập Thực Hành (Exercises)

### Bài 1: Calculate Salary (Tính lương)
Viết hàm `calculateSalary` nhận vào:
- `hourlyRate` (lương theo giờ - double)
- `hoursWorked` (số giờ làm - double)
- Trả về tổng lương.
- Dùng **Arrow Function**.

### Bài 2: User Profile (Hồ sơ người dùng)
Viết hàm `createUserRel` sử dụng **Named Parameters**:
- `name` (String, required)
- `age` (int, optional - có thể null)
- `role` (String, mặc định là "User")
- In ra thông tin người dùng được tạo.

---
👉 **Tạo file `Dart/A3_Functions/practice.dart` để làm bài tập nhé!**
