# 📝 Taskaty App

A Flutter-based Task Management Application built with clean architecture principles. The app features user authentication, task tracking, and state management powered by Bloc/Cubit.

---

## 🚀 Features

- **User Authentication**: Secure Login flow with persistent session storage using tokens.
- **Task Management**:
  - Fetch user-specific tasks dynamically (`GET` request).
  - Update task status and details (`PUT` request).
> **Used `POST` requests to handle user authentication and send credentials securely.**
- **Persistent Storage**: Save authentication tokens locally for seamless re-authentication.
- **Network & Logging**: Intercepted network calls with detailed logging during development.

---

## 🛠 Tech Stack & Packages

- **Framework**: [Flutter](https://flutter.dev/)
- **State Management**: `flutter_bloc`
- **Networking**: `dio`
- **Logging**: `pretty_dio_logger`
- **Local Storage**: `shared_preferences`

---

## 🔑 Key Learnings & Highlights

- Handled **RESTful APIs** using `GET` and `PUT` HTTP methods.
- Managed request interceptors to automatically append `Authorization: Bearer <token>` headers.
- Solved CORS and header format issues when running on Flutter Web (`application/x-www-form-urlencoded` / `FormData`).
