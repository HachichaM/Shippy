import 'package:infinityCRM/index.dart';

class Register extends StatefulWidget {
  static const String routeName = '/Register';


  Register({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isTermsAccepted = false; // State to track checkbox status
  bool isPasswordVisible = false; // State to toggle password visibility
  bool isConfirmPasswordVisible = false; // State for confirm password visibility
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    // Dynamic description based on user type
    String description = 'Remplir vos information pour commencer';

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    // DPI scaling factor
    final dpiScale = devicePixelRatio / 2.5;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: const Color(0xfffcfcfc),
      appBar: CustomAppBarProgress(
        title: 'Ajouter vos informations',
        onBackPress: () => Navigator.pop(context),
        primaryColor: const Color(0xff4902b4),
        isCreatingPassword: false,  // Set to true when you want to show progress bar
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(screenWidth * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    ModernProgressIndicator(
                      currentStep: 3, // Replace with dynamic value if needed
                      totalSteps: 6, // Replace with dynamic value if needed
                      primaryColor: AppThemePost.primaryColor, // Customize to your theme
                    ),
                    SizedBox(height: screenHeight * 0.03),


                    // Dynamic Description
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: screenHeight * 0.02, // Scaled font size
                        color: const Color(0xff71727a),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    // Form Fields
                    CustomInputField(
                      title: 'Prénom',
                      hintText: 'Enter your name',
                      icon: Icons.person,
                      isPasswordField: false,
                    ),
                    SizedBox(height: screenHeight * 0.04),

                    CustomInputField(
                      title: 'Prénom',
                      hintText: 'Enter your name',
                      icon: Icons.person,
                      isPasswordField: false,
                    ),

                    SizedBox(height: screenHeight * 0.04),
                    CustomInputField(
                      title: 'Email',
                      hintText: 'Enter your email',
                      icon: Icons.alternate_email_outlined,
                      isPasswordField: false,
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    CustomInputField(
                      title: 'Numéro de téléphone',
                      hintText: 'Enter your phone number',
                      icon: Icons.phone,
                      isPasswordField: false,
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    CustomInputField(
                      title: 'New Password',
                      hintText: 'Enter your new password',
                      icon: Icons.lock_outline,
                      showEyeIcon: true,
                      isPasswordField: true,
                      onEyePressed: () {
                        setState(() => _isPasswordVisible = !_isPasswordVisible);
                      },
                      obscureText: !_isPasswordVisible,
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    CustomInputField(
                      title: 'Confirm New Password',
                      hintText: 'Confirm your new password',
                      icon: Icons.lock_outline,
                      showEyeIcon: true,
                      isPasswordField: true,
                      onEyePressed: () {
                        setState(() => _isPasswordVisible = !_isPasswordVisible);
                      },
                      obscureText: !_isPasswordVisible,
                    ),

                    SizedBox(height: screenHeight * 0.04),

                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              ),
            ),
            // Fixed Suivant Button
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white, // White background for the button area
                width: double.infinity, // Full width
                padding: const EdgeInsets.all(20), // Padding around the button
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Ensures the content takes minimum space
                  children: [
                    TermsAndConditions(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                    isTermsAccepted: isTermsAccepted,
                    onToggle: () {
                    setState(() {
                    isTermsAccepted = !isTermsAccepted;
                    }
                    );
                      }
                    ),
                    const SizedBox(height: 16), // Spacing between terms and the button
                    CustomButton(
                      label: 'Suivant',
                      onPressed: () {
                        if (!isTermsAccepted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Please accept the Terms and Conditions to proceed.",
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WelcomeScreen()),
                          );
                        }
                      },
                      isSmallScreen: isSmallScreen,
                      dpiScale: dpiScale,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
