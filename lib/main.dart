import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  try {
    await dotenv.load();
    if (kDebugMode) {
      debugPrint('Environment variables loaded successfully');
    }
  } catch (e) {
    if (kDebugMode) {
      debugPrint('Error loading .env file: $e');
      debugPrint('Please make sure .env file exists in the project root.');
      debugPrint('Copy .env.example to .env and update with your credentials.');
    }
  }

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Login Firebase',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF667eea)),
        useMaterial3: true,
      ),
      home: const AuthWrapper(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (kDebugMode) {
          debugPrint(
            'AuthWrapper - Connection state: ${snapshot.connectionState}',
          );
          debugPrint('AuthWrapper - Has data: ${snapshot.hasData}');
          debugPrint('AuthWrapper - User: ${snapshot.data?.uid}');
        }

        // Show loading indicator while checking auth state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // If user is signed in, show home page
        if (snapshot.hasData) {
          if (kDebugMode) {
            debugPrint('AuthWrapper - Navigating to HomePage');
          }
          return const HomePage();
        }

        // If user is not signed in, show login page
        if (kDebugMode) {
          debugPrint('AuthWrapper - Navigating to LoginPage');
        }
        return const LoginPage();
      },
    );
  }
}
