// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InfoProductStruct extends FFFirebaseStruct {
  InfoProductStruct({
    String? nome,

    /// Quantidade do produto
    String? quatidade,

    /// Em dias
    DateTime? validade,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nome = nome,
        _quatidade = quatidade,
        _validade = validade,
        super(firestoreUtilData);

  // "Nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "Quatidade" field.
  String? _quatidade;
  String get quatidade => _quatidade ?? '';
  set quatidade(String? val) => _quatidade = val;

  bool hasQuatidade() => _quatidade != null;

  // "Validade" field.
  DateTime? _validade;
  DateTime? get validade => _validade;
  set validade(DateTime? val) => _validade = val;

  bool hasValidade() => _validade != null;

  static InfoProductStruct fromMap(Map<String, dynamic> data) =>
      InfoProductStruct(
        nome: data['Nome'] as String?,
        quatidade: data['Quatidade'] as String?,
        validade: data['Validade'] as DateTime?,
      );

  static InfoProductStruct? maybeFromMap(dynamic data) => data is Map
      ? InfoProductStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Nome': _nome,
        'Quatidade': _quatidade,
        'Validade': _validade,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'Quatidade': serializeParam(
          _quatidade,
          ParamType.String,
        ),
        'Validade': serializeParam(
          _validade,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static InfoProductStruct fromSerializableMap(Map<String, dynamic> data) =>
      InfoProductStruct(
        nome: deserializeParam(
          data['Nome'],
          ParamType.String,
          false,
        ),
        quatidade: deserializeParam(
          data['Quatidade'],
          ParamType.String,
          false,
        ),
        validade: deserializeParam(
          data['Validade'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'InfoProductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InfoProductStruct &&
        nome == other.nome &&
        quatidade == other.quatidade &&
        validade == other.validade;
  }

  @override
  int get hashCode => const ListEquality().hash([nome, quatidade, validade]);
}

InfoProductStruct createInfoProductStruct({
  String? nome,
  String? quatidade,
  DateTime? validade,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InfoProductStruct(
      nome: nome,
      quatidade: quatidade,
      validade: validade,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InfoProductStruct? updateInfoProductStruct(
  InfoProductStruct? infoProduct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    infoProduct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInfoProductStructData(
  Map<String, dynamic> firestoreData,
  InfoProductStruct? infoProduct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (infoProduct == null) {
    return;
  }
  if (infoProduct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && infoProduct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final infoProductData =
      getInfoProductFirestoreData(infoProduct, forFieldValue);
  final nestedData =
      infoProductData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = infoProduct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInfoProductFirestoreData(
  InfoProductStruct? infoProduct, [
  bool forFieldValue = false,
]) {
  if (infoProduct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(infoProduct.toMap());

  // Add any Firestore field values
  infoProduct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInfoProductListFirestoreData(
  List<InfoProductStruct>? infoProducts,
) =>
    infoProducts?.map((e) => getInfoProductFirestoreData(e, true)).toList() ??
    [];
