# Dart/Flutter Learning Roadmap: 0 to Hero

> **Goal:** Become a Flutter Mobile Developer  
> **Start Date:** 24/12/2024

---

# Part A: DART LANGUAGE

## A1. Dart Basics
- [x] Variables (`var`, `const`, `final`)
- [x] Data Types (`int`, `double`, `String`, `bool`, `dynamic`)
- [x] Operators (arithmetic, comparison, logical, assignment)
- [x] String interpolation (`$variable`, `${expression}`)
- [x] Type inference & Type annotation
- [x] Comments (single-line, multi-line, documentation)

## A2. Control Flow
- [x] Conditional: `if-else`
- [x] Conditional: `switch-case`
- [x] Ternary operator (`condition ? true : false`)
- [x] Loop: `for`
- [x] Loop: `for-in`
- [x] Loop: `while`
- [x] Loop: `do-while`
- [x] `break` and `continue`

## A3. Functions ✅ COMPLETED
- [x] Function declaration & return types
- [x] Arrow functions (`=>`)
- [x] Positional parameters
- [x] Optional positional parameters (`[]`)
- [x] Named parameters (`{}`)
- [x] Default parameter values
- [x] `required` keyword
- [x] Anonymous functions (lambda)
- [x] Higher-order functions

## A4. Object-Oriented Programming ✅ COMPLETED
- [x] Classes & Objects
- [x] Constructor (default constructor)
- [x] `this.` shorthand
- [x] Named Constructor (`User.fromJson()`, `User.guest()`)
- [x] Initializer List (`:`)
- [x] Positional vs Named Parameters in constructors
- [x] Getter (`get`)
- [x] Setter (`set`)
- [x] Mixin (`with` keyword)
- [x] Private members (`_`)
- [x] Inheritance (`extends`)
- [x] `super` keyword
- [x] Abstract Class (`abstract`)
- [x] Interface (implicit in Dart)
- [x] Polymorphism
- [x] `@override` annotation
- [x] `static` keyword
- [x] Factory constructor

## A5. Null Safety ✅ COMPLETED
- [x] Nullable types (`String?`, `int?`)
- [x] Non-nullable types
- [x] Null assertion operator (`!`)
- [x] Null-aware access (`?.`)
- [x] Null-coalescing operator (`??`)
- [x] Null-aware assignment (`??=`)
- [x] `late` keyword
- [x] Flow analysis

## A6. Collections ✅ IN PROGRESS
- [/] List (create, add, remove, access, iterate)
- [ ] List methods (`add`, `remove`, `contains`, `indexOf`)
- [ ] Set (unique values, operations)
- [ ] Map (key-value pairs, access, iterate)
- [ ] Spread operator (`...`, `...?`)
- [ ] Collection if
- [ ] Collection for
- [ ] `map()` - transform elements
- [ ] `where()` - filter elements
- [ ] `reduce()` - aggregate values
- [ ] `fold()` - aggregate with initial value
- [ ] `any()` / `every()` - test conditions
- [ ] `firstWhere()` / `lastWhere()`
- [ ] `sort()` / `reversed`

## A7. Asynchronous Programming
- [ ] `Future` concept
- [ ] `async` / `await`
- [ ] `Future.delayed()`
- [ ] `Future.value()`
- [ ] `Future.error()`
- [ ] `Future.wait()` - parallel execution
- [ ] `Future.timeout()`
- [ ] `.then()` / `.catchError()` / `.whenComplete()`
- [ ] Error handling with `try-catch-finally`
- [ ] `Stream` concept
- [ ] `async*` / `yield`
- [ ] `StreamController`
- [ ] `Stream.listen()`
- [ ] Stream transformations
- [ ] Broadcast streams

## A8. Advanced Dart
- [ ] Generics (`<T>`)
- [ ] Generic classes
- [ ] Generic methods
- [ ] Type constraints (`extends`)
- [ ] Typedef / Function types
- [ ] Extension methods
- [ ] Enhanced Enum (Dart 2.17+)
- [ ] Cascade notation (`..`)
- [ ] Records (Dart 3.0+)
- [ ] Pattern matching (Dart 3.0+)
- [ ] Sealed classes (Dart 3.0+)

## A9. Error Handling
- [ ] Exceptions
- [ ] `throw` keyword
- [ ] `try-catch`
- [ ] `on` clause for specific exceptions
- [ ] `finally` block
- [ ] `rethrow`
- [ ] Custom exceptions

## A10. Libraries & Packages
- [ ] `import` statement
- [ ] `show` / `hide`
- [ ] `as` (alias)
- [ ] `part` / `part of`
- [ ] Deferred loading (`deferred as`)
- [ ] pubspec.yaml
- [ ] Using packages from pub.dev

