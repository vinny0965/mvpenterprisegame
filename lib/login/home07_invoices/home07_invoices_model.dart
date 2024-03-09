import '/components/questoes_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home07_invoices_widget.dart' show Home07InvoicesWidget;
import 'package:flutter/material.dart';

class Home07InvoicesModel extends FlutterFlowModel<Home07InvoicesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for questoes component.
  late QuestoesModel questoesModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    questoesModel = createModel(context, () => QuestoesModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    questoesModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
