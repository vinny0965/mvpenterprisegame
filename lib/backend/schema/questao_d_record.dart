import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class QuestaoDRecord extends FirestoreRecord {
  QuestaoDRecord._(
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
          ? parent.collection('questao_D')
          : FirebaseFirestore.instance.collectionGroup('questao_D');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('questao_D').doc(id);

  static Stream<QuestaoDRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestaoDRecord.fromSnapshot(s));

  static Future<QuestaoDRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestaoDRecord.fromSnapshot(s));

  static QuestaoDRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestaoDRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestaoDRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestaoDRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestaoDRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestaoDRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestaoDRecordData({
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

class QuestaoDRecordDocumentEquality implements Equality<QuestaoDRecord> {
  const QuestaoDRecordDocumentEquality();

  @override
  bool equals(QuestaoDRecord? e1, QuestaoDRecord? e2) {
    return e1?.alternativa == e2?.alternativa && e1?.correta == e2?.correta;
  }

  @override
  int hash(QuestaoDRecord? e) =>
      const ListEquality().hash([e?.alternativa, e?.correta]);

  @override
  bool isValidKey(Object? o) => o is QuestaoDRecord;
}
