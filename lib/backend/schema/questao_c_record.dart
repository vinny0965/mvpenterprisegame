import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class QuestaoCRecord extends FirestoreRecord {
  QuestaoCRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "alternativa" field.
  String? _alternativa;
  String get alternativa => _alternativa ?? '';
  bool hasAlternativa() => _alternativa != null;

  // "correta" field.
  bool? _correta;
  bool get correta => _correta ?? false;
  bool hasCorreta() => _correta != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _alternativa = snapshotData['alternativa'] as String?;
    _correta = snapshotData['correta'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('questao_C')
          : FirebaseFirestore.instance.collectionGroup('questao_C');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('questao_C').doc(id);

  static Stream<QuestaoCRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestaoCRecord.fromSnapshot(s));

  static Future<QuestaoCRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestaoCRecord.fromSnapshot(s));

  static QuestaoCRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestaoCRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestaoCRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestaoCRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestaoCRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestaoCRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestaoCRecordData({
  String? alternativa,
  bool? correta,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'alternativa': alternativa,
      'correta': correta,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestaoCRecordDocumentEquality implements Equality<QuestaoCRecord> {
  const QuestaoCRecordDocumentEquality();

  @override
  bool equals(QuestaoCRecord? e1, QuestaoCRecord? e2) {
    return e1?.alternativa == e2?.alternativa && e1?.correta == e2?.correta;
  }

  @override
  int hash(QuestaoCRecord? e) =>
      const ListEquality().hash([e?.alternativa, e?.correta]);

  @override
  bool isValidKey(Object? o) => o is QuestaoCRecord;
}
