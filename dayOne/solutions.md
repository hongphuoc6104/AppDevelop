# 📝 Đáp án Bài tập Ngày 1

> **Lưu ý:** Đây chỉ là 1 cách giải, bạn có thể có cách khác!
> Hãy tự làm trước khi xem đáp án nhé! 💪

---

## 📚 Bài tập 1.2 - Named Constructor

**Yêu cầu:** Tạo class `Product` với các named constructors

### ✅ Đáp án:

```dart
class Product {
  String name;
  double price;
  int stock;
  
  // Constructor chính
  Product(this.name, this.price, this.stock);
  
  // Named constructor: sản phẩm miễn phí
  Product.free(String name, int stock)
    : name = name,
      price = 0.0,
      stock = stock;
  
  // Named constructor: từ Map
  Product.fromMap(Map<String, dynamic> data)
    : name = data['name'],
      price = data['price'].toDouble(),
      stock = data['stock'];
  
  // Named constructor: sản phẩm mẫu
  Product.sample()
    : name = 'Sample Product',
      price = 99.99,
      stock = 100;
  
  // Override toString để dễ debug
  @override
  String toString() => 'Product: $name, \$$price, Stock: $stock';
}

void main() {
  // Test các constructor
  var p1 = Product('Laptop', 1200, 5);
  var p2 = Product.free('Free Ebook', 1000);
  var p3 = Product.sample();
  var p4 = Product.fromMap({
    'name': 'Phone',
    'price': 800,
    'stock': 10
  });
  
  print(p1);
  print(p2);
  print(p3);
  print(p4);
}
```

**Output:**
```
Product: Laptop, $1200.0, Stock: 5
Product: Free Ebook, $0.0, Stock: 1000
Product: Sample Product, $99.99, Stock: 100
Product: Phone, $800.0, Stock: 10
```

---

## 📚 Bài tập 2.4 - Named Parameters

**Yêu cầu:** Tạo class `BankAccount` với mix positional & named parameters

### ✅ Đáp án:

```dart
class BankAccount {
  String accountNumber;
  double balance;
  String ownerName;
  String type;
  double interestRate;
  bool isActive;
  
  // Mix positional và named parameters
  BankAccount(
    this.accountNumber,    // Positional
    this.balance,          // Positional
    {
      required this.ownerName,         // Named - required
      this.type = 'savings',           // Named - default
      this.interestRate = 0.05,        // Named - default
      this.isActive = true,            // Named - default
    }
  );
  
  // Method tính lãi
  double calculateInterest() {
    return balance * interestRate;
  }
  
  @override
  String toString() {
    return 'Account: $accountNumber\n'
           'Owner: $ownerName\n'
           'Balance: \$$balance\n'
           'Type: $type\n'
           'Rate: ${(interestRate * 100).toStringAsFixed(2)}%\n'
           'Interest: \$${calculateInterest().toStringAsFixed(2)}\n'
           'Active: $isActive';
  }
}

void main() {
  // Account 1: Chỉ truyền required params
  var account1 = BankAccount(
    'ACC001',
    1000,
    ownerName: 'John Doe',
  );
  
  // Account 2: Truyền tất cả params
  var account2 = BankAccount(
    'ACC002',
    5000,
    ownerName: 'Jane Smith',
    type: 'checking',
    interestRate: 0.02,
  );
  
  // Account 3: Tài khoản bị khóa
  var account3 = BankAccount(
    'ACC003',
    10000,
    ownerName: 'Bob Wilson',
    type: 'savings',
    interestRate: 0.08,
    isActive: false,
  );
  
  print(account1);
  print('\n---\n');
  print(account2);
  print('\n---\n');
  print(account3);
}
```

**Output:**
```
Account: ACC001
Owner: John Doe
Balance: $1000.0
Type: savings
Rate: 5.00%
Interest: $50.00
Active: true

---

Account: ACC002
Owner: Jane Smith
Balance: $5000.0
Type: checking
Rate: 2.00%
Interest: $100.00
Active: true

---

Account: ACC003
Owner: Bob Wilson
Balance: $10000.0
Type: savings
Rate: 8.00%
Interest: $800.00
Active: false
```

