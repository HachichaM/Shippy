import 'package:infinityCRM/index.dart';


// --------------------------- SIGN-UP PAGE --------------------------- //
// --------------------------- LOGIN PAGE --------------------------- //

// --------------------------- SIGN-UP PAGE --------------------------- //
class SignUpPage extends StatelessWidget {
  static const String routeName = '/SignUpPage';

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  backgroundColor: Colors.grey.shade100,
  body: Center(
  child: SingleChildScrollView(
  child: Padding(
  padding: const EdgeInsets.all(20.0),
  child: _buildFormCard(
  context: context,
  title: "Create an Account",
  subtitle: "Start managing your CRM today",
  buttonText: "Sign Up",
  additionalText: "Already have an account? Log in",
  additionalTextCallback: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  },
  formFields: [
  _buildInputField(
  label: "Full Name",
  hintText: "Enter your full name",
  icon: Icons.person_outline,
  isPassword: false,
  ),
  _buildInputField(
  label: "Email Address",
  hintText: "Enter your email",
  icon: Icons.email_outlined,
  isPassword: false,
  ),
  _buildInputField(
  label: "Password",
  hintText: "Create a password",
  icon: Icons.lock_outline,
  isPassword: true,
  ),
  _buildInputField(
  label: "Confirm Password",
  hintText: "Re-enter your password",
  icon: Icons.lock_outline,
  isPassword: true,
  ),
  ],
  onSubmit: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  // Handle Sign-Up
  },
  ),
  ),
  ),
  ),
  );
  }
  }

// --------------------------- FORM CARD DESIGN --------------------------- //
  Widget _buildFormCard({
  required BuildContext context,
  required String title,
  required String subtitle,
  required String buttonText,
  required List<Widget> formFields,
  required VoidCallback onSubmit,
  required String additionalText,
  required VoidCallback additionalTextCallback,
  }) {
  return Container(
  padding: const EdgeInsets.all(30),
  constraints: BoxConstraints(maxWidth: 400),
  decoration: BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(20),
  boxShadow: [
  BoxShadow(
  color: Colors.black.withOpacity(0.05),
  blurRadius: 15,
  offset: Offset(0, 10),
  ),
  ],
  ),
  child: Column(
  mainAxisSize: MainAxisSize.min,
  children: [
  // Title
  Text(
  title,
  textAlign: TextAlign.center,
  style: GoogleFonts.lexend(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.grey.shade800,
  ),
  ),
  const SizedBox(height: 10),

  // Subtitle
  Text(
  subtitle,
  textAlign: TextAlign.center,
  style: GoogleFonts.lexend(
  fontSize: 14,
  color: Colors.grey.shade600,
  ),
  ),
  const SizedBox(height: 30),

  // Form Fields
  Column(children: formFields),
  const SizedBox(height: 30),

  // Call-to-Action Button
  SizedBox(
  width: double.infinity,
  child: ElevatedButton(
  onPressed: onSubmit,
  style: ElevatedButton.styleFrom(
  backgroundColor: Colors.blueAccent,
  foregroundColor: Colors.white,
  padding: const EdgeInsets.symmetric(vertical: 15),
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(30),
  ),
  ),
  child: Text(
  buttonText,
  style: GoogleFonts.lexend(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  ),
  ),
  ),
  ),
  const SizedBox(height: 20),

  // Additional Action Text
  GestureDetector(
  onTap: additionalTextCallback,
  child: Text(
  additionalText,
  textAlign: TextAlign.center,
  style: GoogleFonts.lexend(
  fontSize: 14,
  color: Colors.blueAccent,
  decoration: TextDecoration.underline,
  ),
  ),
  ),
  ],
  ),
  );
  }

// --------------------------- INPUT FIELD DESIGN --------------------------- //
  Widget _buildInputField({
  required String label,
  required String hintText,
  required IconData icon,
  required bool isPassword,
  }) {
  return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Text(
  label,
  style: GoogleFonts.lexend(
  fontSize: 14,
  color: Colors.grey.shade800,
  ),
  ),
  const SizedBox(height: 5),
  TextField(
  obscureText: isPassword,
  style: GoogleFonts.lexend(color: Colors.grey.shade800),
  decoration: InputDecoration(
  hintText: hintText,
  hintStyle: GoogleFonts.lexend(color: Colors.grey.shade400),
  prefixIcon: Icon(icon, color: Colors.blueAccent),
  filled: true,
  fillColor: Colors.grey.shade100,
  contentPadding:
  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(30),
  borderSide: BorderSide.none,
  ),
  ),
  ),
  const SizedBox(height: 20),
  ],
  );
  }
