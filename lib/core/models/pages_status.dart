enum Status {
  initial,
  loading,
  error,
  otherError,
  success;

  bool get isInitial => this == Status.initial;

  bool get isLoading => this == Status.loading;

  bool get isError => this == Status.error;

  bool get isOtherError => this == Status.otherError;

  bool get isSuccess => this == Status.success;
}
