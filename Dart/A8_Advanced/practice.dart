// A8. Advanced Dart - Bài tập thực hành
// Thực hiện các bài tập bên dưới

// ============================================
// BÀI 1: Generic Stack với constraints
// ============================================
// Yêu cầu:
// 1. Tạo class Stack<T extends Comparable> - chỉ chấp nhận kiểu so sánh được
// 2. Thêm method push(), pop(), peek
// 3. Thêm method min() và max() trả về phần tử nhỏ nhất/lớn nhất
// 4. Test với Stack<int> và Stack<String>

// Code của bạn ở đây:



// ============================================
// BÀI 2: Extension methods
// ============================================
// Yêu cầu:
// 1. Tạo extension NumExtension on num:
//    - toCurrency(String symbol) - format tiền tệ (VD: 1000000 → "1,000,000 VNĐ")
//    - toPercentage() - chuyển thành % (VD: 0.75 → "75%")
//
// 2. Tạo extension StringValidation on String:
//    - isValidPassword (ít nhất 8 ký tự, có chữ và số)
//    - toSlug() - chuyển thành URL slug (VD: "Hello World" → "hello-world")

// Code của bạn ở đây:



// ============================================
// BÀI 3: Enhanced Enum
// ============================================
// Yêu cầu:
// Tạo enum HttpStatus với các giá trị:
// - ok(200, 'OK')
// - created(201, 'Created')
// - badRequest(400, 'Bad Request')
// - unauthorized(401, 'Unauthorized')
// - notFound(404, 'Not Found')
// - serverError(500, 'Internal Server Error')
//
// Thêm các method:
// - isSuccess (2xx)
// - isClientError (4xx)
// - isServerError (5xx)

// Code của bạn ở đây:



// ============================================
// BÀI 4: Records và Pattern Matching
// ============================================
// Yêu cầu:
// 1. Tạo function parseCoordinate(String input) trả về (double, double)?
//    - Input: "10.5,20.3" → (10.5, 20.3)
//    - Input invalid → null
//
// 2. Tạo function describeShape(Object shape) dùng pattern matching:
//    - Record 1 phần tử: (double r,) → "Circle with radius r"
//    - Record 2 phần tử: (double w, double h) → "Rectangle WxH"
//    - Record 3 phần tử: (double a, double b, double c) → "Triangle with sides a, b, c"
//    - Các trường hợp khác: "Unknown shape"

// Code của bạn ở đây:



// ============================================
// BÀI 5: Sealed Class - Network State (NÂNG CAO)
// ============================================
// Yêu cầu:
// 1. Tạo sealed class NetworkState<T>:
//    - Idle (trạng thái ban đầu)
//    - Loading (đang tải)
//    - Success(T data) (thành công với dữ liệu)
//    - Error(String message, int? code) (lỗi với thông báo và mã lỗi tùy chọn)
//
// 2. Tạo function renderState<T>(NetworkState<T> state) → String
//    Dùng exhaustive switch để xử lý tất cả các trường hợp

// Code của bạn ở đây:



// ============================================
// MAIN - Test code của bạn
// ============================================
void main() {
  // Uncomment từng bài để test
  
  // Bài 1: Generic Stack
  // testGenericStack();
  
  // Bài 2: Extensions
  // testExtensions();
  
  // Bài 3: Enhanced Enum
  // testEnhancedEnum();
  
  // Bài 4: Records & Pattern Matching
  // testRecordsAndPatterns();
  
  // Bài 5: Sealed Class
  // testSealedClass();
  
  print('Hãy uncomment và hoàn thành từng bài!');
}
