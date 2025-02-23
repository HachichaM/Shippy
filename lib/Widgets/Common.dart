import 'package:infinityCRM/index.dart';
import 'dart:math' as math;



class AppThemePost {
  static const primaryColor = Color(0xFF4902B4); // Matching the purple primary color
  static const secondaryColor = Color(0xFFFCFCFC); // Matching the light background
  static const backgroundColor = Color(0xFFF5F6FA); // Slightly off-white for background

  static final titleStyle = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: Color(0xFF1F2024), // Dark text color from the theme
    letterSpacing: -0.5,
  );

  static final subtitleStyle = GoogleFonts.poppins(
    fontSize: 16,
    color: Color(0xFFADADAD), // Subtle gray for subtitles
    letterSpacing: 0.1,
  );
}


class CustomInputField extends StatelessWidget {
  final String title;
  final String hintText;
  final IconData icon;
  final bool showEyeIcon;
  final bool isPasswordField;
  final VoidCallback? onEyePressed;
  final bool obscureText;

  const CustomInputField({
    Key? key,
    required this.title,
    required this.hintText,
    required this.icon,
    this.showEyeIcon = false,
    this.isPasswordField = false,
    this.onEyePressed,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dpi = MediaQuery.of(context).devicePixelRatio / 2.5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16 * dpi,
            color: const Color(0xff4902b4),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8 * dpi),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey[200]!,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12 * dpi,
                  vertical: 12 * dpi,
                ),
                child: Icon(
                  icon,
                  color: const Color(0xff4902b4),
                  size: 20 * dpi,
                ),
              ),
              Expanded(
                child: TextField(
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(
                      fontSize: 14 * dpi,
                      color: Colors.grey[400],
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12 * dpi,
                    ),
                  ),
                ),
              ),
              if (showEyeIcon)
                IconButton(
                  icon: Icon(
                    obscureText
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: const Color(0xff4902b4),
                    size: 20 * dpi,
                  ),
                  onPressed: onEyePressed,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isSmallScreen;
  final double dpiScale;
  final Icon? icon; // Optional icon attribute

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.isSmallScreen,
    required this.dpiScale,
    this.icon, // Icon is optional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff4902b4),
          padding: EdgeInsets.symmetric(
            vertical: isSmallScreen ? 16 : 16 * dpiScale, // Responsive padding
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24 * dpiScale),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              icon!,
              SizedBox(width: 16 * dpiScale), // Spacing between icon and label
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: 16 * dpiScale,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}


class CustomOutlineButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isSmallScreen;
  final double dpiScale;

  const CustomOutlineButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.isSmallScreen,
    required this.dpiScale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: const Color(0xff4902b4), // Stroke color
            width: 2, // Stroke width
          ),
          padding: EdgeInsets.symmetric(
            vertical: isSmallScreen ? 16 : 16 * dpiScale, // Responsive padding
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24 * dpiScale), // Rounded border
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16 * dpiScale,
            color: const Color(0xff4902b4), // Label color matches stroke
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackPress;
  final Color primaryColor;
  final int notificationCount;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.onBackPress,
    required this.primaryColor,
    this.notificationCount = 0, // Default is 0
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(70); // Adjust height for layout alignment

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2, // Add slight shadow for better visibility
      automaticallyImplyLeading: false, // Prevent default back button
      toolbarHeight: 80, // Adjust the height
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
        child: Row(
          children: [
            // Back Button
            Container(
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.01),
                borderRadius: BorderRadius.circular(24),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, size: 24,),
                color: Colors.black87,
                onPressed: onBackPress,
              ),
            ),
            SizedBox(width: screenWidth * 0.06),
            // Title
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.05,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            // Notification Badge
            if (notificationCount > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '$notificationCount Nouveau',
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.035,
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}


class CustomAppBarProgress extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackPress;
  final Color primaryColor;
  final bool isCreatingPassword;
  final int? currentStep;
  final int? totalSteps;

  const CustomAppBarProgress({
    Key? key,
    required this.title,
    required this.onBackPress,
    required this.primaryColor,
    this.isCreatingPassword = false,
    this.currentStep,
    this.totalSteps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 60, // Adjusted for better alignment
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0), // Slightly increased padding
          child: IconButton(
            icon: Container(
              padding: const EdgeInsets.all(6), // Reduced padding for icon
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12), // Increased border radius for better visuals
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: primaryColor,
                size: 18, // Slightly reduced size for better alignment
              ),
            ),
            onPressed: onBackPress,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 16.0), // Added right padding for better title alignment
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20, // Adjusted font size for better proportionality
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
              letterSpacing: 0.25, // Slightly reduced letter spacing for better readability
            ),
          ),
        ),
        bottom: isCreatingPassword && currentStep != null && totalSteps != null
            ? PreferredSize(
          preferredSize: const Size.fromHeight(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 16), // Consistent vertical padding
            child: ModernProgressIndicator(
              currentStep: currentStep!,
              totalSteps: totalSteps!,
              primaryColor: primaryColor,
            ),
          ),
        )
            : null,
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (isCreatingPassword ? 16 : 0)); // Adjusted dynamically for better spacing
}

