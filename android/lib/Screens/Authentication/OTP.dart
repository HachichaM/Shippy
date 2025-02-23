import 'package:infinityCRM/index.dart';


class OTP extends StatefulWidget {
  final String sceneType; // 'creation' or 'reset'
  static const String routeName = '/OTP';


  OTP({super.key, required this.sceneType});

  @override
  State<StatefulWidget> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  late final Color primaryColor= const Color(0xff4902b4);
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> _controllers =
  List.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _handleInputChange(int index, String value) {
    if (value.isNotEmpty && index < _controllers.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final String title = widget.sceneType == 'creation'
        ? 'Enter le code de confirmation'
        : 'Réinitialiser votre mot de passe';
    final String description = widget.sceneType == 'creation'
        ? 'A 4-digit code was sent to\nlucasscott3@email.com'
        : 'A code was sent to reset your password.\nCheck your email.';

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    // Scale factor for DPI
    final dpiScale = devicePixelRatio / 2.5;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: const Color(0xfffcfcfc),
      appBar: CustomAppBarProgress(
        title: "Code de confirmation",
        onBackPress: () => Navigator.pop(context),
        primaryColor: primaryColor,  // Or your theme color
        isCreatingPassword: false, // Total number of steps
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.05), // Adjust the value to push down the elements
          child: Column(
            children: [
              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ModernProgressIndicator(
                        currentStep: 4, // Replace with dynamic value if needed
                        totalSteps: 6, // Replace with dynamic value if needed
                        primaryColor: AppThemePost.primaryColor, // Customize to your theme
                      ),
                      SizedBox(height: screenHeight * 0.1),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenHeight * 0.02,
                          color: const Color(0xff71727a),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.06),
                      // Code Input Fields
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.04),
                            child: SizedBox(
                              width: screenWidth * 0.12,
                              height: screenHeight * 0.1,
                              child: TextField(
                                controller: _controllers[index],
                                focusNode: _focusNodes[index],
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                style: TextStyle(
                                  fontSize: screenHeight * 0.03,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  color: primaryColor,
                                ),
                                decoration: InputDecoration(
                                  counterText: '',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        screenWidth * 0.03),
                                    borderSide: const BorderSide(
                                        color: Color(0xffc5c6cc)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        screenWidth * 0.03),
                                    borderSide: const BorderSide(
                                        color: Color(0xff4902b4)),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                onChanged: (value) =>
                                    _handleInputChange(index, value),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.06,
                  vertical: screenHeight * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Resend Code Button
                    CustomOutlineButton(
                      label: 'Renvoyer le code de vérification',
                      onPressed: () {},
                      isSmallScreen: isSmallScreen,
                      dpiScale: dpiScale,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    // Suivant Button
                    CustomButton(
                      label: 'Suivant',
                      onPressed: () {
                        // Logic to handle the button press
                        print(
                            'Code entered: ${_controllers.map((c) => c.text).join()}');
                        if (widget.sceneType != "reset") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResetPassword(),
                            ),
                          );
                        }
                      },
                      isSmallScreen: isSmallScreen,
                      dpiScale: dpiScale,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
