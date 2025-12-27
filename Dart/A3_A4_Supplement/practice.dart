import 'dart:math';
// ## 6. Bài Tập Thực Hành
// ### Bài 1: List Processing (Xử lý danh sách)
// Cho danh sách điểm số: `[8, 5, 9, 3, 10, 4, 7]`
// 1.  Dùng `where` (kết hợp lambda) để lọc ra các điểm **>= 5** (Đậu).
// 2.  Dùng `map` để cộng thêm 1 điểm bonus cho các bạn Đậu.
// 3.  In danh sách cuối cùng.

// void main() {
//     var myList = [8, 5, 9, 3, 10, 4, 7];

//     var filteredList = myList.where((item) {
//        return item >= 5;
//     });

//     var mapedList = filteredList.map((item) {
//         return item + 1;
//     });
//     print(mapedList);
// }


// ### Bài 2: MathConstants (Hằng số toán học)
// 1.  Tạo class `MathConstants` chứa biến `static const double e = 2.71`.
// 2.  Thêm hàm `static double power(double base, int exp)` để tính lũy thừa.
// 3.  Gọi thử trong `main` mà không tạo object.

// class MathConstants {
//     static const double e = 2.71;

//     static double power(double base, int exp) {
//         return pow(base, exp).toDouble();
//     }    
// }

// void main() {
//     print(MathConstants.e);
//     print(MathConstants.power(2, 3));
// }

class Logger {
    static final Logger _instance = Logger._internal();

    Logger._internal();

    factory Logger() {
        return _instance;
    }

    void log(String msg) {
        print(msg);
    }
}

void main() {
    var logger1 = Logger();
    var logger2 = Logger();

    logger1.log("Hello");
    print(logger1 == logger2);
}

// ### Bài 3: Logger (Singleton)
// 1.  Tạo class `Logger` sử dụng `factory` constructor để đảm bảo chỉ có **duy nhất 1 Logger** trong app.
// 2.  Class có hàm `log(String msg)` in ra thông báo.
// 3.  Test bằng cách tạo `logger1` và `logger2`, cho `logger1` log gì đó, kiểm tra xem `logger1 == logger2` không.



// ---
