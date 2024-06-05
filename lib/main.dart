import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAppExt(),
    );
  }
}

class MyAppExt extends StatefulWidget {
  @override
  State<MyAppExt> createState() => _MyAppExtState();
}

class _MyAppExtState extends State<MyAppExt> {
  int currentIndex = 1;
  int selectedFactory = 1;

  final List<int> factories = [1, 2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Factory $selectedFactory - Dashboard'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ActivationPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Center(
                    child: selectedFactory == 1 ? Dashboard1() : Dashboard2(),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'Timestamp: ${DateTime.now()}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: factories.map((factory) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFactory = factory;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        margin: const EdgeInsets.all(5),
                        color: selectedFactory == factory
                            ? Colors.blue
                            : Colors.blue[200],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.factory,
                              color: selectedFactory == factory
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Factory $factory',
                              style: TextStyle(
                                color: selectedFactory == factory
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Engineer List',
            icon: Icon(Icons.engineering),
          ),
          BottomNavigationBarItem(
            label: 'Dashboard',
            icon: Icon(Icons.dashboard),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Icons.settings),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });

          // Navigate to different pages based on index
          if (index == 0) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EngineerListPage(selectedFactory: selectedFactory),
              ),
            );
          } else if (index == 2) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ActivationPage(),
              ),
            );
          }
        },
      ),
    );
  }
}

class ActivationPage extends StatelessWidget {
  const ActivationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activation Page'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'images/UPMlogo.jpg',
              width: 150,
              height: 150,
            ),
            const Text(
              'Welcome!',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter your mobile number to activate your account.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Image.asset(
                  'images/malaysia.png', 
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 5),
                const Text(
                  '+60',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter mobile number',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                const Text('I agree to the terms and conditions'),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OTPPage(),
                    ),
                  );
                },
                child: const Text('Submit'),
              ),
            ),
            const SizedBox(height: 20),
              
          ],
        ),
      ),
    );
  }
}

class OTPPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Page'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'images/UPMlogo.jpg',
              width: 150,
              height: 150,
            ),
            const Text(
              'Welcome!',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter the OTP code via SMS.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter 6 digit code',
              ),
            ),
           const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Activate action
                },
                child: const Text('Activate'),
              ),
            ),
            const SizedBox(height: 20),
            
          ],
        ),
      ),
    );
  }
}

