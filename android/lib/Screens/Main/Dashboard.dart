import 'package:infinityCRM/index.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = '/dashboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Sample data for dashboard (would typically come from backend/state management)
  final List<Map<String, dynamic>> recentActivities = [
    {'title': 'Closed Deal with Acme Corp', 'type': 'Sale', 'time': '2h ago'},
    {'title': 'Follow-up Call Scheduled', 'type': 'Meeting', 'time': '4h ago'},
    {'title': 'New Lead Converted', 'type': 'Lead', 'time': '6h ago'},
  ];

  final Map<String, dynamic> kpiData = {
    'totalRevenue': 124750,
    'salesConversion': 35.6,
    'newLeads': 42,
    'openOpportunities': 18,
  };

  final List<Map<String, dynamic>> notifications = [
    {'title': 'Team Meeting', 'time': 'Tomorrow at 10 AM', 'icon': Icons.calendar_today},
    {'title': 'Client Presentation', 'time': 'In 2 days', 'icon': SimpleLineIcons.present},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              SizedBox(height: 16),
              _buildQuickAccessSection(),
              SizedBox(height: 16),
              _buildKPISection(),
              SizedBox(height: 16),
              _buildRecentActivitySection(),
              SizedBox(height: 16),
              _buildNotificationsSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
      drawer: SideMenu(),
      floatingActionButton: BlurredFloatingButton(
        options: [
          FloatingButtonOption(
            icon: Icons.dashboard,
            label: "New Board",
            bgColor: Colors.blue,
            onPressed: () {},
          ),
          FloatingButtonOption(
            icon: Icons.folder,
            label: "New Project",
            bgColor: Colors.green,
            onPressed: () {},
          ),
          FloatingButtonOption(
            icon: Icons.group,
            label: "New Team",
            bgColor: Colors.purple,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      titleSpacing: 16,
      title: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xFF047cdb), width: 2),
            ),
            child: CircleAvatar(
              backgroundColor: Color(0xFF03355c).withOpacity(0.1),
              child: Text(
                'MH',
                style: TextStyle(
                  color: Color(0xFF047cdb),
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SFProDisplay',
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Mohamed Hachicha',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'SFProDisplay',
                color: Color(0xFF03355c),
              ),
            ),
          ),
          Icon(Icons.keyboard_arrow_down, color: Color(0xFF03355c)),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(SimpleLineIcons.bell, color: Color(0xFF03355c), size: 22),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(SimpleLineIcons.magnifier_add, color: Color(0xFF03355c), size: 22),
          onPressed: () {},
        ),
        SizedBox(width: 8),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search tasks, projects...',
          hintStyle: TextStyle(
            fontFamily: 'SFProDisplay',
            fontSize: 14,
            color: Colors.grey[500],
          ),
          prefixIcon: Icon(Icons.search, color: Color(0xFF047cdb)),
          suffixIcon: IconButton(
            icon: Icon(Icons.add_circle, color: Color(0xFF047cdb)),
            onPressed: () {},
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16),
        ),
      ),
    );
  }

  Widget _buildQuickAccessSection() {
    return Container(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildQuickAccessButton(Icons.leaderboard, 'Analytics', () {}),
          _buildQuickAccessButton(Icons.person_add, 'New Lead', () {}),
          _buildQuickAccessButton(Icons.analytics, 'Reports', () {}),
          _buildQuickAccessButton(Icons.email, 'Inbox', () {}),
        ],
      ),
    );
  }

  Widget _buildQuickAccessButton(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Color(0xFF047cdb), size: 28),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF03355c),
                fontFamily: 'SFProDisplay',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKPISection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Performance Overview',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'SFProDisplay',
            color: Color(0xFF03355c),
          ),
        ),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildKPICard('Total Revenue', '\$${kpiData['totalRevenue']}', Icons.attach_money),
              _buildKPICard('Conversion Rate', '${kpiData['salesConversion']}%', Icons.trending_up),
              _buildKPICard('New Leads', '${kpiData['newLeads']}', Icons.person_add),
              _buildKPICard('Open Opportunities', '${kpiData['openOpportunities']}', Icons.insights),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildKPICard(String title, String value, IconData icon) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Color(0xFF047cdb), size: 32),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontFamily: 'SFProDisplay',
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'SFProDisplay',
              color: Color(0xFF03355c),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivitySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Activities',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'SFProDisplay',
            color: Color(0xFF03355c),
          ),
        ),
        SizedBox(height: 16),
        Column(
          children: recentActivities.map((activity) => _buildActivityItem(activity)).toList(),
        ),
      ],
    );
  }

  Widget _buildActivityItem(Map<String, dynamic> activity) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF047cdb).withOpacity(0.1),
            ),
            child: Icon(
              Icons.bolt,
              color: Color(0xFF047cdb),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity['title'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SFProDisplay',
                    color: Color(0xFF03355c),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '${activity['type']} • ${activity['time']}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontFamily: 'SFProDisplay',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upcoming Notifications',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'SFProDisplay',
            color: Color(0xFF03355c),
          ),
        ),
        SizedBox(height: 16),
        Column(
          children: notifications.map((notification) => _buildNotificationItem(notification)).toList(),
        ),
      ],
    );
  }

  Widget _buildNotificationItem(Map<String, dynamic> notification) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF047cdb).withOpacity(0.1),
            ),
            child: Icon(
              notification['icon'],
              color: Color(0xFF047cdb),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification['title'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SFProDisplay',
                    color: Color(0xFF03355c),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  notification['time'],
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontFamily: 'SFProDisplay',
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