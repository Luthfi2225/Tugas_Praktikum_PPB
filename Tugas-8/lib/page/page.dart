import 'package:flutter/material.dart';
import 'package:tugas8/model/theme_provider.dart';
import 'package:tugas8/model/user_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserProvider user;

  late TextEditingController namaController;
  late TextEditingController kelasController;
  late TextEditingController npmController;

  late FocusNode namaFocus;
  late FocusNode kelasFocus;
  late FocusNode npmFocus;

  bool editNama = false;
  bool editKelas = false;
  bool editNpm = false;
  bool kondisi = false;

  @override
  void initState() {
    super.initState();

    user = Provider.of<UserProvider>(context, listen: false);

    user.loadData().then((_) {
      namaController = TextEditingController(text: user.nama);
      kelasController = TextEditingController(text: user.kelas);
      npmController = TextEditingController(text: user.npm);

      namaFocus = FocusNode();
      kelasFocus = FocusNode();
      npmFocus = FocusNode();

      // Listener auto-save
      namaFocus.addListener(() {
        if (!namaFocus.hasFocus && editNama) {
          user.saveNama(namaController.text);
          setState(() => editNama = false);
          Future.delayed(const Duration(seconds: 6), () {
            kondisi = false;
          });
        }
      });

      kelasFocus.addListener(() {
        if (!kelasFocus.hasFocus && editKelas) {
          user.saveKelas(kelasController.text);
          setState(() => editKelas = false);
          Future.delayed(const Duration(seconds: 6), () {
            kondisi = false;
          });
        }
      });

      npmFocus.addListener(() {
        if (!npmFocus.hasFocus && editNpm) {
          user.saveNpm(npmController.text);
          setState(() => editNpm = false);
          Future.delayed(const Duration(seconds: 6), () {
            kondisi = false;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    namaController.dispose();
    kelasController.dispose();
    npmController.dispose();

    namaFocus.dispose();
    kelasFocus.dispose();
    npmFocus.dispose();

    super.dispose();
  }

  Widget rowEditable({
    required String label,
    required TextEditingController controller,
    required FocusNode focusNode,
    required bool isEditing,
    required VoidCallback onEditPress,
    required Function(String) onSubmit,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$label:", style: TextStyle(fontSize: 18)),
          SizedBox(width: 10),

          Expanded(
            child: isEditing
                ? SizedBox(
                    width: 160,
                    height: 30,
                    child: TextField(
                      controller: controller,
                      focusNode: focusNode,
                      autofocus: true,
                    ),
                  )
                : Text(controller.text, style: TextStyle(fontSize: 18)),
          ),

          IconButton(
            icon: Icon(isEditing ? Icons.check : Icons.edit),
            onPressed: () {
              if (isEditing) {
                kondisi = false;
                onSubmit(controller.text);
              } else {
                if (kondisi == true) {
                  kondisi = false;
                  onSubmit(controller.text);
                } else {
                  kondisi = true;
                  onEditPress();
                }
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    user = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengaturan Tema",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  themeProvider.isDarkmode ? 'Mode Ireng' : 'Mode Terang',
                  style: TextStyle(fontSize: 18),
                ),
                Switch(
                  value: themeProvider.isDarkmode,
                  onChanged: (value) => themeProvider.toggleTheme(value),
                ),
              ],
            ),

            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Data User",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            SizedBox(height: 10),

            rowEditable(
              label: "Nama ",
              controller: namaController,
              focusNode: namaFocus,
              isEditing: editNama,
              onEditPress: () {
                setState(() {
                  editNama = true;
                });
              },
              onSubmit: (value) {
                user.saveNama(value);
                setState(() {
                  editNama = false;
                });
              },
            ),

            rowEditable(
              label: "Kelas  ",
              controller: kelasController,
              focusNode: kelasFocus,
              isEditing: editKelas,
              onEditPress: () {
                setState(() {
                  editKelas = true;
                });
              },
              onSubmit: (value) {
                user.saveKelas(value);
                setState(() {
                  editKelas = false;
                });
              },
            ),

            rowEditable(
              label: "NPM   ",
              controller: npmController,
              focusNode: npmFocus,
              isEditing: editNpm,
              onEditPress: () {
                setState(() {
                  editNpm = true;
                });
              },
              onSubmit: (value) {
                user.saveNpm(value);
                setState(() {
                  editNpm = false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