---

## 📚 Bài tập 3.2 - Getter/Setter

**Yêu cầu:** Tạo class `Temperature` với computed properties và setter

### ✅ Đáp án:

```dart
class Temperature {
  double _celsius = 0;
  
  // Celsius getter/setter
  double get celsius => _celsius;
  
  set celsius(double value) {
    _celsius = value;
  }
  
  // Fahrenheit - computed property với getter/setter
  double get fahrenheit => _celsius * 9 / 5 + 32;
  
  set fahrenheit(double value) {
    _celsius = (value - 32) * 5 / 9;
  }
  
  // Kelvin - read-only computed property
  double get kelvin => _celsius + 273.15;
  
  // Các method tiện ích
  bool get isFreezing => _celsius <= 0;
  bool get isBoiling => _celsius >= 100;
  
  String get description {
    if (isFreezing) return 'Freezing';
    if (isBoiling) return 'Boiling';
    if (_celsius < 20) return 'Cold';
    if (_celsius < 30) return 'Warm';
    return 'Hot';
  }
  
  @override
  String toString() {
    return '${celsius.toStringAsFixed(2)}°C = '
           '${fahrenheit.toStringAsFixed(2)}°F = '
           '${kelvin.toStringAsFixed(2)}K '
           '($description)';
  }
}

void main() {
  var temp = Temperature();
  
  // Test 1: Nhiệt độ băng
  temp.celsius = 0;
  print(temp); // 0°C = 32°F = 273.15K
  
  // Test 2: Nhiệt độ sôi
  temp.celsius = 100;
  print(temp); // 100°C = 212°F = 373.15K
  
  // Test 3: Set bằng Fahrenheit
  temp.fahrenheit = 68;
  print(temp); // 20°C = 68°F = 293.15K
  
  // Test 4: Nhiệt độ phòng
  temp.celsius = 25;
  print(temp);
  
  // Test 5: Nhiệt độ nóng
  temp.fahrenheit = 95;
  print(temp);
}
```

**Output:**
```
0.00°C = 32.00°F = 273.15K (Freezing)
100.00°C = 212.00°F = 373.15K (Boiling)
20.00°C = 68.00°F = 293.15K (Warm)
25.00°C = 77.00°F = 298.15K (Warm)
35.00°C = 95.00°F = 308.15K (Hot)
```

---

## 📚 Bài tập 4.3 - Mixin

**Yêu cầu:** Tạo `Serializable` và `Timestamped` mixins

### ✅ Đáp án:

```dart
import 'dart:convert';

// Mixin 1: Serializable - Chuyển đổi thành JSON
mixin Serializable {
  // Abstract method - class sử dụng phải implement
  Map<String, dynamic> toJson();
  
  String toJsonString() {
    return json.encode(toJson());
  }
  
  String toPrettyJsonString() {
    var encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(toJson());
  }
}

// Mixin 2: Timestamped - Quản lý timestamps
mixin Timestamped {
  DateTime? _createdAt;
  DateTime? _updatedAt;
  
  DateTime get createdAt => _createdAt ?? DateTime.now();
  DateTime get updatedAt => _updatedAt ?? DateTime.now();
  
  void initTimestamp() {
    _createdAt = DateTime.now();
    _updatedAt = DateTime.now();
  }
  
  void updateTimestamp() {
    _updatedAt = DateTime.now();
  }
  
  String get timestampInfo {
    var age = DateTime.now().difference(createdAt);
    return 'Created: ${createdAt.toLocal()}\n'
           'Updated: ${updatedAt.toLocal()}\n'
           'Age: ${age.inMinutes} minutes';
  }
}

// Class Article sử dụng cả 2 mixins
class Article with Serializable, Timestamped {
  String title;
  String content;
  String author;
  List<String> tags;
  
  Article({
    required this.title,
    required this.content,
    required this.author,
    this.tags = const [],
  }) {
    initTimestamp();
  }
  
  // Implement toJson từ Serializable mixin
  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'author': author,
      'tags': tags,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
  
  void edit(String newContent) {
    content = newContent;
    updateTimestamp(); // Từ Timestamped mixin
  }
  
  void addTag(String tag) {
    tags = [...tags, tag];
    updateTimestamp();
  }
}

void main() async {
  // Tạo article
  var article = Article(
    title: 'Học Dart cơ bản',
    content: 'Dart là ngôn ngữ tuyệt vời!',
    author: 'John Doe',
    tags: ['dart', 'programming'],
  );
  
  print('=== Article Ban Đầu ===');
  print(article.toPrettyJsonString());
  print('\n${article.timestampInfo}');
  
  // Chờ 2 giây
  print('\n⏳ Waiting 2 seconds...\n');
  await Future.delayed(Duration(seconds: 2));
  
  // Edit article
  article.edit('Dart rất dễ học và mạnh mẽ!');
  article.addTag('flutter');
  
  print('=== Sau Khi Edit ===');
  print(article.toPrettyJsonString());
  print('\n${article.timestampInfo}');
}
```

