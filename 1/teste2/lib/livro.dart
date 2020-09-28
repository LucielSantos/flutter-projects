import 'dart:io';

import 'package:teste2/autor.dart';

class Livro {
  String nome;
  String desc;
  String isbn;
  double valor;
  Autor autor;

  void lerLivro() {
    print('Digite o nome: ');
    nome = stdin.readLineSync();

    print('Digite a descrição: ');
    desc = stdin.readLineSync();

    print('Digite o ISBN: ');
    isbn = stdin.readLineSync();

    print('Digite o valor: ');
    valor = double.parse(stdin.readLineSync());

    print('Digite o nome do autor do livro $nome: ');
    this.autor.nome = stdin.readLineSync();

    print('Digite o email do autor do livro $nome: ');
    autor.email = stdin.readLineSync();
  }
}
