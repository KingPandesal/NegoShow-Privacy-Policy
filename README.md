# 🛠️ Flutter-Starter-Inator

> *"BEHOLD! The Flutter-Starter-Inator! No more rebuilding authentication every single project!"* — Dr. Heinz Doofenshmirtz (probably)

Flutter-Starter-Inator is a reusable Flutter template designed to eliminate repetitive project setup. Instead of spending hours recreating authentication, folder structures, routing, and reusable widgets, start with a solid, scalable foundation and focus on building your application's features.

This template is intended for developers who frequently build Flutter applications and want a consistent starting point for every project.

## ✨ Features

- 🔐 Firebase Authentication
  - Email & Password Sign In
  - Email & Password Sign Up
  - Google Sign-In
  - Forgot Password
  - Persistent Login Session
  - Logout

- 🏗️ Feature-Based Architecture

- 📁 Clean Folder Structure

- 🎨 Ready for Theme Customization

- ♻ Reusable Components
  - Custom Buttons
  - Custom Text Fields
  - Loading Indicators
  - Dialogs

- 🚀 Easy Firebase Setup

---

## 📂 Project Structure

```
lib/
│
├── auth/
│   ├── auth_gate.dart
│   ├── auth_service.dart
│   ├── login_page.dart
│   ├── register_page.dart
│   ├── forgot_password_page.dart
│   └── splash_page.dart
│
├── core/
│   ├── services/
│   ├── theme/
│   ├── utils/
│   └── widgets/
│
├── features/
│
├── models/
│
├── routes/
│
└── main.dart
```

---

## 🔄 Authentication Flow

```
Splash Screen
      │
      ▼
Is user logged in?
      │
 ┌────┴────┐
 │         │
No        Yes
 │         │
 ▼         ▼
Login   App Entry Point
```

> This template only handles **authentication**.
>
> Navigation after login (single user, admin, employee, student, etc.) should be implemented in each project.

---

## 👥 Supported Project Types

- Single User Applications
- Two-Role Systems
- Multi-Role Systems
- Admin Dashboards
- Student Systems
- Business Management Systems
- Machine Learning Applications
- Capstone Projects

---

## 🛠 Built With

- Flutter
- Firebase Authentication
- Google Sign-In
- Firebase Core

---

## 📚 Documentation

This repository intentionally separates the project overview from the setup guide.

For installation instructions, Firebase configuration, authentication flow, and project setup, please refer to:

➡️ **README_TEMPLATE.md**

---

## 📌 Notes

This template intentionally does **not** include business logic.

Each project should define:
- User roles
- Firestore collections
- Database structure
- Home pages
- Feature modules

Only the authentication layer is shared.

---

## 🤝 Contributing

Suggestions, improvements, and pull requests are always welcome.

If you have ideas that make Flutter-Starter-Inator more reusable, scalable, or secure, feel free to contribute.

---

## 📄 License

Feel free to use this template for personal, academic, or commercial Flutter projects.