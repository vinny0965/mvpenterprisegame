import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'credit_payment_model.dart';
export 'credit_payment_model.dart';

class CreditPaymentWidget extends StatefulWidget {
  const CreditPaymentWidget({super.key});

  @override
  State<CreditPaymentWidget> createState() => _CreditPaymentWidgetState();
}

class _CreditPaymentWidgetState extends State<CreditPaymentWidget> {
  late CreditPaymentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreditPaymentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: const SafeArea(
          top: true,
          child: FlutterFlowWebView(
            content: 'https://vinny0965.github.io/musical-ihm-2d-build/',
            height: 883.0,
            verticalScroll: true,
            horizontalScroll: true,
          ),
        ),
      ),
    );
  }
}
