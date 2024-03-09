import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TreinamentosRecord extends FirestoreRecord {
  TreinamentosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "specifications" field.
  String? _specifications;
  String get specifications => _specifications ?? '';
  bool hasSpecifications() => _specifications != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "sale_price" field.
  double? _salePrice;
  double get salePrice => _salePrice ?? 0.0;
  bool hasSalePrice() => _salePrice != null;

  // "perguntas" field.
  List<String>? _perguntas;
  List<String> get perguntas => _perguntas ?? const [];
  bool hasPerguntas() => _perguntas != null;

  // "fotos" field.
  List<String>? _fotos;
  List<String> get fotos => _fotos ?? const [];
  bool hasFotos() => _fotos != null;

  // "capa" field.
  String? _capa;
  String get capa => _capa ?? '';
  bool hasCapa() => _capa != null;

  // "tempoCurso" field.
  String? _tempoCurso;
  String get tempoCurso => _tempoCurso ?? '';
  bool hasTempoCurso() => _tempoCurso != null;

  // "liberacao" field.
  bool? _liberacao;
  bool get liberacao => _liberacao ?? false;
  bool hasLiberacao() => _liberacao != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _specifications = snapshotData['specifications'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _salePrice = castToType<double>(snapshotData['sale_price']);
    _perguntas = getDataList(snapshotData['perguntas']);
    _fotos = getDataList(snapshotData['fotos']);
    _capa = snapshotData['capa'] as String?;
    _tempoCurso = snapshotData['tempoCurso'] as String?;
    _liberacao = snapshotData['liberacao'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('treinamentos');

  static Stream<TreinamentosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TreinamentosRecord.fromSnapshot(s));

  static Future<TreinamentosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TreinamentosRecord.fromSnapshot(s));

  static TreinamentosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TreinamentosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TreinamentosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TreinamentosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TreinamentosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TreinamentosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTreinamentosRecordData({
  String? name,
  String? description,
  String? specifications,
  DateTime? createdAt,
  DateTime? modifiedAt,
  double? salePrice,
  String? capa,
  String? tempoCurso,
  bool? liberacao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'specifications': specifications,
      'created_at': createdAt,
      'modified_at': modifiedAt,
      'sale_price': salePrice,
      'capa': capa,
      'tempoCurso': tempoCurso,
      'liberacao': liberacao,
    }.withoutNulls,
  );

  return firestoreData;
}

class TreinamentosRecordDocumentEquality
    implements Equality<TreinamentosRecord> {
  const TreinamentosRecordDocumentEquality();

  @override
  bool equals(TreinamentosRecord? e1, TreinamentosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.specifications == e2?.specifications &&
        e1?.createdAt == e2?.createdAt &&
        e1?.modifiedAt == e2?.modifiedAt &&
        e1?.salePrice == e2?.salePrice &&
        listEquality.equals(e1?.perguntas, e2?.perguntas) &&
        listEquality.equals(e1?.fotos, e2?.fotos) &&
        e1?.capa == e2?.capa &&
        e1?.tempoCurso == e2?.tempoCurso &&
        e1?.liberacao == e2?.liberacao;
  }

  @override
  int hash(TreinamentosRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.specifications,
        e?.createdAt,
        e?.modifiedAt,
        e?.salePrice,
        e?.perguntas,
        e?.fotos,
        e?.capa,
        e?.tempoCurso,
        e?.liberacao
      ]);

  @override
  bool isValidKey(Object? o) => o is TreinamentosRecord;
}
