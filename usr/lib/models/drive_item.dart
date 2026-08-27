class DriveItem {
  final String id;
  final String name;
  final bool isFolder;
  final String size;
  final DateTime lastModified;

  DriveItem({
    required this.id,
    required this.name,
    this.isFolder = false,
    this.size = '',
    required this.lastModified,
  });
}
