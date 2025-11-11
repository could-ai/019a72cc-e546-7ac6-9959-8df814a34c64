import 'package:flutter/material.dart';

class RecentActivitiesWidget extends StatelessWidget {
  const RecentActivitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Activities',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('View All'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildActivityItem(
              context,
              icon: Icons.person_add,
              iconColor: Colors.green,
              title: 'New lead added',
              subtitle: 'John Smith - Tech Solutions Inc.',
              time: '10 minutes ago',
            ),
            const Divider(),
            _buildActivityItem(
              context,
              icon: Icons.check_circle,
              iconColor: Colors.blue,
              title: 'Deal closed',
              subtitle: 'Enterprise Software License - \$45,000',
              time: '2 hours ago',
            ),
            const Divider(),
            _buildActivityItem(
              context,
              icon: Icons.assignment,
              iconColor: Colors.orange,
              title: 'Task completed',
              subtitle: 'Prepared proposal for ABC Corp',
              time: '5 hours ago',
            ),
            const Divider(),
            _buildActivityItem(
              context,
              icon: Icons.people,
              iconColor: Colors.purple,
              title: 'Team meeting',
              subtitle: 'Q1 Resource Planning Review',
              time: 'Yesterday',
            ),
            const Divider(),
            _buildActivityItem(
              context,
              icon: Icons.email,
              iconColor: Colors.teal,
              title: 'Email sent',
              subtitle: 'Follow-up with potential client',
              time: 'Yesterday',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 20,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[500],
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
