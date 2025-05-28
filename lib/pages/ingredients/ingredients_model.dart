import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/custom_appbar_widget.dart';
import '/components/ingredient_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'ingredients_widget.dart' show IngredientsWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class IngredientsModel extends FlutterFlowModel<IngredientsWidget> {
  ///  Local state fields for this page.

  String? geminiResponse;

  List<String> alergens = [];
  void addToAlergens(String item) => alergens.add(item);
  void removeFromAlergens(String item) => alergens.remove(item);
  void removeAtIndexFromAlergens(int index) => alergens.removeAt(index);
  void insertAtIndexInAlergens(int index, String item) =>
      alergens.insert(index, item);
  void updateAlergensAtIndex(int index, Function(String) updateFn) =>
      alergens[index] = updateFn(alergens[index]);

  String? ingredients;

  ///  State fields for stateful widgets in this page.

  // Model for customAppbar component.
  late CustomAppbarModel customAppbarModel;
  // Models for ingredientList dynamic component.
  late FlutterFlowDynamicModels<IngredientListModel> ingredientListModels;
  // Stores action output result for [Backend Call - API (Gemini )] action in Button widget.
  ApiCallResponse? apiResult;

  @override
  void initState(BuildContext context) {
    customAppbarModel = createModel(context, () => CustomAppbarModel());
    ingredientListModels =
        FlutterFlowDynamicModels(() => IngredientListModel());
  }

  @override
  void dispose() {
    customAppbarModel.dispose();
    ingredientListModels.dispose();
  }
}
