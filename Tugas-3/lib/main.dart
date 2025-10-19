import 'package:flutter/material.dart';

void main() {
  runApp(const KalkulatorApp());
}
class KalkulatorApp extends StatelessWidget {
  const KalkulatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator BMI',
      home: KalkulatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class KalkulatorScreen extends StatefulWidget {
  const KalkulatorScreen({super.key});

  @override
  State<KalkulatorScreen> createState() => _KalkulatorScreenState();
}

class _KalkulatorScreenState extends State<KalkulatorScreen> {
  final _berat = TextEditingController();
  final _tinggi = TextEditingController();

  double? _hasilPria;
  double? _hasilWanita;
  String? _keteranganPria;
  String? _keteranganWanita;

  void hitungBMI() {
    final double weight = double.tryParse(_berat.text) ?? 0;
    final double height = double.tryParse(_tinggi.text) ?? 0;

    setState(() {
      if (weight > 0 && height > 0) {
        final double heightInM = height / 100;

        final double bmiPria = weight / (heightInM * heightInM);
        final double bmiWanita = (weight / (heightInM * heightInM)) * 0.95;

        _hasilPria = bmiPria;
        _hasilWanita = bmiWanita;

        if (bmiPria < 18.5) {
          _keteranganPria = "Kurus";
        } else if (bmiPria < 25) {
          _keteranganPria = "Ideal";
        } else if (bmiPria < 30) {
          _keteranganPria = "Gemuk";
        } else {
          _keteranganPria = "Obesitas";
        }

        if (bmiWanita < 18.0) {
          _keteranganWanita = "Kurus";
        } else if (bmiWanita < 24) {
          _keteranganWanita = "Ideal";
        } else if (bmiWanita < 29) {
          _keteranganWanita = "Gemuk";
        } else {
          _keteranganWanita = "Obesitas";
        }
      } else {
        _hasilPria = null;
        _hasilWanita = null;
        _keteranganPria = "Masukkan Data Valid";
        _keteranganWanita = "Masukkan Data Valid";
      }
    });
  }

  void resetData() {
    setState(() {
      _berat.clear();
      _tinggi.clear();
      _hasilPria = null;
      _hasilWanita = null;
      _keteranganPria = null;
      _keteranganWanita = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 110, 255),
        title: const Text(
          'Kalkulator BMI',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: _berat,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.monitor_weight),
                          labelText: 'Berat Badan (kg)',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: _tinggi,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.height),
                          labelText: 'Tinggi Badan (cm)',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 30),

                Container(
                  margin: const EdgeInsets.only(top: 25),
                  width: 130,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Laki-laki",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_hasilPria?.toStringAsFixed(1) ?? '---'),
                          Text(
                            _keteranganPria ?? "Masukkan Data",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const Divider(thickness: 1, color: Colors.black),
                      Column(
                        children: [
                          const Text(
                            "Perempuan",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_hasilWanita?.toStringAsFixed(1) ?? '---'),
                          Text(
                            _keteranganWanita ?? "Masukkan Data",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 10, 255, 2),
                foregroundColor: const Color.fromARGB(255, 0, 0, 0),
              ),
              onPressed: hitungBMI,
              child: const Text(
                'Hitung',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: resetData,
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}