class Dashboard1 extends StatelessWidget {
  const Dashboard1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '1549.7kW',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              _buildGauge('Steam Pressure', 34.19, 'bar'),
              _buildGauge('Steam Flow', 22.82, 'T/H'),
              _buildGauge('Water Level', 55.41, '%'),
              _buildGauge('Power Frequency', 50.08, 'Hz'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGauge(String title, double value, String unit) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SfRadialGauge(
                axes: [
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    pointers: [
                      NeedlePointer(value: value),
                    ],
                    annotations: [
                      GaugeAnnotation(
                        widget: Text(
                          '$value$unit',
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        positionFactor: 0.8,
                        angle: 90,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class Dashboard2 extends StatelessWidget {
  const Dashboard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'ABC123 IS UNREACHABLE !',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              _buildGauge('Steam Pressure', 0.0, 'bar'),
              _buildGauge('Steam Flow', 0.0, 'T/H'),
              _buildGauge('Water Level', 0.0, '%'),
              _buildGauge('Power Frequency', 0.0, 'Hz'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGauge(String title, double value, String unit) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SfRadialGauge(
                axes: [
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    pointers: [
                      NeedlePointer(value: value),
                    ],
                    annotations: [
                      GaugeAnnotation(
                        widget: Text(
                          '$value$unit',
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        positionFactor: 0.8,
                        angle: 90,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class EngineerListPage extends StatefulWidget {
  final int selectedFactory;

  const EngineerListPage({super.key, required this.selectedFactory});

  @override
  _EngineerListPageState createState() => _EngineerListPageState();
}

class _EngineerListPageState extends State<EngineerListPage> {
  int selectedFactory = 1;

  final List<int> factories = [1, 2];
  final Map<int, List<Map<String, String>>> engineers = {
    1: [
      {'name': 'Ben', 'phone': '+60109219938'},
      {'name': 'Tom', 'phone': '+601234567891'},
      {'name': 'Maya', 'phone': '+60123456789'}
    ],
    2: [
      {'name': 'John', 'phone': '+60109777263'},
      {'name': 'Doe', 'phone': '+60165353572'},
      {'name': 'Jane', 'phone': '+60123473689'}
    ]
  };

  @override
  void initState() {
    super.initState();
    selectedFactory = widget.selectedFactory;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Factory $selectedFactory - Engineer List'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          
          Expanded(
            child: ListView.builder(
              itemCount: engineers[selectedFactory]!.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text(engineers[selectedFactory]![index]['name']!),
                    subtitle: Text(engineers[selectedFactory]![index]['phone']!),
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: factories.map((factory) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFactory = factory;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      margin: EdgeInsets.all(5),
                      color: selectedFactory == factory
                          ? Colors.blue
                          : Colors.blue[200],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.factory,
                            color: selectedFactory == factory
                                ? Colors.white
                                : Colors.black,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Factory $factory',
                            style: TextStyle(
                              color: selectedFactory == factory
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
       floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 75.0), // Adjust this value as needed
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => InvitationPage(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            label: 'Engineer List',
            icon: Icon(Icons.engineering),
          ),
          BottomNavigationBarItem(
            label: 'Dashboard',
            icon: Icon(Icons.dashboard),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Icons.settings),
          ),
        ],
        onTap: (index) {
          if (index == 0) {
          // Stay on Engineer List Page
          } else if (index == 1) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MyAppExt(),
              ),
            );
          } else if (index == 2) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SettingsPage(),
              ),
            );
          }
        },
      ),
    );
  }
}

class InvitationPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  InvitationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invite Engineer'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Owner\'s Name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Type here',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the owner\'s name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Owner\'s Phone Number',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  hintText: '\tEnter phone no',
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                      '\t\t'),
                      Image.asset(
                        'images/malaysia.png', // Make sure to add the Malaysia flag image in the assets
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      const Text('+60'),
                    ],
                  ),
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int currentIndex = 2; // Settings page index
  int selectedFactory = 1;

  final List<int> factories = [1, 2];

  final Map<int, Map<String, double>> factorySettings = {
    1: {
      'Steam Pressure': 29.0,
      'Steam Flow': 22.0,
      'Water Level': 53.0,
      'Power Frequency': 48.0,
    },
    2: {
      'Steam Pressure': 29.0,
      'Steam Flow': 22.0,
      'Water Level': 53.0,
      'Power Frequency': 48.0,
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Factory $selectedFactory - Settings'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.grey[200], // Light grey background color
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.0), // Adjust padding as needed
                child: ListView(
                  children: [
                    const Text(
                      'Minimum Threshold Settings',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    buildSettingCard('Steam Pressure', 'bar', selectedFactory),
                    buildSettingCard('Steam Flow', 'T/H', selectedFactory),
                    buildSettingCard('Water Level', '%', selectedFactory),
                    buildSettingCard('Power Frequency', 'Hz', selectedFactory),
                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                children: factories.map((factory) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFactory = factory;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        margin: const EdgeInsets.all(5),
                        color: selectedFactory == factory
                            ? Colors.blue
                            : Colors.blue[200],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.factory,
                              color: selectedFactory == factory
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Factory $factory',
                              style: TextStyle(
                                color: selectedFactory == factory
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Engineer List',
            icon: Icon(Icons.engineering),
          ),
          BottomNavigationBarItem(
            label: 'Dashboard',
            icon: Icon(Icons.dashboard),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Icons.settings),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });

          // Navigate to different pages based on index
          if (index == 0) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EngineerListPage(selectedFactory: selectedFactory),
              ),
            );
          } else if (index == 1) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MyAppExt(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget buildSettingCard(String settingName, String unit, int factory) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              settingName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${factorySettings[factory]![settingName]} $unit',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
