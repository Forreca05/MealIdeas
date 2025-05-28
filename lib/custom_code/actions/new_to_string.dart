// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<dynamic> newToString(
  List<InfoProductStruct> engridient,
  List<String> deslikes,
  List<String> allergens,
) async {
  // Add your function code here!
  // Convert the arguments to JSON strings
  String ingredientsString =
      '[${engridient.map((item) => '"${item.toString()}"').join(',')}]';
  String dislikesString = '[${deslikes.map((item) => '"$item"').join(',')}]';
  String allergensString =
      '[${allergens.map((innerList) => '[${innerList.map((item) => '"$item"').join(',')}]').join(',')}]';

  // Return a map containing the formatted strings
  return {
    'ingredients': ingredientsString,
    'dislikes': dislikesString,
    'allergens': allergensString,
  };
}