---

# Part B: FLUTTER FRAMEWORK

## B1. Flutter Setup
- [ ] Install Flutter SDK
- [ ] Configure IDE (VS Code / Android Studio)
- [ ] Android SDK setup
- [ ] iOS setup (Mac only)
- [ ] Emulator / Physical device
- [ ] `flutter doctor`
- [ ] Create first project (`flutter create`)

## B2. Project Structure
- [ ] lib/ folder
- [ ] main.dart
- [ ] pubspec.yaml
- [ ] assets folder
- [ ] android/ & ios/ folders
- [ ] MaterialApp / CupertinoApp

## B3. Widget Fundamentals
- [ ] Widget concept
- [ ] Widget tree
- [ ] StatelessWidget
- [ ] StatefulWidget
- [ ] `setState()`
- [ ] BuildContext
- [ ] Widget lifecycle
- [ ] Keys (ValueKey, ObjectKey, UniqueKey)

## B4. Basic Widgets
- [ ] Text / RichText / SelectableText
- [ ] Image (asset, network)
- [ ] Icon / IconButton
- [ ] ElevatedButton / TextButton / OutlinedButton
- [ ] FloatingActionButton
- [ ] Container
- [ ] Card
- [ ] Divider
- [ ] CircularProgressIndicator / LinearProgressIndicator

## B5. Input Widgets
- [ ] TextField
- [ ] TextFormField
- [ ] Checkbox / CheckboxListTile
- [ ] Radio / RadioListTile
- [ ] Switch / SwitchListTile
- [ ] Slider
- [ ] DropdownButton
- [ ] DatePicker / TimePicker

## B6. Layout Widgets
- [ ] Row
- [ ] Column
- [ ] Stack / Positioned
- [ ] Expanded
- [ ] Flexible
- [ ] Spacer
- [ ] Padding
- [ ] Center
- [ ] Align
- [ ] SizedBox
- [ ] ConstrainedBox
- [ ] AspectRatio
- [ ] FractionallySizedBox
- [ ] Wrap

## B7. Scrollable Widgets
- [ ] SingleChildScrollView
- [ ] ListView
- [ ] ListView.builder
- [ ] ListView.separated
- [ ] GridView
- [ ] GridView.builder
- [ ] CustomScrollView
- [ ] Slivers (SliverList, SliverGrid, SliverAppBar)
- [ ] PageView
- [ ] RefreshIndicator

## B8. Navigation
- [ ] Navigator.push / pop
- [ ] Named routes
- [ ] Route arguments
- [ ] Navigator.pushReplacement
- [ ] Navigator.pushAndRemoveUntil
- [ ] WillPopScope
- [ ] Navigator 2.0 concepts
- [ ] go_router package

## B9. App Structure
- [ ] Scaffold
- [ ] AppBar
- [ ] Drawer
- [ ] BottomNavigationBar
- [ ] TabBar / TabBarView
- [ ] BottomSheet
- [ ] Dialog (AlertDialog, SimpleDialog)
- [ ] SnackBar

## B10. Theming & Styling
- [ ] ThemeData
- [ ] ColorScheme
- [ ] TextTheme
- [ ] Dark / Light mode
- [ ] Custom fonts
- [ ] MediaQuery
- [ ] LayoutBuilder
- [ ] OrientationBuilder
- [ ] Responsive design

## B11. Modern State Management (Riverpod)
- [ ] ProviderScope & Ref
- [ ] Provider / StateProvider
- [ ] FutureProvider / StreamProvider
- [ ] StateNotifierProvider / NotifierProvider (Dart 3)
- [ ] Code Generation (`@riverpod`)
- [ ] Family & AutoDispose modifiers

## B12. Modern Navigation (GoRouter)
- [ ] Route Configuration
- [ ] Parameters & Query Params
- [ ] Nested Navigation (ShellRoute)
- [ ] Redirection (Auth Guard)
- [ ] Deep Linking

## B13. Networking & Data
- [ ] Dio package (Interceptors, Helpers)
- [ ] JSON Serialization (`json_serializable`)
- [ ] Repository Pattern basics
- [ ] Error Handling & Result Types

## B14. Local Storage
- [ ] SharedPreferences (Simple settings)
- [ ] Hive / Isar (NoSQL DB)
- [ ] Secure Storage (Tokens/Passwords)

## B15. Forms & Validation
- [ ] Form widget
- [ ] GlobalKey<FormState>
- [ ] TextFormField validators
- [ ] Form submission (`validate()`, `save()`)
- [ ] Custom validators
- [ ] Real-time validation
- [ ] Error display

## B16. Animations
- [ ] Implicit animations
  - [ ] AnimatedContainer
  - [ ] AnimatedOpacity
  - [ ] AnimatedPositioned
  - [ ] AnimatedSwitcher
