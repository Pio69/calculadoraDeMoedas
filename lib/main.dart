import 'package:flutter/material.dart';

const List<String> list = <String>['Real', 'Dolar', 'Euro', 'Iene'];

String dropdownValue = list.first;
String dropdownValue2 = list.first;

String valorConvertido = "";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculadora de moedas',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final valor1 = TextEditingController();

  @override
  void dispose() {
    valor1.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de moedas'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _formUI(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (valor1.text != Null && valor1.text != "") {
            if (dropdownValue.toString() == "Real" &&
                dropdownValue2.toString() == "Dolar") {
              double calc = double.parse(valor1.text) * 0.1953125;
              valorConvertido =
                  "${String.fromCharCode(0x24)} ${calc.toStringAsFixed(2)}";
            }

            if (dropdownValue.toString() == "Real" &&
                dropdownValue2.toString() == "Real") {
              double calc = double.parse(valor1.text) * 1;
              valorConvertido =
                  "R${String.fromCharCode(0x24)}${calc.toStringAsFixed(2)}";
            }

            if (dropdownValue.toString() == "Real" &&
                dropdownValue2.toString() == "Euro") {
              double calc = double.parse(valor1.text) * 0.1966;
              valorConvertido = "€${calc.toStringAsFixed(2)}";
            }

            if (dropdownValue.toString() == "Real" &&
                dropdownValue2.toString() == "Iene") {
              double calc = double.parse(valor1.text) * 27.5103;
              valorConvertido = "¥${calc.toStringAsFixed(2)}";
            }

            if (dropdownValue.toString() == "Dolar" &&
                dropdownValue2.toString() == "Dolar") {
              double calc = double.parse(valor1.text) * 1;
              valorConvertido =
                  "${String.fromCharCode(0x24)} ${calc.toStringAsFixed(2)}";
            }

            if (dropdownValue.toString() == "Dolar" &&
                dropdownValue2.toString() == "Real") {
              double calc = double.parse(valor1.text) / 0.1935322;
              valorConvertido =
                  "R${String.fromCharCode(0x24)}${calc.toStringAsFixed(2)}";
            }

            if (dropdownValue.toString() == "Dolar" &&
                dropdownValue2.toString() == "Euro") {
              double calc = double.parse(valor1.text) / 0.9842;
              valorConvertido = "€${calc.toStringAsFixed(2)}";
            }

            if (dropdownValue.toString() == "Dolar" &&
                dropdownValue2.toString() == "Iene") {
              double calc = double.parse(valor1.text) / 0.0070343;
              valorConvertido = "¥${calc.toStringAsFixed(2)}";
            }

            if (dropdownValue.toString() == "Euro" &&
                dropdownValue2.toString() == "Dolar") {
              double calc = double.parse(valor1.text) / 1.0164668;
              valorConvertido =
                  "${String.fromCharCode(0x24)} ${calc.toStringAsFixed(2)}";
            }

            if (dropdownValue.toString() == "Euro" &&
                dropdownValue2.toString() == "Real") {
              double calc = double.parse(valor1.text) / 0.1967187;
              valorConvertido =
                  "R${String.fromCharCode(0x24)}${calc.toStringAsFixed(2)}";
            }

            if (dropdownValue.toString() == "Euro" &&
                dropdownValue2.toString() == "Euro") {
              double calc = double.parse(valor1.text) * 1;
              valorConvertido = "€${calc.toStringAsFixed(2)}";
            }

            if (dropdownValue.toString() == "Euro" &&
                dropdownValue2.toString() == "Iene") {
              double calc = double.parse(valor1.text) / 0.0071502;
              valorConvertido = "¥${calc.toStringAsFixed(2)}";
            }

            if (dropdownValue.toString() == "Iene" &&
                dropdownValue2.toString() == "Dolar") {
              double calc = double.parse(valor1.text) / 142.1706617;
              valorConvertido =
                  "${String.fromCharCode(0x24)} ${calc.toStringAsFixed(2)}";
            }

            if (dropdownValue.toString() == "Iene" &&
                dropdownValue2.toString() == "Real") {
              double calc = double.parse(valor1.text) / 27.5178866;
              valorConvertido =
                  "R${String.fromCharCode(0x24)}${calc.toStringAsFixed(2)}";
            }

            if (dropdownValue.toString() == "Iene" &&
                dropdownValue2.toString() == "Euro") {
              double calc = double.parse(valor1.text) / 139.8562278;
              valorConvertido = "€${calc.toStringAsFixed(2)}";
            }

            if (dropdownValue.toString() == "Iene" &&
                dropdownValue2.toString() == "Iene") {
              double calc = double.parse(valor1.text) * 1;
              valorConvertido = "¥${calc.toStringAsFixed(2)}";
            }

            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  // Retrieve the text the that user has entered by using the
                  // TextEditingController.
                  content: Text("Resultado: ${valorConvertido}"),
                );
              },
            );
          } else {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  // Retrieve the text the that user has entered by using the
                  // TextEditingController.
                  content: const Text("Informe um valor válido!"),
                );
              },
            );
          }
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.play_arrow),
        backgroundColor: Colors.red,
      ),
    );
  }

  Widget _formUI() {
    return Column(
      children: <Widget>[
        TextFormField(
          controller: valor1,
        ),
        SizedBox(
            width: 400.0,
            child: DropdownButton<String>(
              value: dropdownValue,
              style: const TextStyle(color: Colors.black, fontSize: 17),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )),
        SizedBox(
            width: 400.0,
            child: DropdownButton<String>(
              value: dropdownValue2,
              elevation: 16,
              style: const TextStyle(color: Colors.black, fontSize: 17),
              onChanged: (String? value) => setState(() {
                dropdownValue2 = value ?? "";
              }),
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )),
      ],
    );
  }
}
