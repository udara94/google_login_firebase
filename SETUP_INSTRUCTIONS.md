# Google Login Firebase Setup Instructions

This Flutter project has been configured with Firebase and Google Sign-In. Follow these steps to complete the setup:

## 1. Firebase Project Setup

### Create a Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Create a project" or "Add project"
3. Enter project name: `google-login-firebase-demo` (or your preferred name)
4. Enable Google Analytics (optional)
5. Click "Create project"

### Add Android App

1. In Firebase Console, click "Add app" and select Android
2. Enter package name: `com.google.loginfirebase.google_login_firebase`
3. Download the `google-services.json` file
4. Replace the existing `android/app/google-services.json` with your downloaded file

### Add iOS App

1. In Firebase Console, click "Add app" and select iOS
2. Enter bundle ID: `com.google.loginfirebase.googleLoginFirebase`
3. Download the `GoogleService-Info.plist` file
4. Replace the existing `ios/Runner/GoogleService-Info.plist` with your downloaded file

## 2. Google Sign-In Configuration

### Enable Google Sign-In in Firebase

1. In Firebase Console, go to Authentication > Sign-in method
2. Enable "Google" provider
3. Add your project's support email
4. Save the configuration

### Get OAuth 2.0 Client IDs

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Select your Firebase project
3. Go to APIs & Services > Credentials
4. Create OAuth 2.0 Client IDs for:
   - Android: Use your package name and SHA-1 fingerprint
   - iOS: Use your bundle ID
5. Update the configuration files with the actual client IDs

## 3. Update Configuration Files

### Update firebase_options.dart

Replace the placeholder values in `lib/firebase_options.dart` with your actual Firebase configuration:

```dart
static const FirebaseOptions android = FirebaseOptions(
  apiKey: 'YOUR_ACTUAL_API_KEY',
  appId: 'YOUR_ACTUAL_APP_ID',
  messagingSenderId: 'YOUR_ACTUAL_SENDER_ID',
  projectId: 'your-actual-project-id',
  storageBucket: 'your-actual-project-id.appspot.com',
);
```

### Update Info.plist (iOS)

In `ios/Runner/Info.plist`, replace the placeholder URL scheme with your actual reversed client ID:

```xml
<string>com.googleusercontent.apps.YOUR_ACTUAL_CLIENT_ID</string>
```

## 4. Run the App

1. Install dependencies:

   ```bash
   flutter pub get
   ```

2. Run on Android:

   ```bash
   flutter run
   ```

3. Run on iOS:
   ```bash
   flutter run -d ios
   ```

## 5. Testing

1. Launch the app
2. You should see a beautiful login page with a "Continue with Google" button
3. Tap the button to sign in with Google
4. After successful authentication, you'll see the home page with user information
5. Use the "Sign Out" button to test the logout functionality

## Features Implemented

- ✅ Firebase Core integration
- ✅ Firebase Authentication
- ✅ Google Sign-In integration
- ✅ Beautiful login page UI
- ✅ Home page with user information
- ✅ Automatic authentication state management
- ✅ Sign out functionality
- ✅ Error handling and loading states

## Project Structure

```
lib/
├── main.dart                 # App entry point with Firebase initialization
├── firebase_options.dart     # Firebase configuration
├── services/
│   └── auth_service.dart     # Google Sign-In service
└── pages/
    ├── login_page.dart       # Login page UI
    └── home_page.dart        # Home page UI
```

## Troubleshooting

### Common Issues

1. **"Google Sign-In failed"**: Check that your OAuth 2.0 client IDs are correctly configured
2. **"Firebase initialization failed"**: Verify your `google-services.json` and `GoogleService-Info.plist` files
3. **"Package name mismatch"**: Ensure the package name in Firebase matches your app's package name

### Debug Steps

1. Check Firebase Console for authentication logs
2. Verify SHA-1 fingerprint for Android (run `keytool -list -v -keystore ~/.android/debug.keystore`)
3. Ensure all configuration files are in the correct locations
4. Check that Google Sign-In is enabled in Firebase Console

## Next Steps

- Add more authentication providers (Facebook, Apple, etc.)
- Implement user profile management
- Add data persistence with Firestore
- Implement push notifications
- Add more UI screens and navigation

