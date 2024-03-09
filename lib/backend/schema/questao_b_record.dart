import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class QuestaoBRecord extends FirestoreRecord {
  QuestaoBRecord._(
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
          ? parent.collection('questao_B')
          : FirebaseFirestore.instance.collectionGroup('questao_B');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('questao_B').doc(id);

  static Stream<QuestaoBRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestaoBRecord.fromSnapshot(s));

  static Future<QuestaoBRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestaoBRecord.fromSnapshot(s));

  static QuestaoBRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestaoBRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestaoBRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestaoBRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestaoBRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestaoBRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestaoBRecordData({
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

class QuestaoBRecordDocumentEquality implements Equality<QuestaoBRecord> {
  const QuestaoBRecordDocumentEquality();

  @override
  bool equals(QuestaoBRecord? e1, QuestaoBRecord? e2) {
    return e1?.alternativa == e2?.alternativa && e1?.correta == e2?.correta;
  }

  @override
  int hash(QuestaoBRecord? e) =>
      const ListEquality().hash([e?.alternativa, e?.correta]);

  @override
  bool isValidKey(Object? o) => o is QuestaoBRecord;
}
