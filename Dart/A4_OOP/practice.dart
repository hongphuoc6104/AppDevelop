// ---------------------------------------------------------
// Bài tập A4: Object-Oriented Programming
// ---------------------------------------------------------

// Bài 1: Employee Management (Quản lý nhân viên)
// 1. Tạo abstract class Employee: name, abstract calculateSalary()
// 2. FullTimeEmployee: monthlySalary
// 3. PartTimeEmployee: hourlyRate, hoursWorked
// 4. Test trong main()

// abstract class Employee {
//     String _name; 

//     Employee(this._name);
//     double calculateSalary();
// } 

// class FullTimeEmployee extends Employee {
//     double _monthlySalary;
    
//     FullTimeEmployee({required double monthlySalary, required String name})
//     :_monthlySalary = monthlySalary,
//     super(name);
    
//     @override
//     double calculateSalary() => _monthlySalary;
// }

// class PartTimeEmployee extends Employee {
//     double _hourlyRate;
//     int _hoursWorked;
    
//     PartTimeEmployee({required double hourlyRate, required int hoursWorked, required String name})
//     :_hourlyRate = hourlyRate,
//     _hoursWorked = hoursWorked,
//     super(name);
    
//     @override
//     double calculateSalary() => _hourlyRate * _hoursWorked;
// }
 
// void main() {
//     var fullTimeEmployee = FullTimeEmployee(monthlySalary: 5000, name: "Hong Phuoc");
//     var partTimeEmployee = PartTimeEmployee(hourlyRate: 10, hoursWorked: 20, name: "Phuoc Nguyen");
    
//     print("Full Time Employee Salary: ${fullTimeEmployee.calculateSalary()}");
//     print("Part Time Employee Salary: ${partTimeEmployee.calculateSalary()}");
// }

// Bài 2: Super Hero (Siêu anh hùng)

mixin Flyable {
    void fly() {
        print("I can fly!");
    }
}

mixin SuperStrength {
    void smash() {
        print("I can smash!");
    }
}

class SuperHero with Flyable, SuperStrength {}

void main () {
    var superHero = SuperHero();
    superHero.fly();
    superHero.smash();
}

// 1. Mixin Flyable (fly), SuperStrength (smash)
// 2. Class SuperHero dùng 2 mixin này
// 3. Test trong main()
