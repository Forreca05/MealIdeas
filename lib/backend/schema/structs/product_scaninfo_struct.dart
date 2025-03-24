// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductScaninfoStruct extends FFFirebaseStruct {
  ProductScaninfoStruct({
    String? title,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  static ProductScaninfoStruct fromMap(Map<String, dynamic> data) =>
      ProductScaninfoStruct(
        title: data['title'] as String?,
      );

  static ProductScaninfoStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductScaninfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProductScaninfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductScaninfoStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProductScaninfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductScaninfoStruct && title == other.title;
  }

  @override
  int get hashCode => const ListEquality().hash([title]);
}

ProductScaninfoStruct createProductScaninfoStruct({
  String? title,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductScaninfoStruct(
      title: title,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductScaninfoStruct? updateProductScaninfoStruct(
  ProductScaninfoStruct? productScaninfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productScaninfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductScaninfoStructData(
  Map<String, dynamic> firestoreData,
  ProductScaninfoStruct? productScaninfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productScaninfo == null) {
    return;
  }
  if (productScaninfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productScaninfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productScaninfoData =
      getProductScaninfoFirestoreData(productScaninfo, forFieldValue);
  final nestedData =
      productScaninfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productScaninfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductScaninfoFirestoreData(
  ProductScaninfoStruct? productScaninfo, [
  bool forFieldValue = false,
]) {
  if (productScaninfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productScaninfo.toMap());

  // Add any Firestore field values
  productScaninfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductScaninfoListFirestoreData(
  List<ProductScaninfoStruct>? productScaninfos,
) =>
    productScaninfos
        ?.map((e) => getProductScaninfoFirestoreData(e, true))
        .toList() ??
    [];
