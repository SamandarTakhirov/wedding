class DirectionLS {
  const DirectionLS({required this.guid, required this.name, required this.owner});

  final String guid;
  final String name;
  final String owner;

  @override
  String toString() => '$guid,$name,$owner';

  static DirectionLS? fromString(String? str) {
    if (str == null) return null;

    final parts = str.split(',');
    if (parts.length != 3) return null;

    return DirectionLS(guid: parts[0], name: parts[1], owner: parts[2]);
  }
}
