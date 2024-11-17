
class AppException implements Exception{

  final message;
  final title;

  AppException([this.message, this.title]);

  @override
  String toString() {
    return "$title $message";
  }

}

class InternetException extends AppException{

  InternetException([String? message]): super(message,"No Internet ");
}

class RequestTimeOut extends AppException{

  RequestTimeOut([String? message]): super(message,"Request Time Out");
}

class ServerException extends AppException{

  ServerException([String? message]): super(message,"Internet Server Error");
}

class InvalidUrlException extends AppException{

  InvalidUrlException([String? message]): super(message,"Invalid Error");
}
class FetchDataException extends AppException{

  FetchDataException([String? message]): super(message,"Error While Communication");
}