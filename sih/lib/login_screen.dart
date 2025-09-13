import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatelessWidget {
  // Replace with your Google Web Client ID from Google Cloud Console
  static const String googleWebClientId =
      '894931530922-nj2979m2ijtn1ja4v7n5ip0q242kcq9l.apps.googleusercontent.com';

  void handleGoogleSignIn(BuildContext context) async {
    final supabase = Supabase.instance.client;

    final googleSignIn = GoogleSignIn(
      scopes: ['email', 'profile'],
      serverClientId: googleWebClientId,
    );

    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        // User cancelled the sign-in
        return;
      }

      final googleAuth = await googleUser.authentication;

      final idToken = googleAuth.idToken;
      final accessToken = googleAuth.accessToken;

      if (idToken == null || accessToken == null) {
        throw Exception('Missing Google ID Token or Access Token');
      }

      final res = await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      if (res.session != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        throw Exception('Sign-in failed');
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Google sign-in failed: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/login_bg.png', // Background image path
            fit: BoxFit.cover,
          ),
          Container(color: Colors.teal.withOpacity(0.55)),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spacer(),
                  Text(
                    'INTVL',
                    style: TextStyle(
                      fontFamily: 'LogoFont',
                      fontSize: 56,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 4,
                      shadows: [
                        Shadow(
                          blurRadius: 6,
                          color: Colors.white54,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 35),
                  SizedBox(
                    width: 280,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 13),
                      ),
                      icon: Image.asset('assets/google_icon.png', height: 22),
                      label: Text(
                        'Sign in using Google',
                        style: TextStyle(
                          fontFamily: 'GameFont',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      // onPressed: () => handleGoogleSignIn(context),
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/home'),
                    ),
                  ),
                  SizedBox(height: 32),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to sign up page if implemented
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      // Navigate to forgot password page if implemented
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
