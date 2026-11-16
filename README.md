<h1 align="center">🍓 FruitHub</h1>

<p align="center">
  An Arabic-first fruit shopping app built with <b>Flutter</b> and <b>Firebase</b>,
  with a separate <a href="https://github.com/youssef-hossam/fruit_hub_dash_board">admin dashboard</a> to manage products.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Firebase-FFCA28?style=flat-square&logo=firebase&logoColor=black" alt="Firebase"/>
  <img src="https://img.shields.io/badge/Clean%20Architecture-1B5E37?style=flat-square" alt="Clean Architecture"/>
  <img src="https://img.shields.io/badge/State-Cubit-21B18F?style=flat-square" alt="Cubit"/>
</p>

<p align="center">
  <img src="screenshots/hero.webp" alt="FruitHub" width="100%"/>
</p>

## 📱 Screens

| Splash | Onboarding | Onboarding |
|:-:|:-:|:-:|
| <img src="screenshots/fruit_6.webp" width="200"/> | <img src="screenshots/fruit_4.webp" width="200"/> | <img src="screenshots/fruit_5.webp" width="200"/> |

| Login | Google sign-in | Home |
|:-:|:-:|:-:|
| <img src="screenshots/fruit_3.webp" width="200"/> | <img src="screenshots/fruit_2.webp" width="200"/> | <img src="screenshots/fruit_1.webp" width="200"/> |

## ✨ Features

- 🔐 **Authentication** with Firebase: email & password, **Google** and **Facebook** sign-in.
- 👤 User data saved in **Cloud Firestore** and cached locally with `shared_preferences`.
- 🏠 Home with offers, best-selling products and a bottom navigation bar.
- 🌍 **Localization (Arabic / English)** with `intl`.
- ✨ Splash & onboarding, loading overlays and clear error messages.

## 🏗️ How it's built

```
lib/
├── core/            # services, repos, errors, entities, widgets, utils
└── features/
    ├── splash/
    ├── on_boarding/
    ├── auth/        # data · domain · presentation
    └── home/        # domain · presentation
```

- **Architecture:** Clean Architecture (data / domain / presentation) with the repository pattern.
- **State management:** Cubit (`flutter_bloc`).
- **Error handling:** `dartz` — `Either<Failure, T>`.
- **DI:** `get_it`.
- **Backend:** Firebase Auth + Cloud Firestore.

## 🚀 Run it

```bash
flutter pub get
flutter run
```

> Uses the project's Firebase config. To use your own Firebase project, run `flutterfire configure`.

---

<p align="center">Made with ❤️ by <a href="https://github.com/youssef-hossam">Youssef Hadwa</a></p>
