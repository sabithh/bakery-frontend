// lib/main.dart
// Application entry point. All screens are in lib/screens/, services in lib/services/.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';
import 'services/notification_service.dart';

// Screens
import 'screens/dashboard_screen.dart';
import 'screens/ownerbot_chat_screen.dart';
import 'screens/outlet_screen.dart';
import 'screens/product_screen.dart';
import 'screens/sales_reporter_screen.dart';
import 'screens/expense_screen.dart';
import 'screens/profit_loss_screen.dart';
import 'screens/staff_screen.dart';
import 'screens/production_reporter_screen.dart';
import 'screens/inventory_reporter_screen.dart';
import 'screens/cctv_report_screen.dart';
import 'screens/customer_report_screen.dart';
import 'screens/about_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService.initialize();
  runApp(const OwnerBotApp());
}

class OwnerBotApp extends StatelessWidget {
  const OwnerBotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OwnerBot Dashboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE1AD01)), // Mustard Yellow
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    OwnerBotChat(),
    OutletManagementScreen(),
    ProductManagementScreen(),
    SalesReporterScreen(),
    ExpenseManagementScreen(),
    ProfitLossScreen(),
    StaffManagementScreen(),
    StaffAttendanceReportScreen(),
    ProductionReporterScreen(),
    InventoryReporterScreen(),
    CCTVReportScreen(),
    CustomerReportScreen(),
    AboutScreen(),
  ];

  static const List<String> _titles = [
    'Dashboard',
    'AI Assistant',
    'Outlets',
    'Products',
    'Sales Report',
    'Expenses',
    'Profit & Loss',
    'Staff',
    'Attendance & Salary',
    'Production Report',
    'Inventory Report',
    'CCTV Report',
    'Customer Report',
    'About',
  ];

  static const List<IconData> _icons = [
    Icons.dashboard,
    Icons.smart_toy,
    Icons.store,
    Icons.inventory,
    Icons.receipt,
    Icons.money_off,
    Icons.pie_chart,
    Icons.people,
    Icons.how_to_reg,
    Icons.factory,
    Icons.warehouse,
    Icons.videocam,
    Icons.person_search,
    Icons.info,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
              child: Text(
                'Manager Dashboard',
                style: GoogleFonts.inter(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            for (var i = 0; i < _titles.length; i++)
              ListTile(
                leading: Icon(_icons[i]),
                title: Text(_titles[i]),
                selected: _selectedIndex == i,
                onTap: () => _onItemTapped(i),
              ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}