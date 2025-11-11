import 'package:flutter/material.dart';
import '../widgets/sidebar_menu.dart';
import '../models/lead_model.dart';

class LeadsScreen extends StatefulWidget {
  const LeadsScreen({super.key});

  @override
  State<LeadsScreen> createState() => _LeadsScreenState();
}

class _LeadsScreenState extends State<LeadsScreen> {
  final List<Lead> _leads = [
    Lead(
      id: '1',
      name: 'David Wilson',
      company: 'Digital Innovations',
      email: 'david@digitalinnovations.com',
      phone: '+1 (555) 456-7890',
      status: 'New',
      score: 85,
      source: 'Website',
    ),
    Lead(
      id: '2',
      name: 'Emily Chen',
      company: 'Global Tech Partners',
      email: 'emily.chen@globaltechpartners.com',
      phone: '+1 (555) 567-8901',
      status: 'Contacted',
      score: 72,
      source: 'Referral',
    ),
    Lead(
      id: '3',
      name: 'Robert Martinez',
      company: 'Smart Systems LLC',
      email: 'r.martinez@smartsystems.com',
      phone: '+1 (555) 678-9012',
      status: 'Qualified',
      score: 90,
      source: 'LinkedIn',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SidebarMenu(currentRoute: '/leads'),
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
                        _buildLeadsPipeline(),
                        const SizedBox(height: 24),
                        _buildLeadsGrid(),
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
        label: const Text('Add Lead'),
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
            'Leads',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Spacer(),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.download),
            label: const Text('Export'),
          ),
        ],
      ),
    );
  }

  Widget _buildLeadsPipeline() {
    return Row(
      children: [
        _buildPipelineStage('New', 8, Colors.blue),
        const SizedBox(width: 16),
        _buildPipelineStage('Contacted', 12, Colors.orange),
        const SizedBox(width: 16),
        _buildPipelineStage('Qualified', 6, Colors.purple),
        const SizedBox(width: 16),
        _buildPipelineStage('Converted', 4, Colors.green),
      ],
    );
  }

  Widget _buildPipelineStage(String title, int count, Color color) {
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
              ),
              const SizedBox(height: 8),
              Text(
                count.toString(),
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

  Widget _buildLeadsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: _leads.length,
      itemBuilder: (context, index) {
        final lead = _leads[index];
        return _buildLeadCard(lead);
      },
    );
  }

  Widget _buildLeadCard(Lead lead) {
    Color statusColor;
    switch (lead.status) {
      case 'New':
        statusColor = Colors.blue;
        break;
      case 'Contacted':
        statusColor = Colors.orange;
        break;
      case 'Qualified':
        statusColor = Colors.purple;
        break;
      default:
        statusColor = Colors.grey;
    }

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
                Chip(
                  label: Text(
                    lead.status,
                    style: const TextStyle(fontSize: 12),
                  ),
                  backgroundColor: statusColor.withOpacity(0.2),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: lead.score >= 80 ? Colors.green.withOpacity(0.2) : Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Score: ${lead.score}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: lead.score >= 80 ? Colors.green : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              lead.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              lead.company,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.source, size: 14, color: Colors.grey[500]),
                const SizedBox(width: 4),
                Text(
                  lead.source,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('View'),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
