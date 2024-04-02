import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Code Vidhya',
      // used by the OS task switcher

      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      //above telling SDK to use Meterial3 and generate widget provide by Material 3
      home: SafeArea(
        child: MyScaffold(),
      ),
    ),
  );
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Scaffold(
      // Column is a vertical, linear layout.
      body: Column(
        children: [
          Container(
            child: Image.asset(
              'assets/images/CodeVidhya.png',
              width: 250,
            ),
            padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
          ),
          Container(
            child: Center(
              child: Text(
                'Welcome to CodeVidhya',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            margin: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
          ),
          Container(
            child: Center(
              child: Text(
                'Dive into our curated modules, study at your own pace, and put your knowledge to the test with personalized quizzes.',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                )),
                textAlign: TextAlign.center,
              ),
            ),
            margin: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
          ),
          FilledButton(
              onPressed: () {},

              // style:  ButtonStyle(
              //     backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue.shade900),
              //     foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              //     fixedSize: MaterialStatePropertyAll<Size>(Size.fromWidth(350)),
              //     padding: MaterialStatePropertyAll<EdgeInsetsDirectional>(EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15)),
              //     shape: MaterialStatePropertyAll<RoundedRectangleBorder>( RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0))),
              //     textStyle: MaterialStatePropertyAll<TextStyle>(TextStyle(fontSize: 18,fontWeight: FontWeight.w500))
              // ),

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(7.0), // Adjust the value as needed
                ),
                fixedSize: Size.fromWidth(350),
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                textStyle: GoogleFonts.roboto(
                  fontSize: 18, // Adjust the font size as needed
                  fontWeight:
                      FontWeight.bold, // Adjust the font weight as needed
                ),
              ),
              child: Text('CONTINUE')),
             Center(
              child: Text('I ALREADY HAVE AN ACCOUNT', style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.red),),
            ),

        ],
      ),
    );
  }
}
