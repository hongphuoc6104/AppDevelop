# Bài 2: Control Flow (Luồng Điều Khiển)

Chào mừng bạn đến với bài 2! Hôm nay chúng ta sẽ học cách "ra quyết định" và "lặp lại công việc" trong code.

## 1. Câu Lệnh Điều Kiện (Conditionals)

### 1.1. `if - else`
Dùng để kiểm tra một điều kiện logic (`bool`).

**Code Example: Banking (Rút tiền ATM)**
```dart
void main() {
  double balance = 500.0; // Số dư hiện tại
  double withdrawAmount = 600.0; // Số tiền muốn rút
  
  // if (nếu) balance lớn hơn hoặc bằng withdrawAmount
  if (balance >= withdrawAmount) {
    balance -= withdrawAmount;
    print("Withdraw success! New balance: \$$balance");
  } else {
    // else (ngược lại)
    print("Insufficient funds! (Không đủ tiền)");
  }
}
```

### 1.2. Ternary Operator (Toán tử 3 ngôi)
Dạng rút gọn của `if-else` cho các phép gán đơn giản.
Cú pháp: `condition ? value_if_true : value_if_false`

**Code Example: User Status**
```dart
void main() {
  bool isLoggedIn = true; // Đã đăng nhập chưa?
  
  // Nếu isLoggedIn là true thì lấy "Welcome User", ngược lại lấy "Please Login"
  String message = isLoggedIn ? "Welcome User" : "Please Login";
  
  print(message);
}
```

### 1.3. `switch - case`
Dùng khi cần so sánh một biến với **nhiều giá trị cụ thể**.

**Code Example: Order Status (Trạng thái đơn hàng)**
```dart
void main() {
  String orderStatus = "SHIPPING"; // PENDING, SHIPPING, DELIVERED, CANCELLED
  
  switch (orderStatus) {
    case "PENDING":
      print("Waiting for seller to ship.");
      break; // Thoát khỏi switch
    case "SHIPPING":
      print("Driver is on the way.");
      break;
    case "DELIVERED":
      print("Package received.");
      break;
    default: // Trường hợp còn lại (như else)
      print("Unknown status.");
  }
}
```

---

## 2. Vòng Lặp (Loops)
Dùng để lặp lại một khối lệnh nhiều lần.

### 2.1. `for` Loop
Dùng khi biết trước số lần lặp.

**Code Example: Education (In danh sách điểm số)**
```dart
void main() {
  // i++ nghĩa là i = i + 1
  for (int i = 1; i <= 5; i++) {
    print("Student #$i");
  }
}
```

### 2.2. `for-in` Loop
Dùng để duyệt qua các phần tử trong danh sách (List).

**Code Example: Shopping Cart (Giỏ hàng)**
```dart
void main() {
  // List of products (Danh sách sản phẩm - sẽ học kỹ ở bài Collection)
  var cart = ["Laptop", "Mouse", "Keyboard"];
  
  for (var product in cart) {
    print("Item: $product");
  }
}
```

### 2.3. `while` Loop
Dùng khi **không biết trước** số lần lặp, chỉ dừng khi điều kiện sai.

**Code Example: Game Loading**
```dart
void main() {
  int progress = 0;
  
  while (progress < 100) {
    print("Loading... $progress%");
    progress += 20; // Tăng progress lên 20 mỗi lần lặp
  }
  print("Loading Complete!");
}
```

---

## 3. Từ Vựng (Vocabulary)
- `condition` (điều kiện)
- `insufficient` (không đủ)
- `funds` (quỹ/tiền)
- `status` (trạng thái)
- `pending` (đang chờ)
- `shipping` (đang giao)
- `delivered` (đã giao)
- `progress` (tiến độ)

---

## 4. Bài Tập Thực Hành (Exercises)

### Bài 1: Traffic Light (Đèn giao thông)
Viết chương trình dùng `if-else` hoặc `switch-case`:
- Tạo biến `color` (String) có thể là "Red", "Yellow", "Green".
- Nếu "Red" -> in "Stop"
- Nếu "Yellow" -> in "Slow down"
- Nếu "Green" -> in "Go"
- Khác -> in "Invalid color"

### Bài 2: Total Invoice (Tổng hóa đơn)
- Cho một danh sách giá tiền: `var prices = [10.0, 20.0, 5.5, 100.0];`
- Dùng vòng lặp `for-in` để tính tổng số tiền.
- In kết quả cuối cùng.

---
👉 **Tạo file `Dart/A2_ControlFlow/practice.dart` để làm bài tập bạn nhé!**
