import '../models/drive_item.dart';

class MockDriveService {
  static List<DriveItem> getItems() {
    return [
      DriveItem(id: '1', name: 'Documents', isFolder: true, lastModified: DateTime.now().subtract(const Duration(days: 1))),
      DriveItem(id: '2', name: 'Images', isFolder: true, lastModified: DateTime.now().subtract(const Duration(days: 2))),
      DriveItem(id: '3', name: 'Project Proposal.pdf', size: '2.4 MB', lastModified: DateTime.now()),
      DriveItem(id: '4', name: 'Budget.xlsx', size: '1.1 MB', lastModified: DateTime.now().subtract(const Duration(hours: 5))),
      DriveItem(id: '5', name: 'Vacation Photos', isFolder: true, lastModified: DateTime.now().subtract(const Duration(days: 10))),
      DriveItem(id: '6', name: 'Presentation.pptx', size: '15.2 MB', lastModified: DateTime.now().subtract(const Duration(minutes: 30))),
    ];
  }
}
