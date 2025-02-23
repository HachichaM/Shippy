import 'package:infinityCRM/index.dart';
import 'package:lucide_icons/lucide_icons.dart';

class Login extends StatefulWidget {
  static const String routeName = '/Login';

  const Login({super.key});

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isPasswordVisible = false;
  bool _stayLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final dpiScale = devicePixelRatio / 2.5;
    final isSmallScreen = screenWidth < 600;


    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Section
          Container(
            height: screenHeight * 0.35,
            decoration: BoxDecoration(
              color: const Color(0xff4902b4),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff4902b4).withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 30 * dpiScale,
                  top: 80 * dpiScale,
                  child: Text(
                    'Se\nconnecter',
                    style: TextStyle(
                      fontSize: 40 * dpiScale,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                    ),
                  ),
                ),
                Positioned(
                  right: 30 * dpiScale,
                  top: 80 * dpiScale,
                  child: Image.asset(
                    'assets/images/y_white.png',
                    width: 80 * dpiScale,
                    height: 80 * dpiScale,
                  ),
                ),
              ],
            ),
          ),

          // Main Content Section
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.only(top: screenHeight * 0.3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              padding: EdgeInsets.fromLTRB(
                24 * dpiScale,
                40 * dpiScale,
                24 * dpiScale,
                30 * dpiScale,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInputField(
                    title: 'Email',
                    hintText: 'Enter your email',
                    icon: Icons.email_outlined,
                    showEyeIcon: false,
                  ),
                  SizedBox(height: 24),
                  CustomInputField(
                    title: 'Password',
                    hintText: 'Enter your password',
                    icon: Icons.lock_outline,
                    showEyeIcon: true,
                    isPasswordField: true,
                    onEyePressed: () {
                      setState(() => _isPasswordVisible = !_isPasswordVisible);
                    },
                    obscureText: !_isPasswordVisible,
                  ),

                  SizedBox(height: 16 * dpiScale),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() => _stayLoggedIn = !_stayLoggedIn);
                        },
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: 20 * dpiScale,
                              height: 20 * dpiScale,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: const Color(0xff4902b4),
                                  width: 2,
                                ),
                                color: _stayLoggedIn
                                    ? const Color(0xff4902b4)
                                    : Colors.transparent,
                              ),
                              child: _stayLoggedIn
                                  ? Icon(
                                Icons.check,
                                size: 16 * dpiScale,
                                color: Colors.white,
                              )
                                  : null,
                            ),
                            SizedBox(width: 8 * dpiScale),
                            Text(
                              'Stay logged in',
                              style: TextStyle(
                                fontSize: 14 * dpiScale,
                                color: const Color(0xff6f6f6f),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 14 * dpiScale,
                            color: const Color(0xff4902b4),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16 * dpiScale),

                  CustomButton(
                    label: 'Se connecter',
                    onPressed: () {
                    },
                    isSmallScreen: isSmallScreen,
                    dpiScale: dpiScale,
                  ),
                  SizedBox(height: 30 * dpiScale),

                  // Social Media Login Section
                  Center(
                    child : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16 * dpiScale),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(
                            fontSize: 14 * dpiScale,
                            color: const Color(0xff6f6f6f),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                  ),
                  SizedBox(height: 30 * dpiScale),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton(
                        'assets/images/facebook.png',
                            () => print("Facebook login"),
                        dpiScale,
                      ),
                      SizedBox(width: 20 * dpiScale),
                      _buildSocialButton(
                        'assets/images/google.png',
                            () => print("Google login"),
                        dpiScale,
                      ),
                      SizedBox(width: 20 * dpiScale),
                      _buildSocialButton(
                        'assets/images/apple.png',
                            () => print("Apple login"),
                        dpiScale,
                      ),
                    ],
                  ),
                  SizedBox(height: 30 * dpiScale),

                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account yet? ",
                        style: TextStyle(
                          fontSize: 14 * dpiScale,
                          color: Colors.black87,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: 'Register here',
                            style: TextStyle(
                              fontSize: 14 * dpiScale,
                              color: const Color(0xff4902b4),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WelcomeScreen(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30 * dpiScale),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(String imagePath, VoidCallback onTap, double dpiScale) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48 * dpiScale,
        height: 48 * dpiScale,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: EdgeInsets.all(12 * dpiScale),
        child: Image.asset(
          imagePath,
          width: 24 * dpiScale,
          height: 24 * dpiScale,
        ),
      ),
    );
  }
}
