# Needit - E-Commerce Platform

**Needit** is a robust, production-ready e-commerce mobile application designed for scalability and performance. Built with **Flutter**, the project serves as a showcase for implementing enterprise-level architectural patterns and automated testing.

## 🚀 Features
* **User Authentication:** Secure login and registration powered by **Firebase Auth**.
* **Dynamic Product Catalog:** Real-time data synchronization with **Firebase Cloud Firestore**.
* **State Management:** Strict implementation of the **BLoC (Business Logic Component) pattern** for predictable state transitions.
* **Responsive Dashboard:** Integrated dashboard for managing orders and products.
* **Clean UI/UX:** Following modern design principles for a seamless shopping experience.

## 🏗 Architecture & Patterns
The project is built using **Clean Architecture** principles to ensure the separation of concerns and maintainability:
* **Data Layer:** Handles external data sources (APIs, Firebase).
* **Domain Layer:** Contains the core business logic and entities (Independent of any framework).
* **Presentation Layer:** Manages UI logic and state using **BLoC**.
* **TDD (Test-Driven Development):** High code coverage through unit and widget testing to ensure reliability.

## 🛠 Tech Stack
* **Language:** Dart
* **Framework:** Flutter
* **State Management:** Flutter BLoC
* **Backend:** Firebase (Firestore, Auth)
* **Design Pattern:** Clean Architecture, Repository Pattern

## 🔧 Automation & DevOps
This project integrates **CI/CD pipelines** to automate the build and release process, showcasing a modern **Mobile DevOps** workflow.
