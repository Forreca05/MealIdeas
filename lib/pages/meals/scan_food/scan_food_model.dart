import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'scan_food_widget.dart' show ScanFoodWidget;
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScanFoodModel extends FlutterFlowModel<ScanFoodWidget> {
  ///  Local state fields for this page.

  String scantitle = 'Scan a Product';

  ///  State fields for stateful widgets in this page.

  var barcodeRead = '';
  // Stores action output result for [Backend Call - API (BarcodeCall)] action in Container widget.
  ApiCallResponse? apiResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
