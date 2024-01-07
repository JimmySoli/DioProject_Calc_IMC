import 'dart:convert';
import 'dart:io';
import 'package:meu_app_imc/pessoa.dart';

bool contemApenasLetras(String input) {
  return input.runes.every(
      (rune) => (rune >= 65 && rune <= 90) || (rune >= 97 && rune <= 122));
}

void main(List<String> arguments) {
  var pessoa1 = Pessoa('', 0, 0);

  print("Bem Vindo a Calculadora de IMC!");

  String? lerConsole;
  bool nomeValido = false;

  while (!nomeValido) {
    print("Digite o seu nome:");
    lerConsole = stdin.readLineSync(encoding: utf8);
    pessoa1.nome = lerConsole!;

    if (contemApenasLetras(lerConsole)) {
      nomeValido = true;
    } else {
      print("Por favor, digite apenas letras no nome.");
    }
  }

  pessoa1.nome = lerConsole!;

  bool pesoValido = false;
  double peso = 0.0;

  while (!pesoValido) {
    print("Digite seu peso");
    lerConsole = stdin.readLineSync(encoding: utf8);
    peso = double.tryParse(lerConsole ?? '') ?? 0.0;
    if (peso != 0.0) {
      pesoValido = true;
    } else {
      print("Por favor, digite um numero válido para peso. Ex: 80");
    }
  }

  pessoa1.peso = peso;

  print("Digite sua altura:");
  lerConsole = stdin.readLineSync(encoding: utf8);
  pessoa1.altura = double.parse(lerConsole ?? '');

  print(
      "Olá, ${pessoa1.nome}, seu peso é ${pessoa1.peso}Kg, e você tem ${pessoa1.altura.toStringAsFixed(2)} de altura.");

  double imc = pessoa1.peso / (pessoa1.altura * 2);


    switch (imc) {
    case < 16:
      print(
          "Seu imc é de ${imc.toStringAsFixed(1)}, sua classificação é de 'Magreza Grave'.");
      break;

    case < 17:
      print(
          "Seu imc é de ${imc.toStringAsFixed(1)}, sua classificação é de 'Magreza Moderada'.");
      break;

    case < 18.5:
      print(
          "Seu imc é de ${imc.toStringAsFixed(1)}, sua classificação é de 'Magreza Leve'.");
      break;

    case < 25:
      print(
          "Seu imc é de ${imc.toStringAsFixed(1)}, sua classificação é 'Saudável'.");
      break;

    case < 30:
      print(
          "Seu imc é de ${imc.toStringAsFixed(1)}, sua classificação é de 'Sobrepeso'.");
      break;

    case < 35:
      print(
          "Seu imc é de ${imc.toStringAsFixed(1)}, sua classificação é de 'Obesidade Grau 1'.");
      break;

    case < 40:
      print(
          "Seu imc é de ${imc.toStringAsFixed(1)}, sua classificação é de 'Obesidade Grau 2 (severa)'.");
      break;

    default:
      print(
          "Seu imc é de ${imc.toStringAsFixed(1)}, sua classificação é de 'Obesidade Grau 3 (mórbida)'.");
  }
}
