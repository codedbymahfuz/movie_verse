class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  final dynamic responsiveData;
  final String errorMessage;

  NetworkResponse({
    required this.statusCode,
    required this.isSuccess,
    this.responsiveData,
    this.errorMessage = "Something Wrong",
  });
}
