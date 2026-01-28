import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'sensor.dart';

class AquariumApp extends StatelessWidget {
  const AquariumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AquaAlert',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1565C0),
      body: SafeArea(
        child: Column(
          children: [
            // 🔵 Top Header
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: Row(
                children: [
                  const Icon(Icons.water_drop, color: Colors.white),
                  const SizedBox(width: 8),
                  const Text(
                    'AquaAlert',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Connected',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),

            // 🟦 Main Card Area
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF6FA8E8),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ListView(
                  children: const [
                    // 🌡 Temperature
                    SensorCard(
                      icon: Icons.thermostat,
                      iconBgColor: Colors.redAccent,
                      title: 'Temperature',
                      value: '29.94 °C',
                      subtitle: 'Current water temperature',
                    ),
                    SizedBox(height: 12),

                    // 💧 Humidity
                    SensorCard(
                      icon: Icons.water,
                      iconBgColor: Colors.blue,
                      title: 'Humidity',
                      value: '51.00%',
                      subtitle: 'Air moisture content',
                    ),
                    SizedBox(height: 12),

                    // 🌬 Air Quality
                    SensorCard(
                      icon: Icons.air,
                      iconBgColor: Colors.green,
                      title: 'Air Quality',
                      value: 'Good',
                      subtitle: 'Air quality index: 327',
                    ),
                    SizedBox(height: 16),

                    // 🚰 Water Level
                    WaterLevelCard(percentage: 91.45),
                    SizedBox(height: 16),

                    // 🌊 Turbidity
                    SensorCard(
                      icon: Icons.opacity,
                      iconBgColor: Colors.brown,
                      title: 'Turbidity',
                      value: '3.2 NTU',
                      subtitle: 'Water clarity level',
                    ),
                    SizedBox(height: 12),

                    // 🧪 TDS
                    SensorCard(
                      icon: Icons.science,
                      iconBgColor: Colors.deepPurple,
                      title: 'TDS',
                      value: '450 ppm',
                      subtitle: 'Total dissolved solids',
                    ),

                    const SizedBox(height: 24),

                    // 🔆 Controls Title
                    const Text(
                      'Controls',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // 💡 Light Control
                    ControlCard(
                      icon: Icons.lightbulb,
                      title: 'Light',
                    ),
                    const SizedBox(height: 8),

                    // 🌬 Air Pump Control
                    ControlCard(
                      icon: Icons.air,
                      title: 'Air Pump',
                    ),

                    const SizedBox(height: 8),

                    // 🚰 Water Change Control
                    ControlCard(
                      icon: Icons.water_drop,
                      title: 'Water Change',
                    ),

                    ControlCard(
                      icon: Icons.restaurant,
                      title: 'Food Feeder',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
