# A5. Null Safety - An toàn Null trong Dart

> 🎯 **Mục tiêu**: Hiểu và sử dụng thành thạo Null Safety - tính năng quan trọng của Dart 2.12+

---

## 1. Nullable vs Non-nullable Types (Kiểu có thể null vs không thể null)

**Vấn đề trước khi có Null Safety:**
```dart
// Trước Dart 2.12 - Có thể gây lỗi runtime!
String name;  // null by default
print(name.length); // 💥 Crash! NullPointerException
```

**Giải pháp: Null Safety**
```dart
// Sau Dart 2.12+ - Compiler bắt lỗi ngay!
String name;  // ❌ Error: phải gán giá trị!
String? nickname; // ✅ OK: dấu ? cho phép null
```

### Cú pháp

| Kiểu | Ý nghĩa | Ví dụ |
|:---|:---|:---|
| `String` | **Không thể null** - bắt buộc có giá trị | `String name = "An";` |
| `String?` | **Có thể null** - cho phép không có giá trị | `String? nickname = null;` |

### Ví dụ chạy được

```dart
void main() {
  // Non-nullable: PHẢI có giá trị
  String name = "Hồng Phước";
  int age = 20;
  
  // name = null; // ❌ Lỗi biên dịch!

  // Nullable: CÓ THỂ null (thêm dấu ?)
  String? nickname = null;  // ✅ OK
  int? score;               // ✅ Mặc định là null

  print("Name: $name");
  print("Nickname: $nickname");  // null
  print("Score: $score");        // null
}
```

---

## 2. Null Assertion Operator `!` (Khẳng định không null)

Khi bạn **CHẮC CHẮN 100%** biến không phải null, dùng `!` để nói với Dart: "Tin tôi đi, nó không null!"

⚠️ **Cẩn thận**: Nếu giá trị thực sự là null → **Crash runtime!**

```dart
void main() {
  String? name = getUserName(); // Có thể null
  
  // Cách 1: Kiểm tra null trước
  if (name != null) {
    print(name.length); // ✅ Dart biết name không null ở đây
  }
  
  // Cách 2: Dùng ! - NGUY HIỂM nếu không chắc chắn!
  print(name!.length); // Nếu name = null → Crash!
}

String? getUserName() {
  return "Hồng Phước"; // Hoặc có thể return null
}
```

---

## 3. Null-aware Access `?.` (Truy cập an toàn)

Nếu biến là null → **không gọi method**, trả về null thay.

```dart
void main() {
  String? name = null;
  
  // ❌ Lỗi: The method 'toUpperCase' can't be unconditionally invoked
  // print(name.toUpperCase());
  
  // ✅ An toàn: Nếu name là null → result = null
  String? result = name?.toUpperCase();
  print(result); // null
  
  // Khi name có giá trị
  name = "phuoc";
  print(name?.toUpperCase()); // PHUOC
}
```

### Chuỗi `?.` (Chaining)

```dart
class User {
  Address? address;
}

class Address {
  String? city;
}

void main() {
  User? user = null;
  
  // An toàn: Nếu user hoặc address là null → kết quả = null
  String? city = user?.address?.city;
  print(city); // null
}
```

---

## 4. Null-coalescing Operator `??` (Giá trị mặc định)

Nếu giá trị bên trái là null → dùng giá trị bên phải.

```dart
void main() {
  String? nickname;
  
  // Nếu nickname là null → dùng "Guest"
  String displayName = nickname ?? "Guest";
  print(displayName); // Guest
  
  nickname = "Phước";
  displayName = nickname ?? "Guest";
  print(displayName); // Phước
}
```

### So sánh với if-else

```dart
// Dài dòng
String displayName;
if (nickname != null) {
  displayName = nickname;
} else {
  displayName = "Guest";
}

// Gọn gàng với ??
String displayName = nickname ?? "Guest";
```

---

## 5. Null-aware Assignment `??=` (Gán nếu null)

Chỉ gán giá trị mới **NẾU** biến hiện tại là null.

```dart
void main() {
  String? name;
  print(name); // null
  
  name ??= "Default Name"; // name là null → gán "Default Name"
  print(name); // Default Name
  
  name ??= "Another Name"; // name KHÔNG null → KHÔNG gán
  print(name); // Default Name (giữ nguyên)
}
```

### Ứng dụng thực tế: Lazy initialization

```dart
class ExpensiveCalculation {
  int? _cachedResult;
  
  int getResult() {
    _cachedResult ??= _calculate(); // Chỉ tính 1 lần!
    return _cachedResult!;
  }
  
  int _calculate() {
    print("Đang tính toán nặng...");
    return 42;
  }
}

void main() {
  var calc = ExpensiveCalculation();
  print(calc.getResult()); // In: "Đang tính toán nặng..." rồi 42
  print(calc.getResult()); // In: 42 (không tính lại!)
}
```

