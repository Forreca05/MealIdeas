import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/custom_appbar_widget.dart';
import '/components/ingredient_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ingredients_model.dart';
export 'ingredients_model.dart';

class IngredientsWidget extends StatefulWidget {
  const IngredientsWidget({super.key});

  static String routeName = 'Ingredients';
  static String routePath = 'ingredients';

  @override
  State<IngredientsWidget> createState() => _IngredientsWidgetState();
}

class _IngredientsWidgetState extends State<IngredientsWidget> {
  late IngredientsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IngredientsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Ingredients'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.customAppbarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: CustomAppbarWidget(
                          backButton: true,
                          actionButton: false,
                          optionsButton: false,
                          actionButtonAction: () async {},
                          optionsButtonAction: () async {},
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Text(
                          'What you have',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final ingredientList =
                              FFAppState().Ingredients.map((e) => e).toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: ingredientList.length,
                            itemBuilder: (context, ingredientListIndex) {
                              final ingredientListItem =
                                  ingredientList[ingredientListIndex];
                              return wrapWithModel(
                                model: _model.ingredientListModels.getModel(
                                  ingredientListItem.nome,
                                  ingredientListIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: IngredientListWidget(
                                  key: Key(
                                    'Keypfe_${ingredientListItem.nome}',
                                  ),
                                  parameter1: ingredientListItem.nome,
                                  parameter2: ingredientListItem.quatidade,
                                  parameter3: valueOrDefault<String>(
                                    dateTimeFormat(
                                      "yMd",
                                      ingredientListItem.validade,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    'dd/mm/yyyy',
                                  ),
                                  index: ingredientListIndex,
                                ),
                              );
                            },
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 12.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x1A000000),
                                offset: Offset(
                                  0.0,
                                  -2.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'INGREDIENTS_FIND_RECIPES_WITH_THESE_INGR');
                              logFirebaseEvent('Button_haptic_feedback');
                              HapticFeedback.heavyImpact();
                              logFirebaseEvent('Button_backend_call');
                              _model.apiResult = await GeminiCall.call(
                                ingredientsList: functions.newCustomFunction(
                                    FFAppState().Ingredients.toList()),
                                alergents: functions.tostringFromstringlist(
                                    (currentUserDocument?.allergens?.toList() ??
                                            [])
                                        .toList()),
                                dislikes: functions.tostringFromstringlist(
                                    (currentUserDocument?.ingredientDislikes
                                                ?.toList() ??
                                            [])
                                        .toList()),
                              );

                              if ((_model.apiResult?.succeeded ?? true)) {
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  GeminiResponseWidget.routeName,
                                  queryParameters: {
                                    'recipe': serializeParam(
                                      GeminiCall.response(
                                        (_model.apiResult?.jsonBody ?? ''),
                                      ),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                logFirebaseEvent('Button_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('error'),
                                      content: Text('api fail'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }

                              safeSetState(() {});
                            },
                            text: 'Find Recipes With These Ingredients',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50.0,
                              padding: EdgeInsets.all(8.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
