class Resource {
  final String id;
  final String name;
  final String role;
  final String department;
  final int utilization;
  final String status;
  final List<String> skills;

  Resource({
    required this.id,
    required this.name,
    required this.role,
    required this.department,
    required this.utilization,
    required this.status,
    required this.skills,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'department': department,
      'utilization': utilization,
      'status': status,
      'skills': skills,
    };
  }

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      department: json['department'] ?? '',
      utilization: json['utilization'] ?? 0,
      status: json['status'] ?? 'Available',
      skills: List<String>.from(json['skills'] ?? []),
    );
  }
}
