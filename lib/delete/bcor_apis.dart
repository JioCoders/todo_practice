// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
// import 'package:management_app/models/base_model.dart';
// import 'package:management_app/ui/mtd/app_const.dart';
// import 'package:management_app/ui/mtd/models/mtd_location_model.dart';
// import 'package:management_app/ui/mtd/models/mtds_model.dart';
// import 'dart:convert' show json, jsonDecode, utf8;
// import 'package:xml/xml.dart' as xml;

// class BcorApis {
//   static final BcorApis _apiHandler = BcorApis._internal();

//   factory BcorApis() {
//     return _apiHandler;
//   }

//   BcorApis._internal();

//   static const String baseURLRunner =
//       "http://40.65.182.43/RunnerAPP/webservice.asmx";
//   static const String baseURLEmp =
//       "http://40.65.182.43/Reportapp_dev/webservice.asmx";
//   static var uriRunner = Uri.parse(baseURLRunner);
//   static var uriEmployee = Uri.parse(baseURLEmp);

//   var platform = const MethodChannel('flutter_to_native');
//   static const responseString = 'Response';
//   static const resultString = 'Result';

// //-----------------requests---------------------
//   Future<bool> soapRunnerSubmitOrderRequest(
//       String apiName,
//       String phleboId,
//       String barcodes,
//       String lat,
//       String long,
//       String address,
//       remark,
//       handoverMode,
//       vahiclePhoto,
//       vahicleNumber,
//       personPhoto,
//       personNumber) async {
//     debugPrint('phleboId=>$phleboId');
//     debugPrint('barcodes=>$barcodes');
//     debugPrint('Laatitude=>$lat');
//     debugPrint('Longitude=>$long');
//     debugPrint('Address=>$address');

//     phleboId = await platform.invokeMethod("encrypt", {"data": phleboId});
//     barcodes = await platform.invokeMethod("encrypt", {"data": barcodes});
//     lat = await platform.invokeMethod("encrypt", {"data": lat});
//     long = await platform.invokeMethod("encrypt", {"data": long});
//     address = await platform.invokeMethod("encrypt", {"data": address});
//     remark = await platform.invokeMethod("encrypt", {"data": remark});
//     vahiclePhoto =
//         await platform.invokeMethod("encrypt", {"data": vahiclePhoto});
//     vahicleNumber =
//         await platform.invokeMethod("encrypt", {"data": vahicleNumber});
//     personPhoto = await platform.invokeMethod("encrypt", {"data": personPhoto});
//     personNumber =
//         await platform.invokeMethod("encrypt", {"data": personNumber});
//     handoverMode =
//         await platform.invokeMethod("encrypt", {"data": handoverMode});

//     String selectedDate = getBoxStringValue(boxSelectedDate);
//     selectedDate =
//         await platform.invokeMethod("encrypt", {"data": selectedDate});

//     String soapEnvelope = '''
// <?xml version="1.0" encoding="utf-8"?>
// <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
//   <soap:Body>
//     <$apiName xmlns="$baseURLRunner">
//       <RunnerID>$phleboId</RunnerID>
//       <Barcodes>$barcodes</Barcodes>
//       <Lat>$lat</Lat>
//       <Long>$long</Long>
//       <Address>$address</Address>
//       <Remark>$remark</Remark>
//       <handover_by>$handoverMode</handover_by>
//       <vahicle_photo>$vahiclePhoto</vahicle_photo>
//       <vahicle_num>$vahicleNumber</vahicle_num>
//       <person_photo>$personPhoto</person_photo>
//       <person_num>$personNumber</person_num>
//       <SampleDate>$selectedDate</SampleDate>
//     </$apiName>
//   </soap:Body>
// </soap:Envelope>
// ''';
//     String apiResponseString = '$apiName$responseString';
//     String apiResultString = '$apiName$resultString';
//     return soapRunnerSubmitOrderResponse(
//         soapEnvelope, apiResponseString, apiResultString);
//   }

//   Future<bool> soapMTDSubmitRequest(
//     String apiName,
//     String phleboId,
//     String mtds,
//     String lat,
//     String long,
//     String address,
//     remarkCTR,
//   ) async {
//     debugPrint('phleboId=>$phleboId');
//     debugPrint('barcodes=>$mtds');
//     debugPrint('Laatitude=>$lat');
//     debugPrint('Longitude=>$long');
//     debugPrint('Address=>$address');

//     phleboId = await platform.invokeMethod("encrypt", {"data": phleboId});
//     mtds = await platform.invokeMethod("encrypt", {"data": mtds});
//     lat = await platform.invokeMethod("encrypt", {"data": lat});
//     long = await platform.invokeMethod("encrypt", {"data": long});
//     address = await platform.invokeMethod("encrypt", {"data": address});
//     String selectedDate = getBoxStringValue(boxSelectedDate);
//     selectedDate =
//         await platform.invokeMethod("encrypt", {"data": selectedDate});

