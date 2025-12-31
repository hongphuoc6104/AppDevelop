// A6. Collections - Bài tập thực hành
// Thực hiện các bài tập bên dưới

// ============================================
// BÀI 1: Quản lý danh sách sinh viên (List)
// ============================================
// Yêu cầu:
// 1. Tạo List<String> students với 5 tên sinh viên
// 2. Thêm 2 sinh viên mới vào cuối
// 3. Chèn 1 sinh viên vào vị trí thứ 2 (index 1)
// 4. Xóa sinh viên ở vị trí thứ 4 (index 3)
// 5. In ra tổng số sinh viên
// 6. Duyệt và in ra từng sinh viên kèm số thứ tự

// Code của bạn ở đây:

void testStudentList() {
  List<String> students = ['Phuoc', 'Na', 'Anh', 'Bi', 'PeTho'];

  students.addAll(['De', 'Thuong']); 
  students.insert(1, 'dep');
  students.removeAt(3);

  print('tong so sinh vien: ${students.length}');  

  students.asMap().forEach((index, value) {
    print('Sinh vien thu ${index+1} la $value');
  });
}


// ============================================
// BÀI 2: Loại bỏ trùng lặp (Set)
// ============================================
// Yêu cầu:
// 1. Cho List tags = ['dart', 'flutter', 'dart', 'mobile', 'flutter', 'android', 'dart']
// 2. Loại bỏ các tag trùng lặp và in ra kết quả
// 3. Thêm tag 'ios' vào set
// 4. Kiểm tra xem 'flutter' có trong set không

// Code của bạn ở đây:
void testTags() {
  List<String> tags = ['dart', 'flutter', 'dart', 'mobile', 'flutter', 'android', 'dart'];
  var tagsCopy = [...tags].toSet();
  print(tagsCopy);
  tagsCopy.add('ios');
  print(tagsCopy.contains('flutter'));

}

// ============================================
// BÀI 3: Thông tin sản phẩm (Map)
// ============================================
// Yêu cầu:
// 1. Tạo Map product với các key: name, price, category, inStock
// 2. Thêm key 'discount' với giá trị 10 (%)
// 3. Cập nhật giá (price) giảm 10%
// 4. Xóa key 'category'
// 5. Duyệt và in ra tất cả thông tin sản phẩm

// Code của bạn ở đây:
void testProduct() {
  Map<String, dynamic> product = {
    'name': 'iPhone',
    'price': 1000,
    'category': 'Electronics',
    'inStock': true,
  };

  product['discount'] = 10;
  product.remove('category');
  product['price'] = (product['price'] as int) * 0.9;
  for( var entry in product.entries) {
    print('${entry.key}: ${entry.value}');
  }
}

// ============================================
// BÀI 4: Collection if/for và Spread
// ============================================
// Yêu cầu:
// 1. Tạo list menu với các item: 'Home', 'Products', 'About'
// 2. Thêm 'Profile' nếu isLoggedIn = true (dùng collection if)
// 3. Thêm 'Admin' nếu isAdmin = true (dùng collection if)
// 4. Tạo list squares chứa bình phương các số từ 1-10 (dùng collection for)
// 5. Gộp menu với ['Contact', 'FAQ'] dùng spread operator

// Code của bạn ở đây:
void testCollectionOperators() {
  bool isLoggedIn = true;
  bool isAdmin = false;
  List<String> menu = ['Home', 'Products', 'About', if(isAdmin) 'Admin', if(isLoggedIn) 'Profile'];

  List<int> squares = [for (int i = 1; i <= 10; i++) i * i];

  List<String> combined = [...menu as List<String>, 'Contact', 'FAQ'];

  print(menu);
  print(squares);
  print(combined);
  }



// ============================================
// BÀI 5: Higher-Order Methods
// ============================================
// Yêu cầu:
// Cho list:
var products = [
  {'name': 'iPhone', 'price': 1000, 'category': 'Electronics'},
  {'name': 'Book', 'price': 20, 'category': 'Education'},
  {'name': 'Laptop', 'price': 1500, 'category': 'Electronics'},
  {'name': 'Pen', 'price': 5, 'category': 'Office'},
  {'name': 'Tablet', 'price': 500, 'category': 'Electronics'},
];
//
// 1. Dùng where() lọc sản phẩm category = 'Electronics'
// 2. Dùng map() lấy danh sách tên sản phẩm Electronics
// 3. Dùng reduce() tính tổng giá tất cả sản phẩm
// 4. Dùng firstWhere() tìm sản phẩm đầu tiên có giá < 100
// 5. Dùng any() kiểm tra có sản phẩm nào giá > 1000 không
// 6. Dùng sort() sắp xếp sản phẩm theo giá tăng dần

// Code của bạn ở đây:
void testHigherOrderMethods() {
  var products = [
    {'name': 'iPhone', 'price': 1000, 'category': 'Electronics'},
    {'name': 'Book', 'price': 20, 'category': 'Education'},
    {'name': 'Laptop', 'price': 1500, 'category': 'Electronics'},
    {'name': 'Pen', 'price': 5, 'category': 'Office'},
    {'name': 'Tablet', 'price': 500, 'category': 'Electronics'},
  ];
  var electronics = products.where((p) => p['category'] == 'Electronics').toList();
  var names = products.where((p) => p['category'] == 'Electronics').map((p) => p['name']).toList();
  var total = products.map((p) => p['price'] as int).reduce((p, c) => p + c);
  var totals = products.fold(0, (sum, p) => (p['price'] as int) + sum);
  var first = products.firstWhere((p) => (p['price'] as int) < 100);
  var last = products.lastWhere((p) => (p['price'] as int) < 100);
  var any = products.any((p) => (p['price'] as int) > 1000);
  var upPrice = [...products];
  upPrice.sort((p, c) => (p['price'] as int).compareTo(c['price'] as int));
  print(totals);  
  print(first);
  print(last);
  print(any);    
  print(upPrice);  

}



// ============================================
// MAIN - Test code của bạn
// ============================================
void main() {
  // Uncomment và test từng bài

  // Bài 1: List sinh viên
  testStudentList();

  // Bài 2: Set tags
  testTags();

  // Bài 3: Map product
  testProduct();

  // Bài 4: Collection if/for/spread
  testCollectionOperators();

  // Bài 5: Higher-order methods
  testHigherOrderMethods();

//   print('Hãy uncomment và hoàn thành từng bài!');
}

// Định nghĩa các hàm test ở đây (sau khi hoàn thành mỗi bài)