class ModernProgressIndicator extends StatefulWidget {
  final int currentStep;
  final int totalSteps;
  final Color primaryColor;

  const ModernProgressIndicator({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
    required this.primaryColor,
  }) : super(key: key);

  @override
  State<ModernProgressIndicator> createState() =>
      _ModernProgressIndicatorState();
}

class _ModernProgressIndicatorState extends State<ModernProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0,
      end: widget.currentStep / widget.totalSteps,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();
  }

  @override
  void didUpdateWidget(ModernProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentStep != widget.currentStep) {
      _animation = Tween<double>(
        begin: oldWidget.currentStep / widget.totalSteps,
        end: widget.currentStep / widget.totalSteps,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ));
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0), // Adjusted padding for better spacing
      child: Container(
        height: 10, // Increased height slightly for better visibility
        decoration: BoxDecoration(
          color: widget.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(24), // Consistent border radius
        ),
        child: Stack(
          children: [
            // Background track
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            // Animated progress
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return FractionallySizedBox(
                  widthFactor: _animation.value,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          widget.primaryColor,
                          widget.primaryColor.withOpacity(0.8),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String time;
  final Color primaryColor;
  final String? badgeText;

  const NotificationItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.time,
    required this.primaryColor,
    this.badgeText,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 4),
            blurRadius: 20,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // Handle notification tap
          },
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [primaryColor, primaryColor.withOpacity(0.8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    size: screenWidth * 0.06,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: screenWidth * 0.04),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.02,
                              vertical: screenWidth * 0.005,
                            ),
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'freelance',
                              style: GoogleFonts.poppins(
                                fontSize: screenWidth * 0.03,
                                color: primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          if (badgeText != null) ...[
                            const Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.02,
                                vertical: screenWidth * 0.01,
                              ),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                badgeText!,
                                style: GoogleFonts.poppins(
                                  fontSize: screenWidth * 0.035,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.008),
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.04,
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        description,
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.035,
                          color: primaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: screenWidth * 0.035,
                            color: primaryColor,
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          Text(
                            time,
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.032,
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.03,
                              vertical: screenWidth * 0.015,
                            ),
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Voir détails',
                                  style: GoogleFonts.poppins(
                                    fontSize: screenWidth * 0.032,
                                    color: primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.01),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: screenWidth * 0.032,
                                  color: primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class BigOptionCard extends StatelessWidget {
  final String title;
  final Icon icon;
  final Color backgroundColor;
  final VoidCallback? onTap;  // Add this for custom tap handling
  final String? routePath;    // Add this for navigation path

  const BigOptionCard({
    required this.title,
    required this.icon,
    required this.backgroundColor,
    this.onTap,
    this.routePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Screen size
    final screenWidth = size.width;

    return GestureDetector(
      onTap: onTap ?? (routePath != null
          ? () => Navigator.pushNamed(context, routePath!)
          : null),
      child: Container(
        width: screenWidth * 0.25,
        height: screenWidth * 0.25,
        decoration: BoxDecoration(
          color: const Color(0xFFEFEFEF),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 4),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black87,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class OptionCard extends StatelessWidget {
  final String title;
  final Icon leadingIcon;
  final Icon trailingIcon;
  final VoidCallback onTap; // Callback for navigation or action

  const OptionCard({
    required this.title,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.onTap, // Pass the onTap callback
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Screen size
    final screenWidth = size.width;

    return GestureDetector(
      onTap: onTap, // Trigger the callback on tap
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.025), // Adjust padding dynamically
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.035,
            vertical: screenWidth * 0.0375,
          ), // Adjust padding dynamically
          decoration: BoxDecoration(
            color: const Color(0xffefefef),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              leadingIcon,
              SizedBox(width: screenWidth * 0.04), // Adjust spacing dynamically
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035, // Adjust font size dynamically
                    color: const Color(0xff000000),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              trailingIcon,
            ],
          ),
        ),
      ),
    );
  }
}

class TermsAndConditions extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final bool isTermsAccepted;
  final VoidCallback onToggle;

  const TermsAndConditions({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.isTermsAccepted,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onToggle, // Trigger the toggle callback
          child: Container(
            width: screenWidth * 0.06,
            height: screenWidth * 0.06,
            decoration: BoxDecoration(
              color: isTermsAccepted ? const Color(0xff4902b4) : Colors.transparent,
              border: Border.all(color: const Color(0xffc5c6cc), width: 0.5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: isTermsAccepted
                ? const Icon(
              Icons.check,
              size: 18,
              color: Colors.white,
            )
                : null,
          ),
        ),
        SizedBox(width: screenWidth * 0.03),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: "I've read and agree with the ",
              style: TextStyle(
                fontSize: screenHeight * 0.018,
                color: const Color(0xff71727a),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
              children: [
                TextSpan(
                  text: 'Terms and Conditions',
                  style: TextStyle(
                    fontSize: screenHeight * 0.018,
                    color: const Color(0xff4902b4),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const TextSpan(
                  text: ' and the ',
                ),
                TextSpan(
                  text: 'Privacy Policy.',
                  style: TextStyle(
                    fontSize: screenHeight * 0.018,
                    color: const Color(0xff4902b4),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class StepsCard extends StatelessWidget {
  final int numberOfSteps;
  final VoidCallback onTap;

  const StepsCard({
    Key? key,
    required this.numberOfSteps, // Dynamic number of steps
    required this.onTap,         // Callback for navigation
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xff6C0FE4),
            const Color(0xff4902b4),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff4902b4).withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.015,
        horizontal: screenWidth * 0.04,
      ),
      child: Row(
        children: [
          // Circle Avatar with Dynamic Number
          CircleAvatar(
            radius: screenWidth * 0.045,
            backgroundColor: Colors.white.withOpacity(0.9),
            child: Text(
              '$numberOfSteps', // Use the dynamic number of steps
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = LinearGradient(
                    colors: [
                      const Color(0xff6C0FE4),
                      const Color(0xff4902b4),
                    ],
                  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.03),
          // Text Content
          Expanded(
            child: GestureDetector(
              onTap: onTap, // Use the onTap callback
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Etape(s) manquantes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Il faut compléter ton profil pour commencer !',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      fontSize: 11,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Arrow Icon
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white.withOpacity(0.85),
            size: screenWidth * 0.04,
          ),
        ],
      ),
    );
  }
}


class ProfileHeader extends StatelessWidget {
  final String displayName;
  final String avatarUrl; // If you have a URL for the image
  final VoidCallback onEditPhoto; // Edit photo callback
  final VoidCallback onEvaluationTap; // New callback for evaluation tap

  const ProfileHeader({
    Key? key,
    required this.displayName,
    required this.avatarUrl, // Blank avatar or URL
    required this.onEditPhoto, // Edit photo callback
    required this.onEvaluationTap, // New callback for evaluation tap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set colors based on userType
    late final Color primaryColor= const Color(0xff4902b4);


    return Row(
      children: [
        GestureDetector(
          onTap: onEditPhoto, // Avatar tap triggers the onEditPhoto callback
          child: CircleAvatar(
            radius: 41, // Adjust size as necessary
            backgroundColor: Colors.grey[300], // Placeholder color for avatar
            child: avatarUrl.isNotEmpty
                ? ClipOval(
              child: Image.network(
                avatarUrl,
                width: 82,
                height: 82,
                fit: BoxFit.cover,
              ),
            )
                : Icon(Icons.person, size: 50, color: Colors.white), // Blank avatar with person icon
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bonjour',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff000000),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '$displayName !',
              style: TextStyle(
                fontSize: 16,
                color: primaryColor, // Dynamic color based on userType
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            GestureDetector(
              onTap: onEvaluationTap, // Use the new callback here
              child: Row(
                children: [
                  const Icon(Icons.star, size: 24, color: Color(0xfff5a623)), // Placeholder for the star icon
                  const SizedBox(width: 10),
                  const Text(
                    'Pas d’évaluations encore',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff6f6f6f),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.arrow_forward_ios, size: 12, color: Color(0xff6f6f6f)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}




const Color primaryColor = Color(0xff6C0FE4);
const Color backgroundColor = Color(0xFFFAFAFA);

class JobCardModel {
  final String organizationName;
  final String positionTitle;
  final String region;
  final String compensation;
  final String employmentType;
  final String jobDetails;
  final String shortDescription; // Short description for the overview section
  final List<String> requiredSkills;
  final String brandLogo;
  final List<Map<String, dynamic>> tasks; // Added tasks field

  JobCardModel({
    required this.organizationName,
    required this.positionTitle,
    required this.region,
    required this.compensation,
    required this.employmentType,
    required this.jobDetails,
    required this.shortDescription,
    required this.requiredSkills,
    required this.brandLogo,
    required this.tasks,
  });
}

class SwipeableJobCard extends StatefulWidget {
  final List<JobCardModel> cards;

  const SwipeableJobCard({
    Key? key,
    required this.cards,
  }) : super(key: key);

  @override
  State<SwipeableJobCard> createState() => _SwipeableJobCardState();
}

class _SwipeableJobCardState extends State<SwipeableJobCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  double _dragOffset = 0;
  int _currentIndex = 0;
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _animationController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _dragOffset += details.delta.dx;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    final velocity = details.velocity.pixelsPerSecond.dx;
    final dragThreshold = MediaQuery.of(context).size.width * 0.4;

    if (_dragOffset.abs() > dragThreshold || velocity.abs() > 800) {
      _animateCard(velocity > 0);
    } else {
      _resetCard();
    }
  }

  void _animateCard(bool right) {
    final screenWidth = MediaQuery.of(context).size.width;
    final endOffset = right ? screenWidth * 1.5 : -screenWidth * 1.5;

    _animationController.duration = const Duration(milliseconds: 100);
    Animation<double> animation = Tween<double>(
      begin: _dragOffset,
      end: endOffset,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    animation.addListener(() {
      setState(() {
        _dragOffset = animation.value;
      });
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % widget.cards.length;
          _dragOffset = 0;
          _selectedTab = 0;
        });
        _animationController.reset();
      }
    });

    _animationController.forward();
  }

  void _resetCard() {
    final animation = Tween<double>(
      begin: _dragOffset,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    animation.addListener(() {
      setState(() {
        _dragOffset = animation.value;
      });
    });

    _animationController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          if (_currentIndex + 1 < widget.cards.length)
            _buildCard(widget.cards[(_currentIndex + 1) % widget.cards.length], true),
          _buildMainCard(widget.cards[_currentIndex]),
        ],
      ),
    );
  }

  Widget _buildMainCard(JobCardModel card) {
    final screenWidth = MediaQuery.of(context).size.width;
    final rotationAngle = _dragOffset / screenWidth * 0.4;
    final opacity = math.max(0.0, 1 - (_dragOffset.abs() / (screenWidth / 2)));

    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Transform.translate(
        offset: Offset(_dragOffset, 0),
        child: Transform.rotate(
          angle: rotationAngle,
          child: Opacity(
            opacity: opacity,
            child: _buildCardContent(card, false),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(JobCardModel card, bool isBackground) {
    return _buildCardContent(card, isBackground);
  }

  Widget _buildCardContent(JobCardModel card, bool isBackground) {
    final height = MediaQuery.of(context).size.height * 0.75; // 60% of screen height

    return Container(
      height: height, // Dynamically set height
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(card),
          const SizedBox(height: 12),
          _buildTabBar(),
          const SizedBox(height: 12),
          Expanded(child: _buildContent(card)),
          const SizedBox(height: 12),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildHeader(JobCardModel card) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildLogo(card.brandLogo),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      card.organizationName,
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      card.positionTitle,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildInfoTags(card),
        ],
      ),
    );
  }

  Widget _buildLogo(String logoUrl) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          logoUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    final tabs = [
      TabData(icon: Icons.explore_outlined, label: 'Overview'),
      TabData(icon: Icons.pending_actions, label: 'Details'),
      TabData(icon: Icons.checklist_rounded, label: 'Missions'),
    ];

    return Container(
      height: 56,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Row(
          children: tabs.asMap().entries.map((entry) {
            final index = entry.key;
            final tab = entry.value;
            final isSelected = _selectedTab == index;

            return Expanded(
              child: InkWell(
                onTap: () => setState(() {
                  _selectedTab = index;
                }),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? primaryColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedScale(
                        duration: const Duration(milliseconds: 200),
                        scale: isSelected ? 1.1 : 1.0,
                        child: Icon(
                          tab.icon,
                          size: isSelected ? 24 : 22, // Smaller icon when unselected
                          color: isSelected ? Colors.white : Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        tab.label,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400, // Lighter weight when unselected
                          color: isSelected ? Colors.white : Colors.grey.shade600,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildContent(JobCardModel card) {
    switch (_selectedTab) {
      case 0:
        return _buildOverviewTab(card);
      case 1:
        return _buildDetailsTab(card);
      case 2:
        return _buildTasksTab(card);
      default:
        return _buildOverviewTab(card);
    }
  }

  Widget _buildOverviewTab(JobCardModel card) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        const Text(
          'About Position',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          card.shortDescription.length > 50
              ? '${card.shortDescription.substring(0, 47)}...'
              : card.shortDescription,
          style: const TextStyle(
            fontSize: 15,
            fontFamily: 'Poppins',
            color: Colors.black54,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Required Skills',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: card.requiredSkills.map((skill) => _buildSkillChip(skill)).toList(),
        ),
      ],
    );
  }

  Widget _buildDetailsTab(JobCardModel card) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        const Text(
          'Job Details',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          card.jobDetails,
          style: const TextStyle(
            fontSize: 15,
            fontFamily: 'Poppins',
            color: Colors.black54,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildTasksTab(JobCardModel card) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: card.tasks.length,
      itemBuilder: (context, index) {
        final task = card.tasks[index];
        bool isChecked = false;

        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    Colors.grey.shade50,
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        // Custom Checkbox
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isChecked ? primaryColor : Colors.grey.shade300,
                              width: 2,
                            ),
                            color: isChecked ? primaryColor : Colors.transparent,
                          ),
                          child: isChecked
                              ? const Icon(
                            Icons.check,
                            size: 16,
                            color: Colors.white,
                          )
                              : null,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time_rounded,
                                    size: 18,
                                    color: primaryColor,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Day ${index + 1}',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey.shade800,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: primaryColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      '${task['duration']}',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.schedule_rounded,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '${task['startTime']} - ${task['endTime']}',
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    task['location'],
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: Colors.grey.shade400,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
  Widget _buildInfoTags(JobCardModel card) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _buildInfoChip(Icons.location_on_outlined, card.region),
        _buildInfoChip(Icons.payments_outlined, card.compensation),
        _buildInfoChip(Icons.schedule_outlined, card.employmentType),
      ],
    );
  }

  Widget _buildInfoChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.06),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: primaryColor,
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              color: primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: primaryColor.withOpacity(0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        skill,
        style: const TextStyle(
          fontSize: 14,
          fontFamily: 'Poppins',
          color: primaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: Row(
        children: [
          Expanded(
            child: _buildButton(
              label: 'Not Interested',
              onTap: () => _animateCard(false),
              isPrimary: false,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildButton(
              label: 'Apply Now',
              onTap: () => _animateCard(true),
              isPrimary: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String label,
    required VoidCallback onTap,
    required bool isPrimary,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          height: 52,
          decoration: BoxDecoration(
            color: isPrimary ? primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
            border: isPrimary
                ? null
                : Border.all(
              color: primaryColor.withOpacity(0.4),
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: isPrimary ? 16 : 14,
                fontFamily: 'Poppins',
                fontWeight: isPrimary ? FontWeight.w600 : FontWeight.w500,
                color: isPrimary ? Colors.white : Colors.grey[600],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TabData {
  final IconData icon;
  final String label;

  TabData({required this.icon, required this.label});
}

class TabItem {
  final IconData icon;
  final String label;

  TabItem({required this.icon, required this.label});
}







class EditableInfoCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String initialValue;
  final bool isEditable;
  final double width;
  final Function(String) onValueChanged;

  const EditableInfoCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.initialValue,
    this.isEditable = false,
    required this.width,
    required this.onValueChanged,
  }) : super(key: key);

  @override
  _EditableInfoCardState createState() => _EditableInfoCardState();
}

class _EditableInfoCardState extends State<EditableInfoCard> {
  late TextEditingController _controller;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(widget.width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFEEEEEE)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(widget.width * 0.03),
            decoration: BoxDecoration(
              color: const Color(0xff6C0FE4).withOpacity(0.1),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(
              widget.icon,
              color: const Color(0xff6C0FE4),
              size: widget.width * 0.05,
            ),
          ),
          SizedBox(width: widget.width * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: widget.width * 0.035,
                    color: Colors.black45,
                  ),
                ),
                _isEditing
                    ? TextField(
                  controller: _controller,
                  style: TextStyle(
                    fontSize: widget.width * 0.04,
                    fontWeight: FontWeight.w500,
                    color: Colors.black45,
                  ),
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                  onSubmitted: (newValue) {
                    setState(() {
                      _isEditing = false;
                    });
                    widget.onValueChanged(newValue);
                  },
                )
                    : Text(
                  _controller.text,
                  style: TextStyle(
                    fontSize: widget.width * 0.04,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          if (widget.isEditable)
            IconButton(
              icon: Icon(
                _isEditing ? Icons.check : Icons.edit_outlined,
                color: const Color(0xff6C0FE4),
              ),
              onPressed: () {
                setState(() {
                  _isEditing = !_isEditing;
                  if (!_isEditing) {
                    widget.onValueChanged(_controller.text);
                  }
                });
              },
            ),
        ],
      ),
    );
  }
}