//     String soapEnvelope = '''
// <?xml version="1.0" encoding="utf-8"?>
// <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
//   <soap:Body>
//     <$apiName xmlns="$baseURLEmp">
//       <RunnerID>$phleboId</RunnerID>
//       <Barcodes>$mtds</Barcodes>
//       <Lat>$lat</Lat>
//       <Long>$long</Long>
//       <Address>$address</Address>
//       <SampleDate>$selectedDate</SampleDate>
//     </$apiName>
//   </soap:Body>
// </soap:Envelope>
// ''';
//     String apiResponseString = '$apiName$responseString';
//     String apiResultString = '$apiName$resultString';
//     return soapMTDSubmitResponse(
//         soapEnvelope, apiResponseString, apiResultString);
//   }

//   Future<List<MTDsModel>> soapMTDShowRequest(
//       String apiName, String phleboId, String companyId, String mtdDate) async {
//     debugPrint('phleboId=>$phleboId');
//     debugPrint('companyId=>$companyId');
//     debugPrint('mtdDate=>$mtdDate');
//     // phleboId = await platform.invokeMethod("encrypt", {"data": phleboId});
//     // String selectedDate = getBoxStringValue(boxSelectedDate);
//     String selectedDate = mtdDate;
//     // selectedDate =
//     //     await platform.invokeMethod("encrypt", {"data": selectedDate});
//     // companyId = await platform.invokeMethod("encrypt", {"data": companyId});

//     String soapEnvelope = '''
// <?xml version="1.0" encoding="utf-8"?>
// <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
//   <soap:Body>
//     <$apiName xmlns="$baseURLEmp">
//       <RunnerID>$phleboId</RunnerID>
//       <company_id>$companyId</company_id>
//       <mtd_date>$selectedDate</mtd_date>
//     </$apiName>
//   </soap:Body>
// </soap:Envelope>
// ''';
//     String apiResponseString = '$apiName$responseString';
//     String apiResultString = '$apiName$resultString';
//     return getMTDShowResponse(soapEnvelope, apiResponseString, apiResultString);
//   }

//   Future<List<MTDLocationModel>> soapGetRJLabLocationRequest(
//       String apiName, String phleboId) async {
//     debugPrint('phleboId=>$phleboId');
//     phleboId = await platform.invokeMethod("encrypt", {"data": phleboId});
//     String selectedDate = getBoxStringValue(boxSelectedDate);
//     selectedDate =
//         await platform.invokeMethod("encrypt", {"data": selectedDate});

//     String soapEnvelope = '''
// <?xml version="1.0" encoding="utf-8"?>
// <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
//   <soap:Body>
//     <$apiName xmlns="$baseURLEmp">
//       <RunnerID>$phleboId</RunnerID>
//       <SampleDate>$selectedDate</SampleDate>
//     </$apiName>
//   </soap:Body>
// </soap:Envelope>
// ''';
//     String apiResponseString = '$apiName$responseString';
//     String apiResultString = '$apiName$resultString';
//     return getRJLabLocationResponse(
//         soapEnvelope, apiResponseString, apiResultString);
//   }

// //-----------------responses---------------------
//   Future<bool> soapRunnerSubmitOrderResponse(
//       String soapEnvelope, String responseTag, String resultTag) async {
//     debugPrint(soapEnvelope);
//     http.Response response = await http
//         .post(uriRunner,
//             headers: {
//               "Content-Type": "text/xml; charset=utf-8",
//               "Accept": "text/xml"
//             },
//             body: soapEnvelope)
//         .timeout(const Duration(seconds: 80));

//     debugPrint(response.body.toString());

//     var dataXML =
//         await parsingXmlGetElement(response.body, responseTag, resultTag);

//     if (response.statusCode == 200) {
//       // String decryptedJson =
//       //     await platform.invokeMethod("decrypt", {"data": dataXML});
//       String decryptedJson = dataXML.replaceAll('\n', '');

//       debugPrint("OTP--->$decryptedJson");

//       return decryptedJson == oneString ? true : false;
//     } else {
//       throw Exception("API call failed please check log");
//     }
//   }

//   Future<bool> soapMTDSubmitResponse(
//       String soapEnvelope, String responseTag, String resultTag) async {
//     debugPrint(soapEnvelope);
//     http.Response response = await http
//         .post(uriEmployee,
//             headers: {
//               "Content-Type": "text/xml; charset=utf-8",
//               "Accept": "text/xml"
//             },
//             body: soapEnvelope)
//         .timeout(const Duration(seconds: 80));

//     debugPrint(response.body.toString());

//     var dataXML =
//         await parsingXmlGetElement(response.body, responseTag, resultTag);

//     if (response.statusCode == 200) {
//       // String decryptedJson =
//       //     await platform.invokeMethod("decrypt", {"data": dataXML});
//       String decryptedJson = dataXML.replaceAll('\n', '');

//       debugPrint("OTP--->$decryptedJson");

//       return decryptedJson == oneString ? true : false;
//     } else {
//       throw Exception("API call failed please check log");
//     }
//   }

