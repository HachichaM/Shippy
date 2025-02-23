import 'package:infinityCRM/index.dart';

class PageResetSuccess extends StatefulWidget {
  static const String routeName = '/ResetPassword';

  PageResetSuccess({super.key});

  @override
  State<StatefulWidget> createState() => _PageResetSuccess();
}

class _PageResetSuccess extends State<PageResetSuccess> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xfffcfcfc),
      body: SafeArea(
        child: Stack(
          children: [
            // Main Content
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.06,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Back Button
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.02),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Go back to the previous page
                        },
                        child: Image.asset(
                          'assets/images/image_936642.png',
                          width: screenWidth * 0.06,
                          height: screenWidth * 0.06,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.2),
                  // Title and Description
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Password reset\nsuccessful!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.06,
                            color: const Color(0xff4902b4),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,

                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        Text(
                          'You can now login with your new password.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            color: const Color(0xff4b4b4b),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,

                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Proceed Button at the Bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.06,
                  vertical: screenHeight * 0.02,
                ),
                color: Colors.white,
                child: ElevatedButton(
                  onPressed: () {
                    // Add navigation or action for proceed
                    print('Proceed button clicked');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff4902b4),
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    ),
                  ),
                  child: Text(
                    'Proceed',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,

                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
