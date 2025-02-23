import 'package:flutter/cupertino.dart';
import 'package:infinityCRM/index.dart';

class Chat extends StatefulWidget {

  static const String routeName = '/Chat';

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['Workspaces', 'Direct', 'Platforms', 'Invites'];
  int _selectedIndex = 0;

  // Sample data for dynamic content
  final List<Workspace> _workspaces = [
    Workspace(
      name: 'Design Team',
      members: 12,
      description: 'Creative design collaboration',
      icon: Icons.design_services,
    ),
    Workspace(
      name: 'Sales Force',
      members: 24,
      description: 'Sales strategy and tracking',
      icon: Icons.moving_outlined,
    ),
  ];

  final List<ConnectionPlatform> _platforms = [
    ConnectionPlatform(
      name: 'WhatsApp Business',
      icon: CupertinoIcons.phone_circle,
      connections: 45,
      color: Colors.green,
    ),
    ConnectionPlatform(
      name: 'Instagram',
      icon: Icons.camera_alt_outlined,
      connections: 32,
      color: Colors.pink,
    ),
    ConnectionPlatform(
      name: 'Sage',
      icon: Icons.business,
      connections: 18,
      color: Colors.blue,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildTabBar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildWorkspacesView(),
                _buildDirectMessagesView(),
                _buildPlatformsView(),
                _buildInvitesView(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
      drawer: SideMenu(),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,

      title: const Text(
        'Inbox',
        style: TextStyle(
          color: Color(0xFF1E1E1E),
          fontFamily: 'SFProDisplay',
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.add, color: Color(0xFF1E1E1E)),
          onPressed: () => _showAddConnectionDialog(),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF047cdb), width: 2),
              ),
              child: const CircleAvatar(
                radius: 16,
                backgroundColor: Color(0xFF03355c),
                child: Text(
                  'MH',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'SFProDisplay',
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Connections & Workspaces',
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontFamily: 'SFProDisplay',
          ),
          prefixIcon: const Icon(Icons.search, color: Color(0xFF047cdb)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(24),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFF047cdb),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey[600],
        labelStyle: const TextStyle(
          fontFamily: 'SFProDisplay',
          fontWeight: FontWeight.w700,
        ),
        tabs: _tabs.map((String tab) => Tab(text: tab)).toList(),
      ),
    );
  }

  Widget _buildWorkspacesView() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSectionHeader('Your Workspaces'),
        ..._workspaces.map((workspace) => _buildWorkspaceCard(workspace)),
        const SizedBox(height: 16),
        _buildCreateWorkspaceButton(),
      ],
    );
  }

  Widget _buildWorkspaceCard(Workspace workspace) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF047cdb).withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(workspace.icon, color: const Color(0xFF047cdb)),
        ),
        title: Text(
          workspace.name,
          style: const TextStyle(
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w700,
            color: Color(0xFF03355c),
          ),
        ),
        subtitle: Text(
          workspace.description,
          style: TextStyle(
            fontFamily: 'SFProDisplay',
            color: Colors.grey[600],
          ),
        ),
        trailing: Text(
          '${workspace.members} Members',
          style: TextStyle(
            fontFamily: 'SFProDisplay',
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }

  Widget _buildCreateWorkspaceButton() {
    return ElevatedButton(
      onPressed: () => _showCreateWorkspaceDialog(),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF047cdb),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, color: Colors.white),
          SizedBox(width: 8),
          Text(
            'Create New Workspace',
            style: TextStyle(
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDirectMessagesView() {
    // Implement direct messages view similar to original ChatList
    return ListView(
      children: [
        _buildChatGroup('Pinned'),
        _buildChatItem(
          'Mohamed Hachicha',
          "Let's discuss the new features",
          time: '11:45 AM',
          avatar: 'MH',
          isOnline: true,
        ),
      ],
    );
  }

  Widget _buildPlatformsView() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSectionHeader('Connected Platforms'),
        ..._platforms.map((platform) => _buildPlatformCard(platform)),
        const SizedBox(height: 16),
        _buildConnectPlatformButton(),
      ],
    );
  }

  Widget _buildPlatformCard(ConnectionPlatform platform) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: platform.color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(platform.icon, color: platform.color),
        ),
        title: Text(
          platform.name,
          style: const TextStyle(
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w700,
            color: Color(0xFF03355c),
          ),
        ),
        trailing: Text(
          '${platform.connections} Connections',
          style: TextStyle(
            fontFamily: 'SFProDisplay',
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }

  Widget _buildConnectPlatformButton() {
    return ElevatedButton(
      onPressed: () => _showConnectPlatformDialog(),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF047cdb),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, color: Colors.white),
          SizedBox(width: 8),
          Text(
            'Connect New Platform',
            style: TextStyle(
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInvitesView() {
    return const Center(
      child: Text(
        'No pending invites',
        style: TextStyle(
          fontFamily: 'SFProDisplay',
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return BlurredFloatingButton(
      options: [
        FloatingButtonOption(
          icon: SimpleLineIcons.people,
          label: "Add contact",
          bgColor: Colors.blue,
          onPressed: () => _showAddContactDialog(),
        ),
        FloatingButtonOption(
          icon: Icons.group,
          label: "New Team",
          bgColor: Colors.purple,
          onPressed: () => _showCreateTeamDialog(),
        ),
      ],
    );
  }

  // Utility methods for dialogs (implementation left to you)
  void _showAddConnectionDialog() {
    // Implement dialog for adding connections
  }

  void _showCreateWorkspaceDialog() {
    // Implement dialog for creating new workspace
  }

  void _showConnectPlatformDialog() {
    // Implement dialog for connecting new platforms
  }

  void _showAddContactDialog() {
    // Implement dialog for adding contacts
  }

  void _showCreateTeamDialog() {
    // Implement dialog for creating new team
  }


  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'SFProDisplay',
          color: Color(0xFF03355c),
        ),
      ),
    );
  }

  // Existing helper methods from original code
  Widget _buildChatGroup(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Color(0xFF1E1E1E),
          fontFamily: 'SFProDisplay',
        ),
      ),
    );
  }

  Widget _buildChatItem(String title, String subtitle,
      {String? time, int? unreadCount, bool isChannel = false, String? avatar, bool isOnline = false}) {
    // Reuse existing chat item implementation
    return ListTile(
      // ... (same as in original implementation)
    );
  }
}

// Helper classes for data modeling
class Workspace {
  final String name;
  final int members;
  final String description;
  final IconData icon;

  Workspace({
    required this.name,
    required this.members,
    required this.description,
    required this.icon,
  });
}

class ConnectionPlatform {
  final String name;
  final IconData icon;
  final int connections;
  final Color color;

  ConnectionPlatform({
    required this.name,
    required this.icon,
    required this.connections,
    required this.color,
  });
}