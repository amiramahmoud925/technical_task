# Technical Task

A Flutter application demonstrating state management, API integration, and cart functionality using **Provider**. This project is part of a technical assessment focused on showcasing clean architecture, UI implementation, and problem-solving in Flutter.

---

## Features
- Fetch products from FakeStore API
- Add/Remove products from cart
- Favorites functionality
- State Management using **Provider**
- Navigation between Product List, Details, and Cart pages

---

##  Folder Structure
```
lib/
 ├─ models/         # Data models (Product, cart)
 ├─ services/       # API services
 ├─ providers/      # State management (CartProvider)
 ├─ views/          # UI Screens (Home, Details, Cart)
 ├─ widgets/        # Reusable widgets
 └─ main.dart       # Entry point
```

---

## State Management – Why Provider?
Provider was chosen for its:
- Simplicity and lightweight nature
- Reactive UI updates
- Easy scalability for real projects

It manages global states like cart items and favorites efficiently.

---

## API Used
```
https://fakestoreapi.com/products
https://fakestoreapi.com/products/categories
```
- `GET /products` → Fetch all products
- `GET /products/{id}` → Fetch single product details

---

##  Setup Instructions
1️⃣ Clone the repository:
```bash
git clone https://github.com/amiramahmoud925/technical_task.git
```
2️⃣ Install dependencies:
```bash
flutter pub get
```
3️⃣ Run the app:
```bash
flutter run
```

---

## GitHub URL
https://github.com/amiramahmoud925/technical_task/