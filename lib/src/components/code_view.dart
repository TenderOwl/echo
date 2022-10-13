import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highlight/languages/json.dart' as jsonLanguage;
import 'package:flutter_highlight/themes/darcula.dart';

class CodeView extends StatefulWidget {
  final String? sourceCode;
  const CodeView({super.key, this.sourceCode});

  @override
  State<CodeView> createState() => _CodeViewState();
}

class _CodeViewState extends State<CodeView> {
  CodeController? _codeController;

  @override
  void initState() {
    super.initState();

    _codeController = CodeController(
      text: widget.sourceCode,
      language: jsonLanguage.json,
      theme: darculaTheme,
    );
  }

  @override
  void dispose() {
    _codeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CodeField(
      expands: true,
      controller: _codeController!,
      textStyle: GoogleFonts.ibmPlexMono(fontSize: 14),
    );
  }
}
