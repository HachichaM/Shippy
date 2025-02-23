import 'package:infinityCRM/index.dart';


class ForgotPassword extends StatefulWidget {
  static const String routeName = '/ForgotPassword';

  ForgotPassword({super.key});

  @override
  State<StatefulWidget> createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  late final Color primaryColor= const Color(0xff4902b4);
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final dpiScale = devicePixelRatio / 2.5;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarProgress(
        title: "Mot de passe oublié",
        onBackPress: () => Navigator.pop(context),
        primaryColor: primaryColor,  // Or your theme color
        isCreatingPassword: false, // Total number of steps
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Return Button
                SizedBox(height: screenHeight * 0.03),
                // Header Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Title
                      SizedBox(height: screenHeight * 0.03),
                      // Description
                      Text(
                        'Enter your email address and we will share a link to create a new password.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: const Color(0xff4b4b4b),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,

                        ),
                      ),
                      SizedBox(height: screenHeight * 0.07),
                      // Email Input Field
                      CustomInputField(
                        title: 'Email',
                        hintText: 'Enter your email',
                        icon: Icons.alternate_email,
                        isPasswordField: false,
                      ),

                    ],
                  ),
                ),
                Spacer(),
                // Send Button Section
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0), // Horizontal margin
                  child: CustomButton(
                    label: 'Envoyer',
                    icon: Icon(Icons.send, color: Colors.white), // Pass the icon here
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTP(sceneType: "reset"),
                        ),
                      );
                    },
                    isSmallScreen: isSmallScreen,
                    dpiScale: dpiScale,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
