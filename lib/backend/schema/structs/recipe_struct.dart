// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecipeStruct extends FFFirebaseStruct {
  RecipeStruct({
    String? body,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _body = body,
        super(firestoreUtilData);

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  set body(String? val) => _body = val;

  bool hasBody() => _body != null;

  static RecipeStruct fromMap(Map<String, dynamic> data) => RecipeStruct(
        body: data['body'] as String?,
      );

  static RecipeStruct? maybeFromMap(dynamic data) =>
      data is Map ? RecipeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'body': _body,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'body': serializeParam(
          _body,
          ParamType.String,
        ),
      }.withoutNulls;

  static RecipeStruct fromSerializableMap(Map<String, dynamic> data) =>
      RecipeStruct(
        body: deserializeParam(
          data['body'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RecipeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RecipeStruct && body == other.body;
  }

  @override
  int get hashCode => const ListEquality().hash([body]);
}

RecipeStruct createRecipeStruct({
  String? body,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RecipeStruct(
      body: body,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RecipeStruct? updateRecipeStruct(
  RecipeStruct? recipe, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    recipe
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRecipeStructData(
  Map<String, dynamic> firestoreData,
  RecipeStruct? recipe,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (recipe == null) {
    return;
  }
  if (recipe.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && recipe.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final recipeData = getRecipeFirestoreData(recipe, forFieldValue);
  final nestedData = recipeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = recipe.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRecipeFirestoreData(
  RecipeStruct? recipe, [
  bool forFieldValue = false,
]) {
  if (recipe == null) {
    return {};
  }
  final firestoreData = mapToFirestore(recipe.toMap());

  // Add any Firestore field values
  recipe.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRecipeListFirestoreData(
  List<RecipeStruct>? recipes,
) =>
    recipes?.map((e) => getRecipeFirestoreData(e, true)).toList() ?? [];
