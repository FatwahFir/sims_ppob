# SIMS PPOB - Flutter Technical Test

Welcome to the **SIMS PPOB App**, a mobile application built using Flutter 3.24 and powered by GetX 4.6 for state management. This project is developed as part of a **Technical Test** to demonstrate proficiency in Flutter and mobile development best practices.

## ✨ Features

- **Registration**: New users can create an account via the registration form.
- **Login**: Access the app using email and password authentication.
- **View Profile**: Users can view their profile details, including account information and balance.
- **Update Profile Data**: Users can update profile information such as name, email, and other personal data.
- **Update Profile Picture**: Change the profile picture directly from the app.
- **Top Up**: Users can add funds to their e-wallet using various payment methods.
- **Payments**: Make payments using the e-wallet balance for services or products.
- **Transaction History**: View a complete history of past transactions, including timestamps and amounts.

## 📱 Screenshots

Here are some screenshots from the app:

<div style="display: flex; flex-wrap: wrap; gap: 10px;">
  <img src="assets/images/login_screen.jpg" alt="Login Screen" width="300"/>
  <img src="assets/images/home_screen.jpg" alt="Dashboard" width="300"/>
  <img src="assets/images/topup_screen.jpg" alt="Top Up Screen" width="300"/>
  <img src="assets/images/history_screen.jpg" alt="Transaction History" width="300"/>
</div>

## 🛠 Tech Stack

- **Framework**: [Flutter 3.24](https://flutter.dev/)
- **State Management**: [GetX 4.6](https://pub.dev/packages/get)
- **Networking**: GetConnect
- **Local Storage**: GetStorage
- **Language**: Dart

## 🚀 Installation Guide

Follow these steps to get the app running locally:

### Prerequisites

- Flutter SDK version 3.24 ([Installation Guide](https://flutter.dev/docs/get-started/install))
- Android Studio / VSCode
- Dart SDK

### Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/FatwahFir/sims_ppob.git
   cd sims_ppob
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the Application**
   ```bash
   flutter run
   ```

4. **Build for Android/iOS**
   - Android: `flutter build apk`
   - iOS: `flutter build ios` (macOS required)

## 🧑‍💻 Folder Structure (GetX Pattern)

The project follows the **GetX Pattern** to keep the code clean, modular, and scalable. Below is the folder structure:

```
lib/
|-- app/
|   |-- data/              # Data layer (API, models)
|   |-- modules/           # App features (UI, controllers, bindings)
|       |-- home/          # Example feature module
|           |-- controllers/
|           |-- bindings/
|           |-- views/
|           |-- models/
|   |-- routes/            # App routes
|   |-- utils/             # Helper classes and utilities
|-- assets/                # Images, fonts, etc.
|-- main.dart              # Entry point
```

### Explanation:

- `app/data/` contains data models and API services.
- `app/modules/` contains features divided into smaller modules with **controllers**, **bindings**, **views**, and **models** for each feature.
- `app/routes/` handles navigation and routing.
- `app/utils/` contains utility functions like formatters or common reusable classes.

## 💻 Contributors

- **Fatwah Firmansyah SR** - [GitHub](https://github.com/FatwahFir)

Feel free to reach out via GitHub for any feedback or questions.

## 📄 License

This project is licensed under the MIT License. You are free to use, modify, and distribute the code as per the terms of the license.
