import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(KartuNama());
}

class KartuNama extends StatelessWidget {
  const KartuNama ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kartu Nama",
      home:  const KartuNamaScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class KartuNamaScreen extends StatelessWidget {
  const KartuNamaScreen ({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 84, 180),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage('https://images.pexels.com/photos/33966108/pexels-photo-33966108.jpeg'),
            ),
            SizedBox(
              height: 10
            ),
            Text(
              "Luthfi Ferdinan Muslih",
              style: GoogleFonts.playwriteUsTrad(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 255, 255, 255)
              ),
            ),
            SizedBox(
              height: 10
            ),
            Text(
              "MAHASISWA & PROGRAMMER",
              style: GoogleFonts.oswald(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 156, 156, 156)
              ),
            ),

            SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                thickness: 3,
              ),
            ),

            Card(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: Icon(Icons.phone),
                title: Text(
                  "0852-1404-6718",
                  style: GoogleFonts.merriweather(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 0, 0, 0)
                  )
                )
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: Icon(Icons.email),
                title: Text(
                  "luthfiferd@gmail.com",
                  style: GoogleFonts.merriweather(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 0, 0, 0)
                  )
                )
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                leading: Icon(Icons.location_on),
                title: Text(
                  "JL. ARIA CIKONDANG GG HARAPAN II RT.001/RW.013",
                  style: GoogleFonts.ubuntu(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 0, 0, 0)
                  )
                )
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: Icon(FontAwesomeIcons.instagram),
                title: Text(
                  "@luthfiii_f",
                  style: GoogleFonts.robotoSlab(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 0, 0, 0)
                  )
                )
              ),
            ),
          ],
        )
      )
    );
  }
}