import 'package:flutter/material.dart';
import '../widgets/sidebar_menu.dart';
import '../models/resource_model.dart';

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({super.key});

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  final List<Resource> _resources = [
    Resource(
      id: '1',
      name: 'Alice Johnson',
      role: 'Senior Developer',
      department: 'Engineering',
      utilization: 85,
      status: 'Available',
      skills: ['Flutter', 'React', 'Node.js'],
    ),
    Resource(
      id: '2',
      name: 'Bob Smith',
      role: 'Project Manager',
      department: 'Management',
      utilization: 92,
      status: 'Busy',
      skills: ['Agile', 'Scrum', 'Leadership'],
    ),
    Resource(
      id: '3',
      name: 'Carol White',
      role: 'UX Designer',
      department: 'Design',
      utilization: 68,
      status: 'Available',
      skills: ['Figma', 'Adobe XD', 'UI/UX'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SidebarMenu(currentRoute: '/resources'),
          Expanded(
            child: Column(
              children: [
                _buildHeader(context),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildUtilizationOverview(),
                        const SizedBox(height: 24),
                        _buildResourcesGrid(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text('Add Resource'),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
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
          Text(
            'Resources',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Spacer(),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.calendar_today),
            label: const Text('Schedule'),
          ),
        ],
      ),
    );
  }

  Widget _buildUtilizationOverview() {
    return Row(
      children: [
        _buildUtilizationCard('Available', 12, Colors.green),
        const SizedBox(width: 16),
        _buildUtilizationCard('Busy', 8, Colors.orange),
        const SizedBox(width: 16),
        _buildUtilizationCard('On Leave', 3, Colors.grey),
        const SizedBox(width: 16),
        _buildUtilizationCard('Avg. Utilization', 78, Colors.blue, suffix: '%'),
      ],
    );
  }

  Widget _buildUtilizationCard(String title, int value, Color color, {String suffix = ''}) {
    return Expanded(
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                '$value$suffix',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResourcesGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: _resources.length,
      itemBuilder: (context, index) {
        final resource = _resources[index];
        return _buildResourceCard(resource);
      },
    );
  }

  Widget _buildResourceCard(Resource resource) {
    Color statusColor = resource.status == 'Available' ? Colors.green : Colors.orange;

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Text(
                    resource.name.split(' ').map((e) => e[0]).join(),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        resource.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        resource.role,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.business, size: 14, color: Colors.grey[500]),
                const SizedBox(width: 4),
                Text(
                  resource.department,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const Spacer(),
                Chip(
                  label: Text(
                    resource.status,
                    style: const TextStyle(fontSize: 11),
                  ),
                  backgroundColor: statusColor.withOpacity(0.2),
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Utilization: ${resource.utilization}%',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: resource.utilization > 80 ? Colors.orange : Colors.green,
              ),
            ),
            const SizedBox(height: 4),
            LinearProgressIndicator(
              value: resource.utilization / 100,
              backgroundColor: Colors.grey[200],
              color: resource.utilization > 80 ? Colors.orange : Colors.green,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: resource.skills.take(3).map((skill) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    skill,
                    style: const TextStyle(fontSize: 10),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
