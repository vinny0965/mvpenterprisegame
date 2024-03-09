import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class QuestaoARecord extends FirestoreRecord {
  QuestaoARecord._(
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
          ? parent.collection('questao_A')
          : FirebaseFirestore.instance.collectionGroup('questao_A');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('questao_A').doc(id);

  static Stream<QuestaoARecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestaoARecord.fromSnapshot(s));

  static Future<QuestaoARecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestaoARecord.fromSnapshot(s));

  static QuestaoARecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestaoARecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestaoARecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestaoARecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestaoARecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestaoARecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestaoARecordData({
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

class QuestaoARecordDocumentEquality implements Equality<QuestaoARecord> {
  const QuestaoARecordDocumentEquality();

  @override
  bool equals(QuestaoARecord? e1, QuestaoARecord? e2) {
    return e1?.alternativa == e2?.alternativa && e1?.correta == e2?.correta;
  }

  @override
  int hash(QuestaoARecord? e) =>
      const ListEquality().hash([e?.alternativa, e?.correta]);

  @override
  bool isValidKey(Object? o) => o is QuestaoARecord;
}
