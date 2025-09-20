# Google Login Firebase Flutter App

A Flutter application with Google Sign-In authentication using Firebase.

## Features

- ✅ Google Sign-In with Firebase Authentication
- ✅ Beautiful login and home pages
- ✅ Environment variable configuration
- ✅ Secure credential management
- ✅ Cross-platform support (Android & iOS)

## Setup Instructions

### 1. Clone the Repository

```bash
git clone <your-repo-url>
cd google_login_firebase
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Environment Configuration

1. Copy the example environment file:

   ```bash
   cp .env.example .env
   ```

2. Update `.env` with your Firebase project credentials:

   ```env
   # Google Sign-In Configuration
   GOOGLE_CLIENT_ID=your_google_client_id_here

   # Firebase Configuration
   FIREBASE_PROJECT_ID=your_firebase_project_id
   FIREBASE_API_KEY_ANDROID=your_android_api_key
   FIREBASE_API_KEY_IOS=your_ios_api_key
   ```

### 4. Firebase Setup

1. Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
2. Add Android and iOS apps to your project
3. Download configuration files:
   - `google-services.json` → `android/app/`
   - `GoogleService-Info.plist` → `ios/Runner/`
4. Enable Google Sign-In in Firebase Authentication
5. Add your SHA-1 fingerprint to Firebase project

### 5. Google Cloud Console Setup

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Select your Firebase project
3. Go to APIs & Services > Credentials
4. Create OAuth 2.0 Client IDs for Android and iOS
5. Update the `GOOGLE_CLIENT_ID` in your `.env` file

### 6. Run the App

```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── config/
│   └── app_config.dart      # Environment configuration
├── services/
│   └── auth_service.dart    # Google Sign-In service
└── pages/
    ├── login_page.dart      # Login page UI
    └── home_page.dart       # Home page UI
```

## Environment Variables

| Variable                   | Description                | Required |
| -------------------------- | -------------------------- | -------- |
| `GOOGLE_CLIENT_ID`         | Google OAuth 2.0 Client ID | Yes      |
| `FIREBASE_PROJECT_ID`      | Firebase Project ID        | Yes      |
| `FIREBASE_API_KEY_ANDROID` | Firebase Android API Key   | Yes      |
| `FIREBASE_API_KEY_IOS`     | Firebase iOS API Key       | Yes      |

## Security Notes

- **Never commit `.env` file to version control** - it contains sensitive credentials
- The `.env` file is already added to `.gitignore`
- Use `.env.example` as a template for other developers
- Keep your Firebase configuration files secure
- **No hardcoded credentials** - all sensitive data is loaded from environment variables
- If you see an error about missing environment variables, make sure your `.env` file exists and contains all required values

## Dependencies

- `firebase_core: ^3.6.0` - Firebase core functionality
- `firebase_auth: ^5.3.1` - Firebase authentication
- `google_sign_in: ^7.2.0` - Google Sign-In
- `flutter_dotenv: ^5.1.0` - Environment variable management

## Troubleshooting

### Common Issues

1. **"ApiException: 10"** - Check SHA-1 fingerprint configuration
2. **"Invalid credential"** - Verify OAuth client ID configuration
3. **"ID token is null"** - Check Google Sign-In setup in Firebase

### Debug Steps

1. Check Firebase Console for authentication logs
2. Verify SHA-1 fingerprint: `keytool -list -v -keystore ~/.android/debug.keystore`
3. Ensure all configuration files are in correct locations
4. Verify environment variables are loaded correctly

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License.
