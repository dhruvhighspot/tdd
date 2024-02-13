class LoginResponse {
  final bool? success;
  final Error? error;
  final String? message;
  final String? token;

  LoginResponse({
    this.success,
    this.error,
    this.message,
    this.token,
  });

  LoginResponse copyWith({
    bool? success,
    Error? error,
    String? message,
    String? token,
  }) {
    return LoginResponse(
      success: success ?? this.success,
      error: error ?? this.error,
      message: message ?? this.message,
      token: token ?? this.token,
    );
  }

  LoginResponse.fromJson(Map<String, dynamic> json)
      : success = json['success'] as bool?,
        error = (json['error'] as Map<String,dynamic>?) != null ? Error.fromJson(json['error'] as Map<String,dynamic>) : null,
        message = json['message'] as String?,
        token = json['token'] as String?;

  Map<String, dynamic> toJson() => {
    'success' : success,
    'error' : error?.toJson(),
    'message' : message,
    'token' : token
  };
}

class Error {
  final String? code;
  final String? message;

  Error({
    this.code,
    this.message,
  });

  Error copyWith({
    String? code,
    String? message,
  }) {
    return Error(
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }

  Error.fromJson(Map<String, dynamic> json)
      : code = json['code'] as String?,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'code' : code,
    'message' : message
  };
}