// ## 4. Bài Tập Thực Hành (Exercises)

// void main() {
//     String color = "Red";

//     if (color == "Red"){
//         print("Stop!");
//     } else if (color == "Green"){
//         print("Go!");
//     } else if (color == "Yellow"){
//         print("slow down!");
//     } else {
//         print("Invalid color");
//     }

//     switch (color) {
//         case "Red":
//             print("Stop!");
//             break;
//         case "Green":
//             print("Go!");
//             break;
//         case "Yellow":
//             print("slow down!");
//             break;
//         default:
//             print("Invalid color");
//     }
// }
// ### Bài 1: Traffic Light (Đèn giao thông)
// Viết chương trình dùng `if-else` hoặc `switch-case`:
// - Tạo biến `color` (String) có thể là "Red", "Yellow", "Green".
// - Nếu "Red" -> in "Stop"
// - Nếu "Yellow" -> in "Slow down"
// - Nếu "Green" -> in "Go"
// - Khác -> in "Invalid color"

void main() {
    var prices = [10.0, 20.0, 5.5, 100.0];
    double total = 0.0;

    for (var price in prices) {
        total += price;
    }

    print("Total: $total");
}

// ### Bài 2: Total Invoice (Tổng hóa đơn)
// - Cho một danh sách giá tiền: `var prices = [10.0, 20.0, 5.5, 100.0];`
// - Dùng vòng lặp `for-in` để tính tổng số tiền.
// - In kết quả cuối cùng.
