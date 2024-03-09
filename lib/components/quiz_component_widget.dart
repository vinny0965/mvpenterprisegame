import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'quiz_component_model.dart';
export 'quiz_component_model.dart';

class QuizComponentWidget extends StatefulWidget {
  const QuizComponentWidget({
    super.key,
    required this.questionNum,
    required this.questionName,
    required this.isTrue,
  });

  final String? questionNum;
  final String? questionName;
  final bool? isTrue;

  @override
  State<QuizComponentWidget> createState() => _QuizComponentWidgetState();
}

class _QuizComponentWidgetState extends State<QuizComponentWidget> {
  late QuizComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (widget.isTrue!) {
          if (_model.isAnsewered != null) {
            setState(() {
              _model.isAnsewered = null;
            });
            setState(() {
              FFAppState().completedQuestions =
                  FFAppState().completedQuestions + 1;
            });
            setState(() {
              FFAppState().score = FFAppState().score + -1;
            });
          } else {
            setState(() {
              _model.isAnsewered = true;
            });
            setState(() {
              FFAppState().completedQuestions =
                  FFAppState().completedQuestions + 1;
            });
            setState(() {
              FFAppState().score = FFAppState().score + 1;
            });
          }
        } else {
          if (_model.isAnsewered != null) {
            setState(() {
              _model.isAnsewered = null;
            });
            setState(() {
              FFAppState().completedQuestions =
                  FFAppState().completedQuestions + 1;
            });
          } else {
            setState(() {
              _model.isAnsewered = false;
            });
            setState(() {
              FFAppState().completedQuestions =
                  FFAppState().completedQuestions + 1;
            });
          }
        }
      },
      child: Container(
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          color: _model.isAnsewered == true
              ? FlutterFlowTheme.of(context).primary
              : FlutterFlowTheme.of(context).tertiary,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
          border: Border.all(
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 36.0,
                height: 36.0,
                decoration: BoxDecoration(
                  color: const Color(0x0014181B),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.questionNum,
                      'questionNum',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.questionName,
                    'questionName',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
