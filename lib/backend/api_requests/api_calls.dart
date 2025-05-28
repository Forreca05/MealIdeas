import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class BarcodeCallCall {
  static Future<ApiCallResponse> call({
    String? valueBarCode = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'BarcodeCall',
      apiUrl: 'https://barcodes1.p.rapidapi.com/',
      callType: ApiCallType.GET,
      headers: {
        'x-rapidapi-host': 'barcodes1.p.rapidapi.com',
        'x-rapidapi-key': '7f492fca8bmsha2ad0d86edc46b9p1d7428jsn6daf97c8e03e',
      },
      params: {
        'query': valueBarCode,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? productname(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.product.title''',
      ));
}

class GetFoodInforCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'get food infor',
      apiUrl:
          'https://world.openfoodfacts.net/api/v2/product/8723400945246?fields=product_name',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GeminiCall {
  static Future<ApiCallResponse> call({
    String? ingredientsList = '',
    String? alergents = '',
    String? dislikes = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "role": "user",
      "parts": [
        {
          "text": "Hi, you are going to perform the role of a special Chef.\\n\\nYou must consider the following:\\n- The list of ingredients I have (below), including their quantities and expiration dates.${escapeStringForJson(ingredientsList)}\\n- My dietary dislikes${escapeStringForJson(dislikes)}.\\n- My allergens${escapeStringForJson(alergents)}.\\n\\nUsing this information, create a recipe that includes some of the ingredients I already have. You may add other ingredients if necessary.\\n\\nYour recipe should aim to minimize food waste. Additionally, provide tips on how to reuse scraps or leftovers in environmentally friendly ways.\\n\\nIngredients: ${escapeStringForJson(ingredientsList)}\\nAllergens: ${escapeStringForJson(alergents)}\\nDislikes: ${escapeStringForJson(dislikes)}\\n\\nRespond strictly in the following format, in a single plain-text output without extra paragraphs or conversational interaction:\\n\\n<Title of the Recipe> Ingredients (that I have):\\\\n- item 1\\\\n- item 2\\\\n...\\\\nIngredients (needed):\\\\n- item A\\\\n- item B\\\\n...\\\\n\\\\nRecipe:\\\\nStep-by-step instructions...\\\\n\\\\nWaste Reduction Tips:\\\\n- tip 1\\\\n- tip 2\\\\n..."
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Gemini ',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyD6g8CsEgFFOLJgf_HHQK6IBD5-Y7ua0iQ',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.candidates[:].content.parts[:].text''',
      ));
}

class GeminiCopyCall {
  static Future<ApiCallResponse> call({
    dynamic? ingredientsListJson,
    String? alergents = '',
    List<String>? dislikesList,
  }) async {
    final dislikes = _serializeList(dislikesList);
    final ingredientsList = _serializeJson(ingredientsListJson, true);
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "role": "user",
      "parts": [
        {
          "text": "You are a special Chef who creates recipes based on available ingredients, dietary restrictions, and environmental consciousness.          Here are the details:          My ingredients:\${jsonEncode(${ingredientsList})} My allergens:\${jsonEncode(${escapeStringForJson(alergents)})}"}]}]}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Gemini  Copy',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyDm-7ajC0VqKo5yFNoOrq9Ps5A-yH6ri3U',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
