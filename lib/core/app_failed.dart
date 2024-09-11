import 'package:dio/dio.dart';
abstract class Failure{
  final String errMessage;

  const Failure(this.errMessage);

}
class ServerFailure extends Failure {
   ServerFailure(super.errMessage);

   factory ServerFailure.fromDioException(DioException dioException){
     switch(dioException.type){
       case DioExceptionType.connectionTimeout:
           return ServerFailure("connection TimeOut");


       case DioExceptionType.sendTimeout:
         return ServerFailure("send TimeOut");


       case DioExceptionType.receiveTimeout:
         return ServerFailure("receive TimeOut");


       case DioExceptionType.badCertificate:
         return ServerFailure("error");


       case DioExceptionType.badResponse:
         return ServerFailure.fromResponse(dioException.response!.statusCode,
             dioException.response!.data);



       case DioExceptionType.cancel:
       return ServerFailure('Request to ApiServer was canceld');


       case DioExceptionType.connectionError:
         return ServerFailure('No Network');


       case DioExceptionType.unknown:
         if (dioException.message!.contains("SocketException")){
           return ServerFailure("No Internet Connection");
         }
           return ServerFailure("Unexpected Error, Please try again!");
       default:
         return ServerFailure('Opps There was an Error, Please try again');
     }


     }
     factory ServerFailure.fromResponse(int?statusCode,dynamic response){
       if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
         return ServerFailure(response['error']['message']);
       } else if (statusCode == 404) {
         return ServerFailure(
             "Your Request not found , please try again later");
       } else if (statusCode == 500) {
         return ServerFailure("Internal Server error, Please try later")
         ;
       } else {
         return ServerFailure('Opps There was an Error, Please try again');
       }
     }
   }



