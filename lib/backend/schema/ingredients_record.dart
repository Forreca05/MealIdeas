import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IngredientsRecord extends FirestoreRecord {
  IngredientsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ingredient_name" field.
  String? _ingredientName;
  String get ingredientName => _ingredientName ?? '';
  bool hasIngredientName() => _ingredientName != null;

  // "ingredient_quantity" field.
  int? _ingredientQuantity;
  int get ingredientQuantity => _ingredientQuantity ?? 0;
  bool hasIngredientQuantity() => _ingredientQuantity != null;

  // "expiration_date" field.
  DateTime? _expirationDate;
  DateTime? get expirationDate => _expirationDate;
  bool hasExpirationDate() => _expirationDate != null;

  void _initializeFields() {
    _ingredientName = snapshotData['ingredient_name'] as String?;
    _ingredientQuantity = castToType<int>(snapshotData['ingredient_quantity']);
    _expirationDate = snapshotData['expiration_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ingredients');

  static Stream<IngredientsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IngredientsRecord.fromSnapshot(s));

  static Future<IngredientsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IngredientsRecord.fromSnapshot(s));

  static IngredientsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IngredientsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IngredientsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IngredientsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IngredientsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IngredientsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIngredientsRecordData({
  String? ingredientName,
  int? ingredientQuantity,
  DateTime? expirationDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ingredient_name': ingredientName,
      'ingredient_quantity': ingredientQuantity,
      'expiration_date': expirationDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class IngredientsRecordDocumentEquality implements Equality<IngredientsRecord> {
  const IngredientsRecordDocumentEquality();

  @override
  bool equals(IngredientsRecord? e1, IngredientsRecord? e2) {
    return e1?.ingredientName == e2?.ingredientName &&
        e1?.ingredientQuantity == e2?.ingredientQuantity &&
        e1?.expirationDate == e2?.expirationDate;
  }

  @override
  int hash(IngredientsRecord? e) => const ListEquality()
      .hash([e?.ingredientName, e?.ingredientQuantity, e?.expirationDate]);

  @override
  bool isValidKey(Object? o) => o is IngredientsRecord;
}
