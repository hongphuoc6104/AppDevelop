// Bài 1: Student Profile (Hồ sơ sinh viên)
// Tạo code quản lý thông tin sinh viên với các yêu cầu:

// Tạo biến studentName (tên sinh viên) - kiểu String.
// Tạo biến studentId (mã số sinh viên) - không thể thay đổi (dùng final hoặc const).
// Tạo biến averageScore (điểm trung bình) - kiểu số thực.
// Tạo biến isEnrolled (đang nhập học) - kiểu boolean (true/false).
// In ra thông tin bằng cách dùng String Interpolation (dùng $variable).


// void main() {
//     String studentName = "Hong Phuoc";
//     final String studentID = "B2308385";
//     double averageScore = 3.42;
//     bool isEnrolled = true;

//     print("student name: $studentName");
//     print("student ID: $studentID");
//     print("averageScore: $averageScore");
//     print("isEnrolled: $isEnrolled");

// }


// Bài 2: Shopping Cart (Giỏ hàng)
// Khai báo productName = "Laptop".
// Khai báo price = 1500 (giá tiền).
// Khai báo quantity = 2 (số lượng).
// Tính tổng tiền (total = price * quantity) ngay trong câu lệnh print.
// Kết quả in ra phải giống mẫu: "Invoice: Bought 2 Laptop(s). Total: $3000"

void main() {
    productName = "Laptop(s)";
    price = 1500;
    quantity = 2;
    total = price * quantity;
    print("Invoice: Bought $quantity $productName. Total: \$$total");
}

