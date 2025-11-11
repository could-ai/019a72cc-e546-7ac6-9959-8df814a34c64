class Lead {
  final String id;
  final String name;
  final String company;
  final String email;
  final String phone;
  final String status;
  final int score;
  final String source;

  Lead({
    required this.id,
    required this.name,
    required this.company,
    required this.email,
    required this.phone,
    required this.status,
    required this.score,
    required this.source,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'company': company,
      'email': email,
      'phone': phone,
      'status': status,
      'score': score,
      'source': source,
    };
  }

  factory Lead.fromJson(Map<String, dynamic> json) {
    return Lead(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      company: json['company'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      status: json['status'] ?? 'New',
      score: json['score'] ?? 0,
      source: json['source'] ?? '',
    );
  }
}