- [ ] Explicit animations
  - [ ] AnimationController
  - [ ] Tween
  - [ ] CurvedAnimation
  - [ ] AnimatedBuilder
- [ ] Hero animations
- [ ] Lottie / Rive animations

## B17. Testing
- [ ] Unit testing
- [ ] Widget testing
- [ ] Integration testing
- [ ] Mocking (mockito)
- [ ] Test coverage

## B18. Clean Architecture (Core)
- [ ] Domain Layer (Entities, UseCases)
- [ ] Data Layer (Models, Repositories, DataSources)
- [ ] Presentation Layer (Controllers, Widgets)
- [ ] Dependency Injection (`riverpod` or `get_it`)

## B19. Platform Integration
- [ ] Platform Channels
- [ ] Permissions handling
- [ ] Camera access
- [ ] Gallery access
- [ ] Location services
- [ ] Push notifications (local)
- [ ] Deep linking
- [ ] Share functionality

## B20. Performance & Optimization
- [ ] `const` constructors
- [ ] `ListView.builder` for long lists
- [ ] Image caching
- [ ] Lazy loading
- [ ] Memory management
- [ ] DevTools profiling

## B21. Deployment
- [ ] App icon & splash screen
- [ ] Build modes (debug, profile, release)
- [ ] Build Android APK
- [ ] Build Android App Bundle (AAB)
- [ ] Build iOS IPA
- [ ] Play Store submission
- [ ] App Store submission
- [ ] Code signing

---

# Part C: DOMAIN MASTERY (The 4 Pillars)

## C1. E-Commerce Module (Shopee Clone)
**Focus:** Complex UI, State Management, Caching.
- [ ] **UI:** Product Grid (StaggeredView), Slivers (Collapsing AppBar).
- [ ] **Logic:** Cart Logic (Add/Remove/Update) using Riverpod.
- [ ] **Data:** Local Caching (Hive) for offline browsing.
- [ ] **Integration:** Payment Gateway Mocking (Stripe/MoMo UI).
- [ ] **Animation:** "Add to Cart" flying animation.

## C2. Social Media Module (TikTok/Insta Clone)
**Focus:** Performance, Media, Real-time.
- [ ] **UI:** Infinite Scroll (PageView.builder), Overlay UI.
- [ ] **Media:** Video Player (caching, preloading), Camera access.
- [ ] **Logic:** Feed Algorithm (basic randomization).
- [ ] **Backend:** Firebase Auth + Firestore (Real-time posts).
- [ ] **Real-time:** Chat feature (Socket.io or Firestore Streams).

## C3. Delivery & Maps Module (Grab Clone)
**Focus:** Location, Maps, Algorithms.
- [ ] **Integration:** Google Maps / Mapbox setup.
- [ ] **Logic:** Real-time Geolocation tracking.
- [ ] **UI:** BottomSheet for Trip Details, DraggableScrollableSheet.
- [ ] **Algo:** Polyline (drawing route on map).
- [ ] **State:** Complex Trip State (Finding -> Arrived -> Riding -> Done).

## C4. FinTech Module (E-Wallet)
**Focus:** Security, Precision, Charts.
- [ ] **Security:** Biometric Auth (Fingerprint/FaceID).
- [ ] **UI:** interactive Charts (FL_Chart).
- [ ] **Logic:** Number formatting, Currency precision.
- [ ] **Security:** App integrity, Root detection.
- [ ] **Form:** Complex Validation pipeline.

---

# Part D: ADVANCED & DEPLOYMENT
- [ ] Testing (Unit, Widget, Integration)
- [ ] CI/CD (Codemagic / GitHub Actions)
- [ ] Performance Profiling (Impeller, DevTools)
- [ ] Publishing (Apple Store, Play Store)

---

# Current Progress

**Current Section:** A6. Collections  
**Status:** In Progress  
**Next:** A7. Asynchronous Programming

### Completed
- [x] A1: Variables, Data Types, Operators, String Interpolation
- [x] A2: Control Flow (if-else, switch, loops)
- [x] A3: Functions (Declaration, Parameters, Arrow function, Lambda, Higher-order)
- [x] A4: Object-Oriented Programming (Classes, Interfaces, Mixins, Static, Factory)
- [x] A3_A4_Supplement: Bài tập bổ sung (List Processing, MathConstants, Logger Singleton)
- [x] A5: Null Safety (Nullable, ?, ??, ??=, late, !)
- [x] Exercise 2.4: BankAccount class

### Environment
- Flutter SDK: 3.38.5
- Dart SDK: 3.10.4
- OS: Ubuntu Linux
- Test Device: Android phone

---

*Last Updated: 28/12/2024*
