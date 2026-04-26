class UserErrorHandler {
  static String errorMessage(String error) {
    if (error.contains("Duplicate entry")) {
      return "The Email or Phone you entered is already registered";
    }
    if (error.toLowerCase().contains("invalid email") || error.toLowerCase().contains("invalid password")) {
      return error; // Return the original authentication error message
    }
    return "An error occurred. Please try again.";
  }
}