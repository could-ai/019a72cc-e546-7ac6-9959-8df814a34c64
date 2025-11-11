import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/contacts_screen.dart';
import 'screens/leads_screen.dart';
import 'screens/opportunities_screen.dart';
import 'screens/resources_screen.dart';
import 'screens/projects_screen.dart';
import 'screens/reports_screen.dart';

void main() {
  runApp(const WebCRMApp());
}

class WebCRMApp extends StatelessWidget {
  const WebCRMApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebCRM - Resource Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1976D2),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          elevation: 2,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/contacts': (context) => const ContactsScreen(),
        '/leads': (context) => const LeadsScreen(),
        '/opportunities': (context) => const OpportunitiesScreen(),
        '/resources': (context) => const ResourcesScreen(),
        '/projects': (context) => const ProjectsScreen(),
        '/reports': (context) => const ReportsScreen(),
      },
    );
  }
}
