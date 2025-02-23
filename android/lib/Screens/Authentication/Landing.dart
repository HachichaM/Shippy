import 'package:infinityCRM/index.dart';
import 'dart:math' as math;


class WelcomeScreen extends StatefulWidget {
  static const String routeName = '/Welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.2, 0.7, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        double maxHeight = constraints.maxHeight;
        double fem = maxWidth / 393;
        double femHeight = maxHeight / 812;

        // Calculate isSmallScreen based on width
        bool isSmallScreen = maxWidth < 600;
        double dpiScale = MediaQuery.of(context).devicePixelRatio;

        // Smaller logo size
        double logoSize = math.min(100 * fem, maxWidth * 0.2);

        return Scaffold(
          body: Stack(
            children: [
              // Background Image with Overlay
              Container(
                width: maxWidth,
                height: maxHeight,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/landingBanner.jpg',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF00B1B1).withOpacity(0.7),
                            Color(0xFF00B1B1).withOpacity(0.85),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Language Selector
              Positioned(
                top: MediaQuery.of(context).padding.top + 10,
                right: 20 * fem,
                child: LanguageSelector(
                  isSmallScreen: isSmallScreen,
                  dpiScale: dpiScale,
                  onLanguageChanged: (String language) {
                    // Handle language change here
                  },
                ),
              ),

              // Content Layout
              Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo and Text Group
                        SlideTransition(
                          position: _slideAnimation,
                          child: FadeTransition(
                            opacity: _fadeAnimation,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20 * fem,
                                vertical: 30 * femHeight,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Logo above text
                                  Container(
                                    width: logoSize,
                                    height: logoSize,
                                    margin: EdgeInsets.only(bottom: 20 * femHeight),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/logo.png'),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'WorkWay',
                                    style: GoogleFonts.poppins(
                                      fontSize: 32 * fem,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 8 * femHeight),
                                  Text(
                                    'الخدمة عليك و ثنيتك علينا',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.tajawal(
                                      fontSize: 18 * fem,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      height: 1.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Bottom Navigation with Buttons
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30 * fem),
                        topRight: Radius.circular(30 * fem),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15,
                          offset: Offset(0, -5),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.fromLTRB(20 * fem, 25 * femHeight, 20 * fem, 20 * femHeight),
                    child: SafeArea(
                      top: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildButton(
                            'Create an account',
                            false,
                                () => Navigator.pushNamed(context, '/signUp'),
                            fem,
                            femHeight,
                          ),
                          SizedBox(height: 12 * femHeight),
                          _buildButton(
                            'Login',
                            true,
                                () => Navigator.pushNamed(context, '/signIn'),
                            fem,
                            femHeight,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildButton(String text, bool isPrimary, VoidCallback onTap, double fem, double femHeight) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16 * femHeight),
          decoration: BoxDecoration(
            color: isPrimary ? Color(0xFF00B1B1) : Colors.transparent,
            border: Border.all(
              color: Color(0xFF00B1B1),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(24 * fem),
            boxShadow: isPrimary
                ? [
              BoxShadow(
                color: Color(0xFF00B1B1).withOpacity(0.2),
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ]
                : null,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 16 * fem,
              color: isPrimary ? Colors.white : Color(0xFF00B1B1),
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}


class LanguageSelector extends StatelessWidget {
  final bool isSmallScreen;
  final double dpiScale;
  final Function(String) onLanguageChanged;

  const LanguageSelector({
    Key? key,
    required this.isSmallScreen,
    required this.dpiScale,
    required this.onLanguageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Positioned(
      right: 16,
      top: screenHeight * 0.08,
      child: PopupMenuButton<String>(
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child : Image.asset(
                  'assets/images/flags/Flag_of_Tunisia.png',
                  width: isSmallScreen ? 25 : 35 * dpiScale,
                  height: isSmallScreen ? 15 : 25 * dpiScale,
                ),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(24),

                ),
              ),

              const SizedBox(width: 4),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onSelected: onLanguageChanged,
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: 'en',
            child: Row(
              children: [
                Image.asset(
                  'assets/images/flags/Flag_of_the_United_Kingdom.jpg',
                  width: isSmallScreen ? 25 : 35 * dpiScale,
                  height: isSmallScreen ? 15 : 25 * dpiScale,
                ),
                const SizedBox(width: 8),
                Text(
                  'English',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: isSmallScreen ? 14 : 16,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'fr',
            child: Row(
              children: [
                Image.asset(
                  'assets/images/flags/Flag_of_France.png',
                  width: isSmallScreen ? 25 : 35 * dpiScale,
                  height: isSmallScreen ? 15 : 25 * dpiScale,
                ),
                const SizedBox(width: 8),
                Text(
                  'Français',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: isSmallScreen ? 14 : 16,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'ar',
            child: Row(
              children: [
                Image.asset(
                  'assets/images/flags/Flag_of_Tunisia.png',
                  width: isSmallScreen ? 25 : 35 * dpiScale,
                  height: isSmallScreen ? 15 : 25 * dpiScale,
                ),
                const SizedBox(width: 8),
                Text(
                  'العربية',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: isSmallScreen ? 14 : 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}