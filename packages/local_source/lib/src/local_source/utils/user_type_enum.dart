enum UserType {
  client,
  manager,
  undefined;

  bool get isManager => this == manager;
  bool get isClient => this == client;
}