**Output:**
```
=== Article Ban Đầu ===
{
  "title": "Học Dart cơ bản",
  "content": "Dart là ngôn ngữ tuyệt vời!",
  "author": "John Doe",
  "tags": [
    "dart",
    "programming"
  ],
  "createdAt": "2024-12-24T23:45:00.000",
  "updatedAt": "2024-12-24T23:45:00.000"
}

Created: 2024-12-24 23:45:00.000
Updated: 2024-12-24 23:45:00.000
Age: 0 minutes

⏳ Waiting 2 seconds...

=== Sau Khi Edit ===
{
  "title": "Học Dart cơ bản",
  "content": "Dart rất dễ học và mạnh mẽ!",
  "author": "John Doe",
  "tags": [
    "dart",
    "programming",
    "flutter"
  ],
  "createdAt": "2024-12-24T23:45:00.000",
  "updatedAt": "2024-12-24T23:45:02.000"
}

Created: 2024-12-24 23:45:00.000
Updated: 2024-12-24 23:45:02.000
Age: 0 minutes
```

---

## 🎯 Bài tập tổng hợp - Hệ thống quản lý thư viện

**Yêu cầu:** Tạo hệ thống Library với Book, Borrowable, Searchable

### ✅ Đáp án đầy đủ:

```dart
// Mixin 1: Borrowable - Cho phép mượn/trả
mixin Borrowable {
  bool _isBorrowed = false;
  String? _borrowerName;
  DateTime? _borrowedDate;
  
  bool get isBorrowed => _isBorrowed;
  String? get borrowerName => _borrowerName;
  DateTime? get borrowedDate => _borrowedDate;
  
  void borrow([String borrower = 'Unknown']) {
    if (_isBorrowed) {
      print('❌ Already borrowed by $_borrowerName!');
    } else {
      _isBorrowed = true;
      _borrowerName = borrower;
      _borrowedDate = DateTime.now();
      print('✅ Borrowed successfully by $borrower!');
    }
  }
  
  void returnItem() {
    if (!_isBorrowed) {
      print('❌ Not borrowed!');
    } else {
      var days = DateTime.now().difference(_borrowedDate!).inDays;
      print('✅ Returned successfully! (Borrowed for $days days)');
      _isBorrowed = false;
      _borrowerName = null;
      _borrowedDate = null;
    }
  }
  
  String get borrowStatus {
    if (_isBorrowed) {
      var days = DateTime.now().difference(_borrowedDate!).inDays;
      return 'BORROWED by $_borrowerName ($days days ago)';
    }
    return 'AVAILABLE';
  }
}

// Mixin 2: Searchable - Cho phép tìm kiếm
mixin Searchable {
  bool matchesQuery(String query);
}

// Class Book kết hợp cả 2 mixins
class Book with Borrowable, Searchable {
  String title;
  String author;
  String isbn;
  int year;
  
  Book({
    required this.title,
    required this.author,
    required this.isbn,
    required this.year,
  });
  
  // Named constructor từ JSON
  Book.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      author = json['author'],
      isbn = json['isbn'],
      year = json['year'];
  
  // Named constructor tạo sách mẫu
  Book.sample()
    : title = 'Sample Book',
      author = 'John Doe',
      isbn = '000-0000000000',
      year = 2024;
  
  // Getter description
  String get description => 
    '$title by $author ($year) - ISBN: $isbn';
  
  // Implement matchesQuery từ Searchable mixin
  @override
  bool matchesQuery(String query) {
    query = query.toLowerCase();
    return title.toLowerCase().contains(query) ||
           author.toLowerCase().contains(query) ||
           isbn.contains(query) ||
           year.toString().contains(query);
  }
  
  @override
  String toString() {
    return '$description [${borrowStatus}]';
  }
}

// Class Library quản lý danh sách sách
class Library {
  List<Book> books = [];
  String name;
  
  Library({this.name = 'My Library'});
  
  void addBook(Book book) {
    books.add(book);
    print('📚 Added: ${book.title}');
  }
  
  List<Book> searchBooks(String query) {
    var results = books.where((book) => book.matchesQuery(query)).toList();
    print('\n🔍 Found ${results.length} book(s) matching "$query"');
    return results;
  }
  
  void borrowBook(String isbn, [String borrower = 'Unknown']) {
    try {
      var book = books.firstWhere((b) => b.isbn == isbn);
      book.borrow(borrower);
    } catch (e) {
      print('❌ Book not found with ISBN: $isbn');
    }
  }
  
  void returnBook(String isbn) {
    try {
      var book = books.firstWhere((b) => b.isbn == isbn);
      book.returnItem();
    } catch (e) {
      print('❌ Book not found with ISBN: $isbn');
    }
  }
  
  void showAllBooks() {
    print('\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    print('📚 $name - Total: ${books.length} book(s)');
    print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    for (var i = 0; i < books.length; i++) {
      print('${i + 1}. ${books[i]}');
    }
    print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n');
  }
  
  void showAvailableBooks() {
    var available = books.where((b) => !b.isBorrowed).toList();
    print('\n📗 Available Books (${available.length}):');
    for (var book in available) {
      print('  - ${book.title}');
    }
  }
  
  void showBorrowedBooks() {
    var borrowed = books.where((b) => b.isBorrowed).toList();
    print('\n📕 Borrowed Books (${borrowed.length}):');
    for (var book in borrowed) {
      print('  - ${book.title} by ${book.borrowerName}');
    }
  }
}

void main() {
  // Tạo thư viện
  var library = Library(name: 'Tech Books Library');
  
  print('═══════════════════════════════════');
  print('  LIBRARY MANAGEMENT SYSTEM');
  print('═══════════════════════════════════\n');
  
  // 1. Thêm sách
  print('--- Adding Books ---');
  library.addBook(Book(
    title: 'Clean Code',
    author: 'Robert Martin',
    isbn: '978-0132350884',
    year: 2008,
  ));
  
  library.addBook(Book(
    title: 'The Pragmatic Programmer',
    author: 'Andrew Hunt',
    isbn: '978-0201616224',
    year: 1999,
  ));
  
  library.addBook(Book.fromJson({
    'title': 'Design Patterns',
    'author': 'Gang of Four',
    'isbn': '978-0201633612',
    'year': 1994,
  }));
  
  library.addBook(Book(
    title: 'Refactoring',
    author: 'Martin Fowler',
    isbn: '978-0201485677',
    year: 1999,
  ));
  
  // 2. Hiển thị tất cả sách
  library.showAllBooks();
  
  // 3. Tìm kiếm sách
  print('\n--- Searching Books ---');
  var results = library.searchBooks('clean');
  for (var book in results) {
    print('  📖 ${book.description}');
  }
  
  results = library.searchBooks('1999');
  for (var book in results) {
    print('  📖 ${book.description}');
  }
  
  // 4. Mượn sách
  print('\n--- Borrowing Books ---');
  library.borrowBook('978-0132350884', 'John Doe');
  library.borrowBook('978-0201633612', 'Jane Smith');
  library.borrowBook('978-0132350884', 'Bob Wilson'); // Thử mượn sách đã được mượn
  
  library.showAllBooks();
  
  // 5. Thống kê
  library.showAvailableBooks();
  library.showBorrowedBooks();
  
  // 6. Trả sách
  print('\n--- Returning Books ---');
  library.returnBook('978-0132350884');
  
  library.showAllBooks();
  
  // 7. Thống kê lại
  library.showAvailableBooks();
  library.showBorrowedBooks();
}
```

