import 'package:flutter/material.dart';
import '../models/drive_item.dart';
import '../services/mock_drive_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<DriveItem> items = MockDriveService.getItems();

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 800;

    Widget content = Scaffold(
      appBar: AppBar(
        title: const Text('My Drive'),
      ),
      drawer: isDesktop ? null : _buildDrawer(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = constraints.maxWidth < 600 ? 2 : (constraints.maxWidth / 200).floor();
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.1,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            item.isFolder ? Icons.folder : Icons.insert_drive_file,
                            size: 48,
                            color: item.isFolder ? Colors.blue.shade300 : Colors.grey.shade500,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            item.name,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add New',
        child: const Icon(Icons.add),
      ),
    );

    if (isDesktop) {
      return Scaffold(
        body: Row(
          children: [
            _buildDrawer(),
            Expanded(child: content),
          ],
        ),
      );
    }

    return content;
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.cloud, color: Colors.white, size: 48),
                SizedBox(height: 8),
                Text('Drive App', style: TextStyle(color: Colors.white, fontSize: 24)),
              ],
            ),
          ),
          ListTile(leading: const Icon(Icons.home), title: const Text('My Drive'), selected: true, onTap: () {}),
          ListTile(leading: const Icon(Icons.people), title: const Text('Shared with me'), onTap: () {}),
          ListTile(leading: const Icon(Icons.star), title: const Text('Starred'), onTap: () {}),
          ListTile(leading: const Icon(Icons.schedule), title: const Text('Recent'), onTap: () {}),
          const Divider(),
          ListTile(leading: const Icon(Icons.delete), title: const Text('Trash'), onTap: () {}),
          ListTile(leading: const Icon(Icons.cloud_queue), title: const Text('Storage'), subtitle: const Text('2.5 GB of 15 GB used'), onTap: () {}),
        ],
      ),
    );
  }
}
