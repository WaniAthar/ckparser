import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tex/flutter_tex.dart';

class RichTextScreen extends StatefulWidget {
  const RichTextScreen({super.key, required this.input});
  final TextEditingController input;
  @override
  State<RichTextScreen> createState() => _RichTextScreenState();
}

class _RichTextScreenState extends State<RichTextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Rendered",
          style: GoogleFonts.inter(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              "Your Rendered",
              style: GoogleFonts.inter(
                  fontSize: 60,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              "Result...",
              style: GoogleFonts.inter(
                  fontSize: 60,
                  fontWeight: FontWeight.w900,
                  color: Colors.green),
              textAlign: TextAlign.left,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 400,
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TeXView(
                renderingEngine: const TeXViewRenderingEngine.katex(),
                child: TeXViewDocument("\r${widget.input.text}"),
              ),
            ),
          ),
          Center(
            child: FloatingActionButton(
              tooltip: "Go back",
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.chevron_left_rounded),
            ),
          )
        ],
      ),
    );
  }
}
