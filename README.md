# 📱 WhatsApp Clone

A modern, feature-rich WhatsApp clone built with Flutter and Firebase. This application replicates the core functionality and user experience of WhatsApp, including real-time messaging, user authentication, and a beautiful adaptive UI.

## ✨ Features

### 🔥 Core Functionality
- **Real-time Messaging** - Instant message delivery using Firebase Realtime Database
- **User Authentication** - Secure login/signup with Firebase Auth
- **User Conversations** - Private chat functionality
- **Status/Stories** - Share status updates with contacts
- **Settings Management** - Customizable user preferences

### 🎨 UI/UX
- **Adaptive Theming** - Support for light and dark themes
- **Modern Material Design** - Clean and intuitive user interface
- **Bottom Navigation** - Easy navigation between main features
- **Custom Widgets** - Reusable UI components
- **Responsive Layout** - Optimized for different screen sizes

### 🏗️ Technical Features
- **Clean Architecture** - Separation of concerns with proper layering
- **State Management** - Flutter BLoC pattern implementation
- **Dependency Injection** - GetIt service locator pattern
- **Local Storage** - Shared preferences for app settings
- **Image Handling** - Camera integration and image picker
- **Firebase Integration** - Complete backend services

## 🛠️ Tech Stack

### Frontend
- **Flutter** - Cross-platform mobile framework
- **Dart** - Programming language
- **Material Design** - UI components

### State Management & Architecture
- **Flutter BLoC** - Predictable state management
- **Equatable** - Value equality for Dart classes
- **GetIt** - Dependency injection container
- **Auto Route** - Code generation for navigation

### Backend & Services
- **Firebase Core** - Firebase SDK foundation
- **Firebase Auth** - Authentication services
- **Cloud Firestore** - NoSQL document database
- **Firebase Realtime Database** - Real-time data synchronization

### Additional Libraries
- **Dio** - HTTP client for API calls
- **Image Picker** - Access device camera and gallery
- **Camera** - Camera functionality
- **Shared Preferences** - Local data persistence

## 📱 Screenshots

> Add your app screenshots here when available

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (^3.9.2)
- Dart SDK
- Android Studio / VS Code
- Firebase project setup

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/whatsapp_clone.git
   cd whatsapp_clone
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   - Create a new Firebase project at [Firebase Console](https://console.firebase.google.com)
   - Enable Authentication, Firestore, and Realtime Database
   - Download and add configuration files:
     - `android/app/google-services.json` for Android
     - `ios/Runner/GoogleService-Info.plist` for iOS

4. **Generate code**
   ```bash
   flutter packages pub run build_runner build
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

## 📂 Project Structure

```
lib/
├── config/                 # App configuration
│   ├── init/              # Dependency injection setup
│   ├── routes/            # Navigation routes
│   └── theme/             # App theming
├── core/                  # Core utilities and widgets
│   ├── constants/         # App constants
│   ├── service/           # Core services
│   ├── usecase/           # Use case abstractions
│   ├── utils/             # Utility functions
│   └── widgets/           # Reusable widgets
├── features/              # Feature modules
│   ├── auth_features/     # Authentication
│   ├── botton_navigation/ # Navigation
│   ├── conversations/     # Chat functionality
│   ├── settings/          # App settings
│   └── situations/        # Status/Stories
├── firebase_options.dart  # Firebase configuration
└── main.dart             # App entry point
```

## 🏗️ Architecture

This project follows **Clean Architecture** principles:

- **Presentation Layer** - UI components and state management (BLoC)
- **Domain Layer** - Business logic and use cases
- **Data Layer** - Data sources and repositories
- **Core Layer** - Shared utilities and constants

### State Management
The app uses **BLoC (Business Logic Component)** pattern for state management, providing:
- Predictable state changes
- Easy testing
- Separation of business logic from UI

## 🔧 Configuration

### Firebase Services
Make sure to enable the following Firebase services:
- **Authentication** - For user login/signup
- **Cloud Firestore** - For storing user data and messages
- **Realtime Database** - For real-time messaging
- **Storage** - For media files (if implemented)

### App Icons
The app uses custom launcher icons. Update the icon by replacing:
```
assets/app_logo/app_logo.png
```

Then run:
```bash
flutter pub run flutter_launcher_icons:main
```

## 🧪 Testing

Run tests with:
```bash
flutter test
```

## 📝 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📱 Building for Production

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## 🐛 Known Issues

- Add any known issues or limitations here

## 🔮 Future Enhancements

- [ ] Voice messages
- [ ] Video calls
- [ ] Group chats
- [ ] Media sharing
- [ ] Push notifications
- [ ] Message encryption
- [ ] Online/offline status
- [ ] Message reactions

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Emin Alan** - *Flutter Developer*

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend services
- Material Design for UI guidelines
- WhatsApp for inspiration

## 📞 Support

If you have any questions or issues, please open an issue on GitHub or contact [eminalan334@gmail.com]

---

⭐ **If you found this project helpful, please give it a star!** ⭐
