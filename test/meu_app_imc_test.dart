import 'package:test/test.dart';

String classificarIMC(double imc) {
  if (imc < 16) {
    return "Magreza Grave";
  } else if (imc >= 16 && imc < 17) {
    return "Magreza Moderada";
  } else if (imc >= 17 && imc < 18.5) {
    return "Magreza Leve";
  } else if (imc >= 18.5 && imc < 25) {
    return "Saudável";
  } else if (imc >= 25 && imc < 30) {
    return "Sobrepeso";
  } else if (imc >= 30 && imc < 35) {
    return "Obesidade Grau 1";
  } else if (imc >= 35 && imc < 40) {
    return "Obesidade Grau 2 (severa)";
  } else {
    return "Obesidade Grau 3 (mórbida)";
  }
}

void main() {
  group('Classificação do IMC', () {
    test('Classificação para IMC menor que 16kg', () {
      expect(classificarIMC(15.0), "Magreza Grave");
    });

    test('Classificação para IMC de 16 até 16.999kg', () {
      expect(classificarIMC(16.5), "Magreza Moderada");
    });

        test('Classificação para IMC de 17 até 18,499kg', () {
      expect(classificarIMC(17), "Magreza Leve");
    });

    test('Classificação para IMC de 18,5 até 24,999kg', () {
      expect(classificarIMC(18.5), "Saudável");
    });

    test('Classificação para IMC de 25 até 29,999kg', () {
      expect(classificarIMC(28), "Sobrepeso");
    });

    test('Classificação para IMC de 30 até 34,999kg', () {
      expect(classificarIMC(34), "Obesidade Grau 1");
    });

     test('Classificação para IMC de 35 até 39,999kg', () {
      expect(classificarIMC(39), "Obesidade Grau 2 (severa)");
    });

     test('Classificação para IMC de 40kg em diante', () {
      expect(classificarIMC(41), "Obesidade Grau 3 (mórbida)");
    });

  });
}