//   Future<List<MTDLocationModel>> getRJLabLocationResponse(
//       String soapEnvelope, String responseTag, String resultTag) async {
//     debugPrint(soapEnvelope);
//     http.Response response = await http
//         .post(uriEmployee,
//             headers: {
//               "Content-Type": "text/xml; charset=utf-8",
//               "Accept": "text/xml"
//             },
//             body: soapEnvelope)
//         .timeout(const Duration(seconds: 80));

//     debugPrint(response.body.toString());

//     var dataXML =
//         await parsingXmlGetElement(response.body, responseTag, resultTag);

//     if (response.statusCode == 200) {
//       String decryptedJson =
//           await platform.invokeMethod("decrypt", {"data": dataXML});
//       decryptedJson = decryptedJson.replaceAll('\n', '');
//       // SnapshotModel model =
//       //     SnapshotModel.fromJson(jsonDecode(decryptedJson)[0]);
//       final responseList = <MTDLocationModel>[];
//       try {
//         if (decryptedJson.isNotEmpty && decryptedJson != errorTrString) {
//           putBoxValue(boxCenterLocation, decryptedJson);
//           final tempList = (jsonDecode(decryptedJson) as List)
//               .map((x) => MTDLocationModel.fromJson(x))
//               .toList();
//           responseList.addAll(tempList);
//         } else {
//           return responseList;
//         }
//         debugPrint("resultTagLocation.length=>${responseList.length}");
//         return responseList;
//       } on Exception catch (e) {
//         throw Exception(kFailedtoSend);
//       }
//     } else {
//       throw Exception("API call failed please check log");
//     }
//   }

//   Future<List<MTDsModel>> getMTDShowResponse(
//       String soapEnvelope, String responseTag, String resultTag) async {
//     debugPrint(soapEnvelope);
//     http.Response response = await http
//         .post(uriEmployee,
//             headers: {
//               "Content-Type": "text/xml; charset=utf-8",
//               "Accept": "text/xml"
//             },
//             body: soapEnvelope)
//         .timeout(const Duration(seconds: 80));

//     debugPrint(response.body.toString());

//     var dataXML =
//         await parsingXmlGetElement(response.body, responseTag, resultTag);

//     if (response.statusCode == 200) {
//       String decryptedJson =
//           await platform.invokeMethod("decrypt", {"data": dataXML});
//       decryptedJson = decryptedJson.replaceAll('\n', '');

//       // SnapshotModel model =
//       //     SnapshotModel.fromJson(jsonDecode(decryptedJson)[0]);
//       final responseList = <MTDsModel>[];
//       try {
//         if (decryptedJson.isNotEmpty) {
//           final tempList = (jsonDecode(decryptedJson) as List)
//               .map((x) => MTDsModel.fromJson(x))
//               .toList();
//           responseList.addAll(tempList);
//         } else {
//           return responseList;
//         }
//         debugPrint("resultTag--->${responseList.length}");
//         return responseList;
//       } on Exception catch (e) {
//         throw Exception(kFailedtoSend);
//       }
//     } else {
//       throw Exception("API call failed please check log");
//     }
//   }

//   Future<List<BaseModel>> callAPI(
//       String soapEnvelope, String responseTag, String resultTag) async {
//     debugPrint(soapEnvelope);
//     http.Response response = await http
//         .post(uriEmployee,
//             headers: {
//               "Content-Type": "text/xml; charset=utf-8",
//               "Accept": "text/xml"
//             },
//             body: soapEnvelope)
//         .timeout(const Duration(seconds: 40));

//     var dataXML =
//         await parsingXmlGetElement(response.body, responseTag, resultTag);

//     if (response.statusCode == 200) {
//       String decryptedJson =
//           await platform.invokeMethod("decrypt", {"data": dataXML});

//       debugPrint("ResponseBody: $decryptedJson");

//       List<dynamic> parsedListJson = jsonDecode(decryptedJson);
//       List<BaseModel> itemsList = List<BaseModel>.from(
//           parsedListJson.map((i) => BaseModel.fromJson(i)));

//       return itemsList;
//     } else {
//       throw Exception("API call failed please check log");
//     }
//   }

//   //Parse XML Data
//   Future<String> parsingXmlGetElement(
//       var rawResponse, String verifireResponse, String verifireResult) async {
//     String resElement = "";
//     var rawData = xml.XmlDocument.parse(rawResponse);
//     Iterable<xml.XmlElement> items = rawData.findAllElements(verifireResponse);
//     items.map((xml.XmlElement item) {
//       item.findElements(verifireResult).map((xml.XmlElement node) {
//         resElement = node.text;
//       }).toList();
//     }).toList();
//     return resElement;
//   }

//   Future<String> encrypt(String normalText) async {
//     return await platform.invokeMethod("encrypt", {"data": normalText});
//   }

//   Future<String> decrypt(String encryptedText) async {
//     return await platform.invokeMethod("decrypt", {"data": encryptedText});
//   }
// }
