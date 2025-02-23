import 'package:infinityCRM/index.dart';

class ResetPassword extends StatefulWidget {
  static const String routeName = '/ResetPassword';

  final bool isCreatingPassword;

  const ResetPassword({
    super.key,
    this.isCreatingPassword = false, // Default to false for reset password flow
  });

  @override
  State<StatefulWidget> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final dpiScale = devicePixelRatio / 2.5;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: const Color(0xfffcfcfc),
      appBar: CustomAppBarProgress(
        title: 'Reset password',
        onBackPress: () => Navigator.pop(context),
        primaryColor: const Color(0xff4902b4),
        isCreatingPassword: false, // Set to true when you want to show progress bar
        currentStep: 2, // Only needed when isCreatingPassword is true
        totalSteps: 4,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.06,
                  vertical: screenHeight * 0.1,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    SizedBox(height: screenHeight * 0.03),
                    CustomInputField(
                      title: 'Confirm New Password',
                      hintText: 'Confirm your new password',
                      icon: Icons.lock_outline,
                      showEyeIcon: true,
                      isPasswordField: true,
                      onEyePressed: () {
                        setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible);
                      },
                      obscureText: !_isConfirmPasswordVisible,
                    ),
                  ],
                ),
              ),
            ),
            // Fixed bottom button
            Padding(
              padding: EdgeInsets.only(
                bottom: screenHeight * 0.02, // Margin from the bottom
                left: screenWidth * 0.06,
                right: screenWidth * 0.06,
              ),
              child: CustomButton(
                label: 'Enregistrer',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                isSmallScreen: isSmallScreen,
                dpiScale: dpiScale,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
