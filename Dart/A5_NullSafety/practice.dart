// A5. Null Safety - Bài tập thực hành
// Tạo file này và thực hiện các bài tập bên dưới

// ============================================
// BÀI 1: User Profile (Nullable types + ??)
// ============================================
// Yêu cầu:
// 1. Tạo class UserProfile với:
//    - String name (bắt buộc)
//    - String? bio (có thể null)
// 2. Hàm displayBio() in bio, nếu null thì in "No bio yet"

// Code của bạn ở đây:
class UserProfile {
    String name;
    String? bio;

    UserProfile({required this.name, this.bio});

    void displayBio() {
        print(bio ?? "No bio yet");
    }
}



// ============================================
// BÀI 2: Safe Access (Null-aware access ?.)
// ============================================
// Yêu cầu:
// 1. Tạo class Address có String? city
// 2. Tạo class Customer có Address? address
// 3. Tạo class Order có Customer? customer
// 4. In ra city của order, xử lý an toàn khi bất kỳ giá trị nào là null

// Code của bạn ở đây:
class Address {
    String? city;
}

class Customer {
    Address? address;
}

class Order {
    Customer? customer;
}



// ============================================
// BÀI 3: Cache Pattern (late + ??=)
// ============================================
// Yêu cầu:
// 1. Tạo class ConfigManager với:
//    - late Map<String, String> _config
//    - Hàm loadConfig() để khởi tạo _config với một số key-value
//    - Hàm getValue(String key) trả về giá trị hoặc "Not found"
// 2. Test trong main()

// Code của bạn ở đây:
// class ConfigManager {
//     late Map<String, String> _config;

//     void loadConfig() {
//         _config = {
//             "app_name": "My App",
//             "version": "1.0.0",
//         };
//     }

//     String getValue(String key) {
//         return _config[key] ?? "Not found";
//     }
// }

class ConfigManager {
    Map<String, String>? _config;

    void loadConfig() {
      
        _config = {
            "app_name": "My App",
            "version": "1.0.0",
        };
    }

    String getValue(String key) {
        if (_config == null) {
            return "Config not reloaded!";
        }
        return _config![key] ?? "Not found";
    }
}


// ============================================
// MAIN - Test code của bạn
// ============================================
void main() {
  // Test bài 1: UserProfile
  var user1 = UserProfile(name: "An");
  user1.displayBio(); // No bio yet
  
  var user2 = UserProfile(name: "Bình", bio: "Flutter developer");
  user2.displayBio(); // Flutter developer

  // Test bài 2: Safe Access
  var order = Order();
  order.customer = Customer();
  order.customer?.address = Address();
  order.customer?.address?.city = "Ho Chi Minh";
  print(order.customer?.address?.city ?? "Unknown city");
  // In city an toàn

  // Test bài 3: ConfigManager
  var config = ConfigManager();
  config.loadConfig();
  print(config.getValue("app_name"));
  print(config.getValue("unknown_key")); // Not found
  

}
