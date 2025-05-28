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

import 'index.dart'; // Imports other custom actions
import 'package:http/http.dart' as http;
import 'dart:convert';

Future performAPIGEMINI(
  List<InfoProductStruct> engridient,
  List<String> deslikes,
  List<String> allergens, // Add allergens as a parameter
) async {
  // Convert the arguments to strings
  // Assuming InfoProductStruct has a toString() method that returns the relevant string representation
  String ingredientsString =
      '[${engridient.map((item) => '"${item.toString()}"').join(',')}]';
  String dislikesString = '[${deslikes.map((item) => '"$item"').join(',')}]';

  // Format allergens correctly
  String allergensString = '[${allergens.map((item) => '"$item"').join(',')}]';

  // Prepare the API URL.  **Replace YOUR_GEMINI_API_ENDPOINT with your actual Gemini API endpoint.**
  String apiUrl = 'YOUR_GEMINI_API_ENDPOINT';

  // Create the request body.  This is based on the JSON structure from the earlier conversation.
  Map<String, dynamic> requestBody = {
    "contents": [
      {
        "role": "user",
        "parts": [
          {
            "text":
                "Hi, you are going to perform the role of a special Chef.\n\nYou have to take into account the list of ingredients I have (below), my dislikes, the quantity, and expiration dates.\n\nBased on that, create a recipe using some of those ingredients. You may add other ingredients if necessary.\n\nBe environmentally conscious: make the recipe waste as little as possible. Also, give tips on how to reuse scraps or leftovers.\n\nmy ingredients: $ingredientsString\nmy allergens: $allergensString\nmy dislikes: $dislikesString\n\nRespond strictly in the following JSON format:\n{\n \"title\": \"<Title of the Recipe>\",\n \"body\": \"Ingredients (that I have):\\n- item 1\\n- item 2\\n...\\nIngredients (needed):\\n- item A\\n- item B\\n...\\n\\nRecipe:\\nStep-by-step instructions...\\n\\nWaste Reduction Tips:\\n- tip 1\\n- tip 2\\n...\"\n}"
          }
        ]
      }
    ]
  };

  // Convert the request body to JSON string
  String jsonBody = jsonEncode(requestBody);

  // Make the API call
  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json', // Important: Set the content type
      },
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      // API call successful
      print('API Response: ${response.body}');
      // You can further process the response here, e.g., decode the JSON
      // and update your FlutterFlow app state.
      // Example:
      Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      String recipeTitle = decodedResponse['title'];
      // ... and so on.  You'll need to know the structure of the response.
    } else {
      // API call failed
      print('API Request failed with status: ${response.statusCode}.');
      print(
          'Response body: ${response.body}'); // Print the response body for debugging
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}
