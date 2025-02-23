import 'dart:ui'; // For BackdropFilter
import 'package:infinityCRM/index.dart';


class LandingPage extends StatelessWidget {
  static const String routeName = '/landing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Hero Section
            HeroSection(),

            // Features Section
            FeaturesSection(),

            // Testimonials Section
            TestimonialsSection(),

            // Call to Action
            CallToActionSection(),

            // Footer Section
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: MediaQuery.of(context).size.height * 0.67,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.indigo.shade900],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // Frosted Glass Card
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 50),
                  width: width < 600 ? width * 0.9 : width * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title
                      Text(
                        "Revolutionize Customer Success",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Subtitle
                      Text(
                        "Smarter AI-powered CRM for modern sales teams. Streamline workflows, enhance relationships, and close deals faster.",
                        textAlign: TextAlign.center,
                        style:TextStyle(
                          fontSize: 16,
                          fontFamily: 'SFProDisplay',
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Call-to-Actions
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ResponsiveButton(
                            label: "Get Started Free",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                              );                            },
                            primary: true,
                          ),
                          const SizedBox(height: 20),
                          ResponsiveButton(
                            label: "Schedule a Demo",
                            onPressed: () {
                              // Handle demo process
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResponsiveButton extends StatelessWidget {
  const ResponsiveButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.primary = false,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: primary ? Colors.white : Colors.transparent,
        foregroundColor: primary ? Colors.blueAccent : Colors.white,
        side: primary
            ? BorderSide.none
            : const BorderSide(color: Colors.white, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      ),
      child: Text(
        label,
        style:TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}

class FeaturesSection extends StatelessWidget {
  final List<Map<String, String>> features = [
    {
      "icon": "🤖",
      "title": "AI-Powered Insights",
      "description": "Gain actionable customer recommendations instantly."
    },
    {
      "icon": "🔗",
      "title": "Seamless Integrations",
      "description": "Easily connect with Slack, Gmail, and more."
    },
    {
      "icon": "📊",
      "title": "Real-time Analytics",
      "description": "Monitor your sales performance live."
    },
    {
      "icon": "🌐",
      "title": "Global CRM Access",
      "description": "Manage your CRM from anywhere in the world."
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: width < 800 ? 20 : 50,
        vertical: 50,
      ),
      child: Column(
        children: [
          // Section Title
          Text(
            "Why Choose Our CRM?",
            textAlign: TextAlign.center,
            style:TextStyle(
              fontSize: 24,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 20),

          // Features Grid
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: features.map((feature) {
              return FeatureCard(
                icon: feature["icon"]!,
                title: feature["title"]!,
                description: feature["description"]!,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(20),
      width: width < 600 ? width * 0.9 : 200,
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(icon, style: const TextStyle(fontSize: 40,)),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style:TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'SFProDisplay',
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            textAlign: TextAlign.center,
            style:TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

class TestimonialsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: Colors.blueAccent.withOpacity(0.1),
      child: Column(
        children: [
          Text(
            "What Our Users Say",
            textAlign: TextAlign.center,
            style:TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'SFProDisplay',

              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "“This CRM tool has transformed how we do business. It's intuitive, powerful, and the AI features are a game-changer!”",
            style:TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: Colors.black54,
              fontFamily: 'SFProDisplay',

            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class CallToActionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: Colors.blueAccent,
      child: Column(
        children: [
          Text(
            "Ready to Transform Your Business?",
            textAlign: TextAlign.center,
            style:TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'SFProDisplay',

              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          ResponsiveButton(
            label: "Start Your Free Trial",
            onPressed: () {
              // Navigate to sign-up
            },
            primary: true,
          ),
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 65),
      color: Colors.indigo.shade900,
      child: Column(
        children: [
          Text(
            "© 2025 CRM Tool Co. All rights reserved.",
            style:TextStyle(
              color: Colors.white,
              fontFamily: 'SFProDisplay',

              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