**Output:**
```
═══════════════════════════════════
  LIBRARY MANAGEMENT SYSTEM
═══════════════════════════════════

--- Adding Books ---
📚 Added: Clean Code
📚 Added: The Pragmatic Programmer
📚 Added: Design Patterns
📚 Added: Refactoring

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 Tech Books Library - Total: 4 book(s)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. Clean Code by Robert Martin (2008) - ISBN: 978-0132350884 [AVAILABLE]
2. The Pragmatic Programmer by Andrew Hunt (1999) - ISBN: 978-0201616224 [AVAILABLE]
3. Design Patterns by Gang of Four (1994) - ISBN: 978-0201633612 [AVAILABLE]
4. Refactoring by Martin Fowler (1999) - ISBN: 978-0201485677 [AVAILABLE]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


--- Searching Books ---

🔍 Found 1 book(s) matching "clean"
  📖 Clean Code by Robert Martin (2008) - ISBN: 978-0132350884

🔍 Found 2 book(s) matching "1999"
  📖 The Pragmatic Programmer by Andrew Hunt (1999) - ISBN: 978-0201616224
  📖 Refactoring by Martin Fowler (1999) - ISBN: 978-0201485677

--- Borrowing Books ---
✅ Borrowed successfully by John Doe!
✅ Borrowed successfully by Jane Smith!
❌ Already borrowed by John Doe!

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 Tech Books Library - Total: 4 book(s)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. Clean Code by Robert Martin (2008) - ISBN: 978-0132350884 [BORROWED by John Doe (0 days ago)]
2. The Pragmatic Programmer by Andrew Hunt (1999) - ISBN: 978-0201616224 [AVAILABLE]
3. Design Patterns by Gang of Four (1994) - ISBN: 978-0201633612 [BORROWED by Jane Smith (0 days ago)]
4. Refactoring by Martin Fowler (1999) - ISBN: 978-0201485677 [AVAILABLE]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


📗 Available Books (2):
  - The Pragmatic Programmer
  - Refactoring

📕 Borrowed Books (2):
  - Clean Code by John Doe
  - Design Patterns by Jane Smith

--- Returning Books ---
✅ Returned successfully! (Borrowed for 0 days)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 Tech Books Library - Total: 4 book(s)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. Clean Code by Robert Martin (2008) - ISBN: 978-0132350884 [AVAILABLE]
2. The Pragmatic Programmer by Andrew Hunt (1999) - ISBN: 978-0201616224 [AVAILABLE]
3. Design Patterns by Gang of Four (1994) - ISBN: 978-0201633612 [BORROWED by Jane Smith (0 days ago)]
4. Refactoring by Martin Fowler (1999) - ISBN: 978-0201485677 [AVAILABLE]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


📗 Available Books (3):
  - Clean Code
  - The Pragmatic Programmer
  - Refactoring

📕 Borrowed Books (1):
  - Design Patterns by Jane Smith
```

---

## 💡 Nhận xét về giải pháp

### Điểm mạnh:
1. **Code reusability** - Mixins có thể tái sử dụng cho nhiều class khác
2. **Separation of concerns** - Mỗi mixin đảm nhiệm 1 chức năng riêng
3. **Easy to extend** - Dễ dàng thêm features mới
4. **Type-safe** - Dart đảm bảo type safety

### Có thể cải thiện:
1. Thêm validation cho ISBN format
2. Thêm category/genre cho books
3. Implement save/load từ file
4. Thêm due date cho borrowed books
5. Fine system cho late returns

---

**🎉 Chúc mừng bạn đã hoàn thành tất cả bài tập!**

> **Nhớ:** Đây chỉ là 1 cách giải. Hãy thử nghiệm và tìm cách tối ưu hơn!
