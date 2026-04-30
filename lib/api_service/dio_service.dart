// import 'dart:collection';
// import 'dart:convert';
// import 'dart:io';
// import 'dart:isolate';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:sant_flutter_appp/utils/ConstantUtils.dart';
// import '../utils/PreferenceUtils.dart';
// import '../utils/Utilities.dart';
//
// class DioService{
//
//   static final _dio = Dio(
//       BaseOptions(
//           connectTimeout: Duration(seconds: 60),
//           // baseUrl: "https://proxy.corsfix.com/?$BASE_URL",
//           // baseUrl: BASE_URL,
//           contentType: Headers.jsonContentType,
//           responseType: ResponseType.json,
//         headers: {
//           'Accept': '*/*',
//           'Access-Control-Allow-Origin': '*',
//         },
//       )
//
//
//   );
//
//   void addTokenAuthentication() {
//     // _dio.options.headers = {
//     //   "token": "c56a5f181199f92812d179f149b1037e",
//     //   "devicetype": "android",
//     //   "appversion": '1',
//     //   "sysdate": DateTime.now().toIso8601String(),
//     // };
//     _dio.interceptors.clear(); // avoid duplicates
//     _dio.interceptors.add(LogInterceptor(
//       requestHeader: true,
//       requestBody: true,
//       request: true,
//       responseBody: true,
//       logPrint: (log) {
//         debugPrint(log.toString());
//       },
//     ));
//   }
//
//
//   Future<Map<String,dynamic>> sync(BuildContext context)async{
//
//     addTokenAuthentication();
//
//     var map = HashMap<String,dynamic>();
//     map['user_id'] =  PreferenceUtils.getString(PREF_USER_ID);
//
//     final request = {
//       "url":SYNC_URL,
//       "data":map,
//     };
//
//     debugPrint("Sync Api Request Params : $request");
//
//     return await _runInIsolate(context, true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> login(BuildContext context,String email,String password) async{
//
//     var map = HashMap<String, String>();
//     map["email"] = email;
//     map["password"] = password;
//
//     final request = {
//       "url":LOGIN_URL,
//       "data":map,
//     };
//
//     debugPrint("login request : $request");
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> forgotPassword(BuildContext context,String email) async{
//
//     var map = HashMap<String, String>();
//     map["email"] = email;
//     final request = {
//       "url":FORGOT_PASSWORD_URL,
//       "data":map,
//     };
//
//     debugPrint("forgotPassword request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> resetPassword(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":RESET_PASSWORD_URL,
//       "data":map,
//     };
//
//     debugPrint("resetPassword request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> updateProfile(BuildContext context,Map<String,dynamic> map,{File? imageFile}) async{
//
//     addTokenAuthentication();
//
//     if(imageFile != null){
//       final fileName = imageFile.path.split("/").last;
//       map["image"] = await MultipartFile.fromFile(imageFile.path,filename: fileName);
//     }
//     final request = {
//       "url": UPDATE_PROFILE_URL,
//       "data":map
//     };
//
//     return await _runInIsolate(context, true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> changePassword(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":CHANGE_PASSWORD_URL,
//       "data":map,
//     };
//
//     debugPrint("changePassword request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> register(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":REGISTER_URL,
//       "data":map,
//     };
//
//     debugPrint("Register request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> questionOfDay(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":QUESTION_OF_DAY_URL,
//       "data":map,
//     };
//
//     debugPrint("QuestionOfDay request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> submitQuestionOfDay(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":SUBMIT_QUESTION_OF_DAY_URL,
//       "data":map,
//     };
//
//     debugPrint("SubmitQuestionOfDay request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> freeQuizList(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":FREE_QUIZ_LIST_URL,
//       "data":map,
//     };
//
//     debugPrint("FreeQuizList request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> premiumContent(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":PREMIUM_CONTENT_URL,
//       "data":map,
//     };
//
//     debugPrint("PremiumContent request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> submitContentReviewQuiz(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":SUBMIT_CONTENT_REVIEW_QUIZ,
//       "data":map,
//     };
//
//     debugPrint("SubmitContentReviewQuiz request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> submitQuiz(BuildContext context,Map<String, dynamic> map) async{
//
//     addTokenAuthentication();
//
//     final request = {
//       "url":SUBMIT_QUIZ,
//       "data":map,
//     };
//
//     debugPrint("SubmitQuiz request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> customizeOption(BuildContext context) async{
//
//     addTokenAuthentication();
//
//     final request = {
//       "url":CUSTOMIZE_OPTION_URL,
//       "data":{},
//     };
//
//     debugPrint("Customize Option request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> customizeTest(BuildContext context,Map<String,dynamic> map) async{
//
//     addTokenAuthentication();
//
//     final request = {
//       "url":CUSTOMIZE_TEST_URL,
//       "data":map,
//     };
//
//     debugPrint("Customize Test request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> quizHistory(BuildContext context,Map<String,dynamic> map) async{
//
//     addTokenAuthentication();
//
//     final request = {
//       "url":QUIZ_HISTORY_URL,
//       "data":map,
//     };
//
//     debugPrint("Quiz History request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> getLeaderBoard(BuildContext context,Map<String,dynamic> map) async{
//
//     addTokenAuthentication();
//
//     final request = {
//       "url":LEADER_BOARD_URL,
//       "data":map,
//     };
//
//     debugPrint("LeaderBoard request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> contentReviewCategory(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":CONTENT_REVIEW_CATEGORY_URL,
//       "data":map,
//     };
//
//     debugPrint("ContentReviewCategory request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> contentReviewSubCategory(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":CONTENT_REVIEW_SUB_CATEGORY_URL,
//       "data":map,
//     };
//
//     debugPrint("ContentReviewSubCategory request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> contentReviewSubject(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":CONTENT_REVIEW_SUBJECT_URL,
//       "data":map,
//     };
//
//     debugPrint("ContentReviewSubject request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> paidQuiz(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":PAID_QUIZ_URL,
//       "data":map,
//     };
//
//     debugPrint("PaidQuiz request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> podCastCategory(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":POD_CAST_CATEGORY_URL,
//       "data":map,
//     };
//
//     debugPrint("PodCast Category request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> podCastList(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":POD_CAST_LIST_URL,
//       "data":map,
//     };
//
//     debugPrint("PodCast List request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> flashCardCategory(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":FLASH_CARD_CATEGORY_URL,
//       "data":map,
//     };
//
//     debugPrint("FlashCard Category request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> getFlashCardList(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":GET_FLASH_CARD_LIST_URL,
//       "data":map,
//     };
//
//     debugPrint("Get FlashCard List request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> favFlashCardList(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":GET_FAV_FLASH_CARD_LIST_URL,
//       "data":map,
//     };
//
//     debugPrint("Fav FlashCard List request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> addFavFlashCard(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":ADD_FAV_FLASH_CARD_URL,
//       "data":map,
//     };
//
//     debugPrint("Add Fav FlashCard request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> matchingCategory(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":MATCHING_CATEGORY_URL,
//       "data":map,
//     };
//
//     debugPrint("Matching Category request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> matchingSubCategory(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":MATCHING_SUB_CATEGORY_URL,
//       "data":map,
//     };
//
//     debugPrint("Matching SubCategory request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> matchingSubject(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":MATCHING_SUBJECT_URL,
//       "data":map,
//     };
//
//     debugPrint("Matching Subject request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> matchingAssignment(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":MATCHING_ASSIGNMENT_URL,
//       "data":map,
//     };
//
//     debugPrint("Matching Assignment request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> digitalPackage(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":DIGITAL_PACKAGE_URL,
//       "data":map,
//     };
//
//     debugPrint("DigitalPackage request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//   Future<Map<String,dynamic>> digitalPackageSubCategory(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":DIGITAL_PACKAGE_SUB_CATEGORY_URL,
//       "data":map,
//     };
//
//     debugPrint("DigitalPackageSubCategory request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//   Future<Map<String,dynamic>> digitalPackageCheckLesson(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":DIGITAL_PACKAGE_CHECK_LESSON_URL,
//       "data":map,
//     };
//
//     debugPrint("DigitalPackageCheckLesson request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> contactUs(BuildContext context,Map<String, dynamic> map) async{
//
//     final request = {
//       "url":CONTACT_US_URL,
//       "data":map,
//     };
//
//     debugPrint("ContactUs request : $request");
//
//     return await _runInIsolate(context,true, request, (json) => json);
//   }
//
//   Future<Map<String,dynamic>> _runInIsolate(BuildContext context,bool isFormData,Map<String,dynamic> params,
//       Function(Map<String,dynamic>) fromJson) async{
//
//     try{
//       var data = params["data"];
//       final method = params["method"] ?? "POST";
//
//       if(isFormData && data is Map<String,dynamic>){
//         debugPrint("data is FormData");
//         data = FormData.fromMap(data);
//       }else if(!isFormData && data is! String){
//         debugPrint("data is JSON");
//         data = jsonEncode(data);
//       }
//
//       debugPrint("method: $method");
//       Response response;
//
//       if (method == 'GET') {
//         response = await _dio.get(params["url"]);
//       } else {
//         response = await _dio.post(params["url"], data: data);
//       }
//
//       final responseData =
//       response.data is String ? jsonDecode(response.data) : response.data;
//
//       if (response.statusCode == 201) {
//         Utilities.showUnAuthorizedDialog(context);
//       }
//
//       return {
//         "statusCode": response.statusCode,
//         "data": responseData,
//         "message": response.statusMessage,
//       };
//
//     }catch(e){
//       debugPrint("Error in request: $e");
//       return {
//         'statusCode': 500,
//         'data': null,
//         'message': e.toString(),
//       };
//     }
//
//     // final ReceivePort receivePort = ReceivePort();
//     // final headers = _dio.options.headers;
//     //
//     // await Isolate.spawn(_isolateEntry, {
//     //   "sendPort":receivePort.sendPort,
//     //   "headers":headers,
//     //   "params":params,
//     //   "isFormData":isFormData
//     // });
//     //
//     // final result = await receivePort.first;
//     //
//     // debugPrint("request params : $params");
//     // debugPrint("result : $result");
//     //
//     // if(result is Map<String,dynamic>){
//     //
//     //   final statusCode = result["statusCode"];
//     //
//     //   if(statusCode == 201){
//     //     Utilities.showUnAuthorizedDialog(context);
//     //   }
//     //
//     //   return {
//     //     "statusCode":result["statusCode"],
//     //     "data":result["data"],
//     //     "message":result["message"]
//     //   };
//     //
//     // }else{
//     //   debugPrint("else isolate :$result");
//     //   throw Exception("Unexpected response: $result");
//     // }
//
//   }
//
//
//   Future<void> _isolateEntry(Map<String,dynamic> map) async{
//
//     final sendPort = map["sendPort"] as SendPort;
//     final headers = map["headers"] as Map<String,dynamic>;
//     final params = map["params"] as Map<String,dynamic>;
//     var isFormData = map["isFormData"] as bool;
//     var isLogin = params["isLogin"];
//     // isFormData ??= false;
//     isLogin ??= false;
//
//     debugPrint("isFormData : $isFormData");
//     debugPrint("headers : $headers");
//
//     try{
//
//       _dio.options.headers = Map<String, dynamic>.from(headers);
//
//
//       var data = params["data"];
//
//       if(isFormData && data is Map<String,dynamic>){
//         debugPrint("data is isForm ");
//         data = FormData.fromMap(data);
//       }else if(!isFormData && data is! String){
//         debugPrint("data is Json");
//         data = jsonEncode(data);
//       }
//
//       final method = params["method"] ?? "POST";
//       debugPrint("method : $method");
//
//       Response response;
//
//       if(method == 'GET'){
//         response = await _dio.get(params["url"]);
//       }
//       else{
//         response = await _dio.post(params["url"],data: data);
//       }
//
//       _sendResponse(sendPort,response);
//
//     }catch(e){
//       sendPort.send({
//         'statusCode':500,
//         'data':null,
//         'message':e.toString()
//       });
//     }
//
//   }
//
//   void _sendResponse(SendPort sendPort,Response response){
//
//     final data = response.data is String ? jsonDecode(response.data) : response.data;
//
//     sendPort.send({
//       'statusCode':response.statusCode,
//       'data':data,
//       'message':response.statusMessage
//     });
//   }
//
// }