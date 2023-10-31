import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:texparser/results.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ck Parser',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 58, 183, 64)),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Ck Parser'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController latexInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 25,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                "Parse your",
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
                "Ck data",
                style: GoogleFonts.inter(
                    fontSize: 60,
                    fontWeight: FontWeight.w900,
                    color: Colors.green),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                    controller: latexInput,
                    decoration: InputDecoration(
                      hintText: 'Enter your Ck data here...',
                      hintStyle: GoogleFonts.inter(
                        color: Colors.grey,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  if (latexInput.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Enter Ck Editor data",
                        style: GoogleFonts.inter(),
                      ),
                      backgroundColor: Colors.green,
                    ));
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) =>  RichTextScreen(input: latexInput,))));
                  }
                },
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Parse",
                      style: GoogleFonts.inter(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "made with 💌 by athar",
                style: GoogleFonts.inter(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
