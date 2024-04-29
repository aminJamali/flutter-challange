import 'package:dio/dio.dart';

import '../../shared/model/error_action.dart';

class ErrorHandlerViewModel {
  String? statusCode;
  bool? isSuccess;
  String? message;
  ErrorAction? actionError;
  Map<String, List<String>>? errors;

  ErrorHandlerViewModel({
    this.isSuccess,
    this.message,
    this.errors,
    this.statusCode,
    this.actionError = ErrorAction.showDialog,
  });

  ErrorHandlerViewModel.fromJson(final Map<String, dynamic> json) {
    isSuccess = json['isSuccess'] ?? false;
    message = json['message'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['isSuccess'] = isSuccess;
    data['errors'] = errors ?? [];
    data['messages'] = message;
    return data;
  }

  static ErrorHandlerViewModel parseDioError(final Response response) {
    ErrorHandlerViewModel errorViewModel = ErrorHandlerViewModel();

    if (response.data is Map) {
      errorViewModel = ErrorHandlerViewModel.fromJson(response.data);
    }

    response.statusCode = response.statusCode ?? 400;
    errorViewModel.statusCode = response.statusCode.toString();
    return errorViewModel;

  }
}
