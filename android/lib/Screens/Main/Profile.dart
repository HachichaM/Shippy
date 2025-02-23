import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:infinityCRM/index.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[40],
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16),
            ),
          ),
          title: Text(
            'Profil',
            style: TextStyle(
              color: Colors.black,
              fontSize: 28, // Use responsive font size
              fontWeight: FontWeight.w700,
              fontFamily: 'SFProDisplay',
            ),
          ),

          actions: [
            IconButton(
                icon: Icon(Icons.power_settings_new,color: Colors.black,),
                onPressed: () => _showLogoutConfirmationDialog(context, primaryColor)

            ),
          ]
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            SizedBox(height: 20),
            _buildSectionTitle("Settings"),
            _buildSettingsList(),
            SizedBox(height: 20),
            _buildSectionTitle("Support & Feedback"),
            SizedBox(height: 20),
            _buildSupportGrid(),
            SizedBox(height: 20),
            _buildLogoutButton(),
            _buildAppVersion(),
            SizedBox(height: 40),

          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blue,
            child: Text(
              "MH",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white, fontFamily: 'SFProDisplay'),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Mohamed Hachicha",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'SFProDisplay'),
          ),
          SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              // Handle profile viewing
            },
            child: Text(
              "View profile",
              style: TextStyle(color: Colors.blue, fontSize: 14, fontFamily: 'SFProDisplay'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'SFProDisplay'),
      ),
    );
  }

  Widget _buildSettingsList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildSettingsTile(SimpleLineIcons.settings, "Account settings", "Mohamed’s Team"),
          _buildSettingsTile(SimpleLineIcons.bell, "Notification Settings", ""),
          _buildSettingsTile(SimpleLineIcons.globe, "Language", "English"),
          _buildSettingsTile(Icons.sunny, "Theme", "System Default"),
          Divider(),
          _buildSettingsTile(SimpleLineIcons.lock, "Privacy policy", ""),
          _buildSettingsTile(SimpleLineIcons.doc, "Terms Of Service", ""),
          _buildSettingsTile(SimpleLineIcons.shield, "Admin settings", ""),
          _buildSettingsTile(SimpleLineIcons.user_follow, "Join Beta program", ""),
          _buildSettingsTile(Icons.code, "Developers Settings", ""),
        ],
      ),
    );
  }

  Widget _buildSettingsTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(title, style: TextStyle(fontSize: 16, fontFamily: 'SFProDisplay')),
      subtitle: subtitle.isNotEmpty ? Text(subtitle, style: TextStyle(color: Colors.grey, fontFamily: 'SFProDisplay')) : null,
      trailing: Icon(Icons.chevron_right, color: Colors.black26),
      onTap: () {
        // Handle settings tap
      },
    );
  }

  Widget _buildSupportGrid() {
    List<Map<String, dynamic>> supportItems = [
      {"icon": SimpleLineIcons.graduation, "label": "Knowledge base"},
      {"icon": SimpleLineIcons.paper_plane, "label": "Send feedback"},
      {"icon": SimpleLineIcons.star, "label": "Rate the app"},
      {"icon": SimpleLineIcons.exclamation, "label": "Report a problem"},
      {"icon": SimpleLineIcons.question, "label": "Ask a question"},
      {"icon": Icons.play_arrow_rounded, "label": "Intro tutorial"},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: supportItems.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.withOpacity(0.1),
                ),
                child: Icon(supportItems[index]["icon"], color: Colors.blue, size: 24),
              ),
              SizedBox(height: 5),
              Text(
                supportItems[index]["label"],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontFamily: 'SFProDisplay'),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          // Handle logout
        },
        child: Center(
          child: Text(
            "Log out from Mohamed’s Team",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700, fontFamily: 'SFProDisplay'),
          ),
        ),
      ),
    );
  }

  Widget _buildAppVersion() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Text(
          "5.26.2 (2012319180)",
          style: TextStyle(fontSize: 12, color: Colors.grey, fontFamily: 'SFProDisplay'),
        ),
      ),
    );
  }




  void _showLogoutConfirmationDialog(BuildContext context, Color primaryColor) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Confirmer la déconnexion',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: primaryColor,
            ),
          ),
          content: Text(
            'Êtes-vous sûr de vouloir vous déconnecter ?',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[800],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Annuler',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primaryColor,
                    primaryColor.withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                onPressed:() => _handleLogout(context),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Déconnexion',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }


  void _handleLogout(BuildContext context) {
    // Perform the actual logout logic here
    Navigator.pushReplacementNamed(context, '/');
    print("User has been logged out.");
  }
}
