import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: const TelaSoma(),
    );
    }
}


class TelaSoma extends StatefulWidget{
  const TelaSoma({super.key});

  @override
  State<TelaSoma> createState() => _TelaSomaState();

}


class _TelaSomaState extends State<TelaSoma>{

  final TextEditingController distanciaController = TextEditingController();   //n1
  final TextEditingController velocidadeController = TextEditingController();  //n2
  final TextEditingController consumoController = TextEditingController();     //n3
  final TextEditingController quantidadeController = TextEditingController();  //n4

  double tempoCorrida = 0;
  double combustivelNecessario = 0;
  double combustivelRestante = 0;
  double energiaCarro = 0;

  void tempo(){

    double n1=double.tryParse(distanciaController.text) ?? 0;
    double n2=double.tryParse(velocidadeController.text) ?? 0;

    setState((){
      tempoCorrida = n1 / n2;
    });
  }


  void combustivel(){

    double n3=double.tryParse(consumoController.text) ?? 0;

    setState((){
      combustivelNecessario = tempoCorrida * n3;
    });
  }


   void restante(){

    double n4=double.tryParse(quantidadeController.text) ?? 0;

    setState((){
      combustivelRestante = n4 - combustivelNecessario;
    });
  }


    void energia(){

    double n4=double.tryParse(quantidadeController.text) ?? 0;

    setState((){
      energiaCarro = n4 - combustivelNecessario;
    });
  }


    void tudo(){

    double n1=double.tryParse(distanciaController.text) ?? 0;
    double n2=double.tryParse(velocidadeController.text) ?? 0;
    double n3=double.tryParse(consumoController.text) ?? 0;
    double n4=double.tryParse(quantidadeController.text) ?? 0;

    setState((){
      tempoCorrida = n1 / n2;
      combustivelNecessario = tempoCorrida * n3;
      combustivelRestante = n4 - combustivelNecessario;
      energiaCarro = n4 - combustivelNecessario;
    });
  }


  @override
  Widget build(BuildContext context){


    return Scaffold(
      appBar: AppBar(
        title: const Text("Simulador de Corrida"),
        backgroundColor: Colors.deepPurple,
      ),


      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              controller: distanciaController,
              decoration: const InputDecoration(
                labelText: "Distancia (KM)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),

            
            TextField(
              controller: velocidadeController,
              decoration: const InputDecoration(
                labelText: "Velocidade do Carro",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),


            TextField(
              controller: consumoController,
              decoration: const InputDecoration(
                labelText: "Consumo combustivel (p/h)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),


            TextField(
              controller: quantidadeController,
              decoration: const InputDecoration(
                labelText: "Quantidade inicial de combustivel",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),

            Row(children: [

            ElevatedButton(
              onPressed:  tempo,
              child: const Text("Calcular Tempo"),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed:  combustivel,
              child: const Text("Calcular Combustivel"),
            ),
            const SizedBox(height: 30),
              ],
            ),

            Row(children: [

            ElevatedButton(
              onPressed:  restante,
              child: const Text("Verificar Corrida"),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed:  energia,
              child: const Text("Calcular Energia"),
            ),
            const SizedBox(height: 30),
              ],
            ),
            
            ElevatedButton(
              onPressed:  tudo,
              child: const Text("Calcular Tudo"),
            ),
            const SizedBox(height: 30),

            // Exibe o resultado atual
            Text(
              "Tempo de Corrida: $tempoCorrida",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              "Combustivel necessário: $combustivelNecessario",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              "Combustivel restante: $combustivelRestante",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              "Energia do carro: $energiaCarro",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),


          ],
        ),
      ),
    );
  }
}