---

## 6. `late` Keyword (Khai báo muộn)

Dùng khi bạn **chắc chắn** sẽ gán giá trị **TRƯỚC KHI** sử dụng, nhưng không thể gán ngay lúc khai báo.

```dart
class UserProfile {
  late String name;  // Sẽ gán sau, nhưng CAM KẾT sẽ gán
  late int age;
  
  void loadFromServer() {
    // Giả lập lấy dữ liệu từ server
    name = "Hồng Phước";
    age = 20;
  }
}

void main() {
  var profile = UserProfile();
  profile.loadFromServer();
  
  print(profile.name); // Hồng Phước
  print(profile.age);  // 20
}
```

### `late` với Lazy Initialization

```dart
class HeavyWidget {
  // Chỉ tạo khi cần dùng lần đầu
  late final List<int> data = _loadData();
  
  List<int> _loadData() {
    print("Loading data...");
    return [1, 2, 3, 4, 5];
  }
}

void main() {
  var widget = HeavyWidget();
  print("Widget created"); // Chưa load data
  print(widget.data);      // Bây giờ mới load: "Loading data..." [1, 2, 3, 4, 5]
  print(widget.data);      // Không load lại: [1, 2, 3, 4, 5]
}
```

---

## 7. Flow Analysis (Phân tích luồng)

Dart tự động hiểu khi nào biến **chắc chắn không null** sau khi kiểm tra.

```dart
void main() {
  String? name = getName();
  
  // Ở đây: name có thể null
  // print(name.length); // ❌ Lỗi
  
  if (name == null) {
    print("Name is null");
    return; // Thoát hàm
  }
  
  // Sau if: Dart BIẾT name không null (vì đã return nếu null)
  print(name.length); // ✅ OK! Không cần name! hay name?.length
}

String? getName() => "Phuoc";
```

### Các pattern phổ biến

```dart
void main() {
  String? input = "hello";
  
  // Pattern 1: if-null-return
  if (input == null) return;
  print(input.toUpperCase()); // ✅
  
  // Pattern 2: if-not-null
  if (input != null) {
    print(input.toUpperCase()); // ✅
  }
  
  // Pattern 3: assert (chỉ dùng trong debug)
  assert(input != null);
  print(input.toUpperCase()); // ✅
}
```

---

## 8. Từ Vựng (Vocabulary)

| Thuật ngữ | Phát âm | Ý nghĩa |
|:---|:---|:---|
| **Null** | /nʌl/ | Không có giá trị, trống |
| **Nullable** | /ˈnʌləbl/ | Có thể chứa null |
| **Non-nullable** | | Không thể null |
| **Assertion** | /əˈsɜːʃn/ | Khẳng định, đảm bảo |
| **Coalescing** | /ˌkoʊəˈlesɪŋ/ | Hợp nhất, gộp lại |
| **Late** | /leɪt/ | Muộn, sau này |
| **Flow analysis** | | Phân tích luồng code |

---

## 9. Bảng Tóm Tắt Operators

| Operator | Tên | Ví dụ | Kết quả |
|:---:|:---|:---|:---|
| `?` | Nullable type | `String? name` | Cho phép null |
| `!` | Null assertion | `name!.length` | Ép không null (nguy hiểm!) |
| `?.` | Null-aware access | `name?.length` | Trả về null nếu name là null |
| `??` | Null-coalescing | `name ?? "Guest"` | Dùng "Guest" nếu name là null |
| `??=` | Null-aware assignment | `name ??= "X"` | Gán "X" nếu name là null |
| `late` | Late initialization | `late String x;` | Gán giá trị sau |

---

## 10. Bài Tập Thực Hành

### Bài 1: User Profile (Nullable types + ??)
Tạo class `UserProfile` với:
- `String name` (bắt buộc)
- `String? bio` (có thể null)
- Hàm `displayBio()` in bio, nếu null thì in "No bio yet"

### Bài 2: Safe Access (Null-aware access ?.)
Tạo class `Order` có `Customer? customer`, class `Customer` có `Address? address`, class `Address` có `String? city`.
In ra city của order, xử lý an toàn khi bất kỳ giá trị nào là null.

### Bài 3: Cache Pattern (late + ??=)
Tạo class `ConfigManager` với:
- `late Map<String, String> _config`
- Hàm `loadConfig()` để khởi tạo `_config`
- Hàm `getValue(String key)` trả về giá trị hoặc "Not found"

---

👉 **Tạo file `Dart/A5_NullSafety/practice.dart` để làm bài tập!**
