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
  final bool _isLoading = false;

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
      body: _body(),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _userIDEditContainer() {
    return Container(
      child: TextField(
        controller: _emailIdController,
        decoration: const InputDecoration(
          hintText: 'Email',
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
        color: const Color(0xFF006161),
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
              'Register',
              style: Styles.textStyleGrey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return Container(
      alignment: Alignment.center,
      // padding: const EdgeInsets.all(25.0),
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Image.asset(
            'lib/assets/login_background.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),


          const Positioned(
            bottom: 700,
            left: 100,
            right: 100,
            child: Padding(
              padding: EdgeInsets.only(top: 25.0, bottom: 15.0),
              child: Text(
                '!DealMart',
                style: TextStyle(fontFamily: 'Billabong', fontSize: 50.0, color: Colors.green),
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: MediaQuery.of(context).size.height * 0.50,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),

                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      _userIDEditContainer(),
                      _passwordEditContainer(),
                      _loginContainer(),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}