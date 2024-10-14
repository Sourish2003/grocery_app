import 'package:flutter/material.dart';
import 'package:grocery_app/utils/utils.dart';
import 'package:grocery_app/screens/signup_screen.dart';
import 'package:grocery_app/services/auth_methods.dart';

import '../styles/styles.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailIdController.dispose();
    _passwordController.dispose();
  }

  void _logInUser() async {
    // if (_emailIdController.text.isEmpty) {
    //   showSnackBar('Please enter your email or username.', context);
    // } else if (_passwordController.text.isEmpty) {
    //   showSnackBar('Please enter your password.', context);
    // } else {
    //   setState(() {
    //     _isLoading = true;
    //   });
    //
    //   try {
    //     String result = await AuthMethods().logInUser(
    //       email: _emailIdController.text,
    //       password: _passwordController.text,
    //     );
    //
    //     if (result == 'success') {
    //       // Successful login, navigate to home screen
    //       Navigator.pushReplacementNamed(context, HomeScreen.id);
    //     } else {
    //       showSnackBar('Invalid email or password.', context);
    //     }
    //   } catch (e) {
    //     showSnackBar('An error occurred. Please try again.', context);
    //   } finally {
    //     setState(() {
    //       _isLoading = false;
    //     });
    //   }
    // }
    Navigator.pushReplacementNamed(context, HomeScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomBar(),
      body: _body(),
    );
  }

  Widget _userIDEditContainer() {
    return Container(
      child: TextField(
        controller: _emailIdController,
        decoration: const InputDecoration(
          hintText: 'Email or username',
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          isDense: true,
        ),
        style: Styles.textStyleBlack,
      ),
    );
  }

  Widget _passwordEditContainer() {
    return Container(
      padding: const EdgeInsets.only(top: 5.0),
      child: TextField(
        controller: _passwordController,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Password',
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          isDense: true,
        ),
        style: Styles.textStyleBlack,
      ),
    );
  }

  Widget _loginContainer() {
    return GestureDetector(
      onTap: _logInUser,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 10.0),
        width: 500.0,
        height: 40.0,
        color: Colors.blue,
        child: _isLoading
            ? const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        )
            : const Text(
          'Log In',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _bottomBar() {
    return Container(
      alignment: Alignment.center,
      height: 49.5,
      child: Column(
        children: <Widget>[
          Container(
            height: 1.0,
            color: Colors.grey.withOpacity(0.7),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Don\'t have an account?',
                  style: Styles.textStyleGrey,
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, SignupScreen.id),
                  child: const Text(
                    'Sign Up.',
                    style: Styles.textStyleGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 25.0, bottom: 15.0),
            child: Text(
              'Grocery App',
              style: TextStyle(fontFamily: 'Billabong', fontSize: 50.0),
            ),
          ),
          _userIDEditContainer(),
          _passwordEditContainer(),
          _loginContainer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Forgot your login details?',
                style: Styles.textStyleGrey,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Get help logging in.',
                  style: Styles.textStyleBlueGrey,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}