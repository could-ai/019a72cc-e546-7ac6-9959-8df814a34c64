import 'package:flutter/material.dart';
import '../widgets/sidebar_menu.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/recent_activities_widget.dart';
import '../widgets/quick_stats_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SidebarMenu(currentRoute: '/dashboard'),
          Expanded(
            child: Column(
              children: [
                _buildAppBar(context),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dashboard Overview',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 24),
                        const QuickStatsWidget(),
                        const SizedBox(height: 24),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  DashboardCard(
                                    title: 'Resource Utilization',
                                    icon: Icons.people,
                                    color: Colors.blue,
                                    value: '78%',
                                    subtitle: 'Average utilization this month',
                                    onTap: () {
                                      Navigator.pushNamed(context, '/resources');
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  DashboardCard(
                                    title: 'Active Projects',
                                    icon: Icons.folder_open,
                                    color: Colors.green,
                                    value: '24',
                                    subtitle: '5 projects due this week',
                                    onTap: () {
                                      Navigator.pushNamed(context, '/projects');
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  DashboardCard(
                                    title: 'Open Opportunities',
                                    icon: Icons.trending_up,
                                    color: Colors.orange,
                                    value: '12',
                                    subtitle: 'Total value: \$450,000',
                                    onTap: () {
                                      Navigator.pushNamed(context, '/opportunities');
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  DashboardCard(
                                    title: 'New Leads',
                                    icon: Icons.person_add,
                                    color: Colors.purple,
                                    value: '18',
                                    subtitle: '8 leads added this week',
                                    onTap: () {
                                      Navigator.pushNamed(context, '/leads');
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 24),
                            const Expanded(
                              flex: 1,
                              child: RecentActivitiesWidget(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search contacts, leads, projects...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
            tooltip: 'Notifications',
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
            tooltip: 'Settings',
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: const Text('JD', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
