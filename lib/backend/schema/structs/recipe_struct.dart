// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecipeStruct extends FFFirebaseStruct {
  RecipeStruct({
    String? body,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _body = body,
        _name = name,
        super(firestoreUtilData);

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  set body(String? val) => _body = val;

  bool hasBody() => _body != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static RecipeStruct fromMap(Map<String, dynamic> data) => RecipeStruct(
        body: data['body'] as String?,
        name: data['Name'] as String?,
      );

  static RecipeStruct? maybeFromMap(dynamic data) =>
      data is Map ? RecipeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'body': _body,
        'Name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'body': serializeParam(
          _body,
          ParamType.String,
        ),
        'Name': serializeParam(
          _name,
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
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RecipeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RecipeStruct && body == other.body && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([body, name]);
}

RecipeStruct createRecipeStruct({
  String? body,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RecipeStruct(
      body: body,
      name: name,
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
