import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant1/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),

            //name
            Text(
              "SushiBom",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 25),

            //icon
            Center(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset('lib/images/blastblast.png'),
              ),
            ),

            const SizedBox(height: 25),
            
            //title
            Text(
              "Taste of the authentic sushi",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10),
            
            //subtitle
            Text(
              "Experience authentic sushi, anytime, anywhere",
              style: TextStyle(
                color: Colors.grey[300],
                height: 2,
              ),
            ),

            const SizedBox(height: 25),

            //button
            MyButton(text: "Get Started")
          ],
        ),
      ),
    );
  }
}