import 'package:infinityCRM/index.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          // A subtle gradient background for a modern look
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Colors.grey.shade50],
          ),
        ),
        child: Theme(
          // Set global icon and text themes including SFProDisplay font
          data: Theme.of(context).copyWith(
            iconTheme: const IconThemeData(color: Colors.blueAccent),
            textTheme: Theme.of(context).textTheme.apply(fontFamily: 'SFProDisplay'),
          ),
          child: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              children: [
                // Profile component that navigates to ProfileScreen on tap
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFF047cdb), width: 2),
                        ),
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFF03355c).withOpacity(0.1),
                          child: const Text(
                            'MH',
                            style: TextStyle(
                              color: Color(0xFF047cdb),
                              fontWeight: FontWeight.w600,
                              fontFamily: 'SFProDisplay',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Mohamed Hachicha',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'SFProDisplay',
                            color: Color(0xFF03355c),
                          ),
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down, color: Color(0xFF03355c)),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                ListTile(
                  leading: const Icon(Icons.smart_toy),
                  title: const Text('AI Assistant'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to AI Assistant functionality
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.insights),
                  title: const Text('Customer Insights'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to Customer Insights screen
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to Settings screen
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.device_hub),
                  title: const Text('CRM Automation'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to CRM Automation screen
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.analytics),
                  title: const Text('Reports & Analytics'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to Reports & Analytics screen
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.folder),
                  title: const Text('Document Management'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to Document Management screen
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.book),
                  title: const Text('Knowledge Base'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to Knowledge Base screen
                  },
                ),
                const Divider(thickness: 1),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Log Out'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Handle Log Out action
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
