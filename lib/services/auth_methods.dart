class AuthMethods {
  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
    required String username,
  }) async {
    // Implement your custom signup logic here
    // For example, you could store user data locally using SharedPreferences or a database
    // Return 'success' if signup is successful, or an error message otherwise
    return 'success'; // Replace with your actual signup logic
  }

  Future<String> logInUser({
    required String email,
    required String password,
  }) async {
    // Implement your custom login logic here
    // For example, you could check if the provided email and password match stored credentials
    // Return 'success' if login is successful, or an error message otherwise
    return 'success'; // Replace with your actual login logic
  }
}