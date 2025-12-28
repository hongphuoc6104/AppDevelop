// double calculateSalary(double hourlyRate, double hoursWorked) => hourlyRate * hoursWorked;

// void main() {
//     double hourlyRate = 20.0;
//     double hoursWorked = 40.0;
//     double salary = calculateSalary(hourlyRate, hoursWorked);
//     print("Salary: $salary");
// }
 

// ### Bài 1: Calculate Salary (Tính lương)
// Viết hàm `calculateSalary` nhận vào:
// - `hourlyRate` (lương theo giờ - double)
// - `hoursWorked` (số giờ làm - double)
// - Trả về tổng lương.
// - Dùng **Arrow Function**.

void createUserRel({required String name, int? age, String role = "User"}) {
   print("User: $name, Age: $age, Role: $role"); 
}

void main() {
    createUserRel(name: "John", age: 30, role: "Admin");
    createUserRel(name: "Jane", age: 25);
    createUserRel(name: "Bob");
}

// ### Bài 2: User Profile (Hồ sơ người dùng)
// Viết hàm `createUserRel` sử dụng **Named Parameters**:
// - `name` (String, required)
// - `age` (int, optional - có thể null)
// - `role` (String, mặc định là "User")
// - In ra thông tin người dùng được tạo.