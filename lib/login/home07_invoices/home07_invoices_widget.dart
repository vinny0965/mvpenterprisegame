import '/backend/backend.dart';
import '/components/questoes_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home07_invoices_model.dart';
export 'home07_invoices_model.dart';

class Home07InvoicesWidget extends StatefulWidget {
  const Home07InvoicesWidget({
    super.key,
    required this.request,
  });

  final DocumentReference? request;

  @override
  State<Home07InvoicesWidget> createState() => _Home07InvoicesWidgetState();
}

class _Home07InvoicesWidgetState extends State<Home07InvoicesWidget> {
  late Home07InvoicesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Home07InvoicesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<QuizRecord>>(
      future: queryQuizRecordOnce(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: const Color(0xFFF1F4F8),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<QuizRecord> home07InvoicesQuizRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFFF1F4F8),
            appBar: AppBar(
              backgroundColor: const Color(0xFFF1F4F8),
              automaticallyImplyLeading: false,
              title: Text(
                'Trinamento',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Plus Jakarta Sans',
                      color: const Color(0xFF101213),
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                    child: StreamBuilder<List<TreinamentosRecord>>(
                      stream: queryTreinamentosRecord(
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<TreinamentosRecord> textTreinamentosRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final textTreinamentosRecord =
                            textTreinamentosRecordList.isNotEmpty
                                ? textTreinamentosRecordList.first
                                : null;
                        return Text(
                          valueOrDefault<String>(
                            textTreinamentosRecord?.perguntas[0],
                            '0',
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: const Color(0xFF57636C),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: wrapWithModel(
                      model: _model.questoesModel,
                      updateCallback: () => setState(() {}),
                      child: QuestoesWidget(
                        parameter1: valueOrDefault<String>(
                          home07InvoicesQuizRecordList[0].question,
                          'alternativaA',
                        ),
                        parameter2: home07InvoicesQuizRecordList[0].hasId(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 20.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (FFAppState().alternativaCorreta) {
                            context.pushNamed(
                              'complete',
                              queryParameters: {
                                'scoreAchieved': serializeParam(
                                  0,
                                  ParamType.int,
                                ),
                                'totalQuestions': serializeParam(
                                  0,
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                            );
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('errado'),
                                  content: const Text(
                                      'Você selecionou a alternativa incorreta'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        text: 'Verificar',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
