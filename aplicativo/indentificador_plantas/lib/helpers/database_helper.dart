import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

class DatabaseHelper {
  static final _databaseName = 'AppPlantas.db';
  static final _databaseVersion = 3;

  static final tablePlanta = 'planta';
  static final tableImagemPlanta = 'imagem_planta';
  static final tableObservacao = 'observacao';

  //Planta
  static final columnId = 'id';
  static final columnNome = 'nome';
  static final columnDescricao = 'descricao';
  static final columnCategoria = 'categoria';

  //Imagem Planta
  static final columnImagem = 'imagem';

  //Observação
  static final columnIdPlanta = 'id_planta';
  static final columnDataHora = 'data_hora';
  static final columnLocalizacao = 'localizacao';

  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  // only have a single app-wide reference to the database
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tablePlanta (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnNome TEXT NOT NULL,
            $columnDescricao TEXT NOT NULL,
            $columnCategoria TEXT NOT NULL
          ); ''');
    await db.execute('''

          CREATE TABLE $tableImagemPlanta (
            $columnId INTEGER NOT NULL,
            $columnImagem TEXT NOT NULL,
            FOREIGN KEY ($columnId) REFERENCES planta (id),
			      PRIMARY KEY ($columnId, $columnImagem)
          );''');
    await db.execute('''

          CREATE TABLE $tableObservacao (
            $columnId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            $columnIdPlanta INTEGER NOT NULL,
            $columnDataHora TEXT NOT NULL,
            $columnLocalizacao TEXT,
            FOREIGN KEY ($columnIdPlanta) REFERENCES $tablePlanta ($columnId)
          );''');
    await db.execute('''
          
          INSERT INTO $tablePlanta ($columnNome, $columnDescricao, $columnCategoria)
          VALUES ("Araruta",
          "A araruta é uma raíz normalmente consumida em forma de farinha que por não conter é um excelente substituto da farinha de trigo para fazer bolos, tortas, biscoitos, mingau e até para engrossar sopas e molhos, especialmente no caso de sensibilidade ao glúten ou mesmo doença celíaca.",
          "Comestível"
          );''');
    await db.execute('''

          INSERT INTO $tablePlanta ($columnNome, $columnDescricao, $columnCategoria)
          VALUES ("Beldroegão",
          "O Beldroegão (Talinum paniculatum) é uma PANC (Planta Alimentícia Não Convencional), da família das Talinaceas.\n
          Planta rústica, de fácil cultivo e crescimento espontâneo, não é difícil encontrá-la em raízes de árvores pela calçada. Cresce de 30-60 cm e seu plantio pode ser feito por sementes ou estacas que enraízam com facilidade! Se o espaço for pequeno, cresce em vaso e se desenvolve bem à sombra.\n
          Apesar de nativa do continente americano, é comercializada em outros países como verdura e preparada como o espinafre, no entanto possui vantagens nutricionais como o alto teor proteico (22% na matéria seca), além de ser considerada boa fonte de ferro, zinco e molibdênio. É uma planta com grande potencial já que é de fácil cultivo, saborosa e nutritiva!\n
          Suas flores rosáceas são bonitas e miúdas, costumam abrir durante a tarde (com sol) e ao anoitecer já se fecham! As cápsulas, com tons de amarelo ao marrom, abrigam pequenas sementes pretas e brilhantes que podem substituir a papoula em bolos e pães!\n
          ",
          "Comestível"
          );''');
    await db.execute('''

          INSERT INTO $tablePlanta ($columnNome, $columnDescricao, $columnCategoria)
          VALUES ("Capiçoba",
          "Planta herbácea da família Asteraceae, das espécies Erechtites valerianaefolia DC. e Erechtites hieracifolia (L.).  \n
          Ela é encontrada em todo o Brasil, nas regiões litorâneas. Cresce até 2 m de altura e ocorre em terrenos recém-desbravados e ricos em matéria orgânica, onde se torna indesejável em culturas anuais. Vegeta com maior intensidade no inverno",
          "Comestível"
          );''');
    await db.execute('''

          INSERT INTO $tablePlanta ($columnNome, $columnDescricao, $columnCategoria)
          VALUES ("Capuchinha",
          "A capuchinha é uma planta medicinal, também conhecida como chagas, mastruço e capuchinho, que pode ser utilizada no tratamento de infecção urinária, escorbuto e doenças na pele.\n
          Seu nome científico é Tropaeolum majus L. e pode ser comprada em lojas de produtos naturais e em algumas farmácias de manipulação.\n",
          "Comestível"
          );''');
    await db.execute('''

          INSERT INTO $tablePlanta ($columnNome, $columnDescricao, $columnCategoria)
          VALUES ("Caruru",
          "O caruru, também conhecido como Caruru-de-Cuia, Caruru-Rôxo, Caruru-de-Mancha, Caruru-de-Porco, Caruru-de-Espinho, Bredo-de-Chifre, Bredo-de-Espinho, Bredo-vermelho ou Bredo, é uma planta medicinal que possui propriedades antibacterianas, anti-inflamatórias e é rica em cálcio, sendo utilizada com o objetivo de fortalecer os ossos e dentes, por exemplo.\n
          O nome científico do caruru é Amaranthus flavus e suas folhas costumam ser utilizadas em saladas, molhos, refogados, panquecas, bolos e chás, por exemplo, enquanto que as sementes são principalmente usadas no preparo de pães.\n",
          "Comestível"
          );''');
    await db.execute('''

          INSERT INTO $tablePlanta ($columnNome, $columnDescricao, $columnCategoria)
          VALUES ("Ora-pro-nóbis",
          "A Ora Pro-nóbis é uma planta trepadeira cactácea folhosa que possue folhas e frutos que servem como alimento. Com propriedades e nutrientes fantásticos para a saúde e bem-estar das pessoas. Seu nome científico é Pereskia Aculetea, porém ela é mais conhecida por Ora-Pro-nóbis.\n
          Na culinária mineira, a planta é usada muitas vezes como tempero para frango. As folhas podem ser usadas frescas ou secas de diversas formas, sendo uma delas a folha moída como farinha.",
          "Comestível"
          );''');
    await db.execute('''

          INSERT INTO $tablePlanta ($columnNome, $columnDescricao, $columnCategoria)
          VALUES ("Peixinho",
          "O peixinho é uma Planta alimentícia não convencional (Panc) de nome científico Stachys byzantina. Ele é nativo da Turquia, Armênia e Irã e pode ser encontrado facilmente em regiões de clima temperado como planta ornamental.\n
          O peixinho vai muito bem frito, empanado ou à milanesa. Mas antes do consumo deve ser muito bem higienizado, pois a característica aveludada de suas folhas faz com que ele prenda algumas impurezas do solo. Depois de lavá-lo, seque para preparar receitas ou guarde em sacos de pano na geladeira.",
          "Comestível"
          );''');
    await db.execute('''

          INSERT INTO $tablePlanta ($columnNome, $columnDescricao, $columnCategoria)
          VALUES ("Picão-preto",
          "Picão-preto é planta medicinal das mais conhecidas da América do Sul, amplamente utilizada no tratamento de inúmeras doenças dentre as quais inflamação, hipertensão, úlceras, diabetes e infecções de todos os tipos, que estão sendo validadas pela moderna pesquisa científica.\n
          A planta tem longo histórico de uso entre os povos indígenas da Amazônia. Geralmente é arrancada e preparada em decocção ou infusão para uso interno, ou esmagada para uso externo na forma de cataplasma.",
          "Comestível"
          );''');
    await db.execute('''

          INSERT INTO $tablePlanta ($columnNome, $columnDescricao, $columnCategoria)
          VALUES ("Serralha",
          "A serralha (Sonchus oleraceus) é uma planta herbácea da familia Asteraceae, a família da alface, da carqueja e da alcachofra, dentre outras delícias, e até de outras PANCS, como o almeirão-de-árvore e o jambu.\n
          Também conhecida como serraia, chicória-brava e serralha lisa, ela é uma planta de porte pequeno e ereto, com raízes profundas, folhas leitosas devido à presença de látex, e pouco ramificadas.",
          "Comestível"
          );''');
    await db.execute('''

          INSERT INTO $tablePlanta ($columnNome, $columnDescricao, $columnCategoria)
          VALUES ("Taioba",
          "A taioba é um vegetal da família Aracaeae, cultivada geralmente em regiões tropicais do centro-sul americano e em alguns países da Ásia e África. Seu crescimento depende de grande disponibilidade de água, o que leva a sua ocorrência em florestas tropicais úmidas. No Brasil, faz parte da cultura de comunidades rurais e mesmo urbanas, principalmente nos estados da Bahia, Minas Gerais, Rio de Janeiro e Espírito Santo.\n
          As folhas da taioba são uniformemente verdes, bem como seus talos, também chamados de pecíolos. Possuem nervuras bem marcantes, são macias e ficam cremosas quando cozidas.",
          "Comestível"
          );''');
    await db.execute('''

          INSERT INTO $tablePlanta ($columnNome, $columnDescricao, $columnCategoria)
          VALUES ("Urtiga",
          "Algumas urtigas são chamadas de mansas, ou seja, não causam nenhuma reação. Porém, podem ser facilmente confundidas com as urtigas bravas, então muito cuidado ao manuseá-las e utilize sempre luvas para colhe-las. Após o cozimento, as folhas, até mesmo das bravas, são comestíveis e muitíssimo saborosas. São ricas em ferro, cálcio, proteínas e fibras, e são páreo duro com a ora-pro-nobis no quesito nutrientes. Para preparar as folhas basta lavar e deixar alguns minutos em água fervente. Dica: prove um pouco para ter certeza que não irá pinicar. Caso a urtiga seja muito brava, adicione um pouco de bicarbonato de sódio à água fervente. Use-as da mesma maneira que a couve e o espinafre - em refogados, recheios de tortas, pães, massas, sopas, escondidinho, molhos, enfim, tudo que sua criatividade gastronômica pedir. Também pode ser consumida como chá.
          \n
          Dentre as urtigas mansas se destacam:
          \n
          1. Urtica dioica, popularmente conhecida como urtiga-de-jardim ou urtiga-européia. Suas folhas são grandes, oval-lanceoladas, serrilhadas, dotadas de duas estípulas e revestidas de pelos urticantes. Suas flores são esverdeadas ou amarelas;
          \n
          2. Bohemeria caudata, popularmente conhecida como urtiga-mansa, folha-de-santana ou assa-peixe. Possui folhas compridas, pouco serrilhadas e sem pelos urticantes e inflorescências pendentes e longas. Para consumi-la é preciso tirar a nervura central, que é dura, e cortar a folha em tiras finas. As folhas mais jovens são mais agradáveis ao paladar;
          \n
          3. Bohemeria nivea, popularmente conhecida como rami. Possui folhas arredondadas e maiores e flores brancas. É bastante fibrosa, por isso só se consegue consumi-la cozida e batida.",
          "Comestível"
          );''');

    await db.execute('''
          INSERT INTO imagem_planta (id, imagem)
          VALUES (1, 'assets/images/Araruta/1.jpg');''');

    await db.execute('''
        INSERT INTO imagem_planta (id, imagem)
        VALUES (1, 'assets/images/Araruta/2.jpg');''');

    await db.execute('''
        INSERT INTO imagem_planta (id, imagem)
        VALUES (1, 'assets/images/Araruta/3.jpg');''');

    await db.execute('''
        INSERT INTO imagem_planta (id, imagem)
        VALUES (2, 'assets/images/Beldroegão/1.jpg');''');

    await db.execute('''
        INSERT INTO imagem_planta (id, imagem)
        VALUES (2, 'assets/images/Beldroegão/2.jpg');''');

    await db.execute('''
        INSERT INTO imagem_planta (id, imagem)
        VALUES (2, 'assets/images/Beldroegão/3.jpg');''');

    await db.execute('''
        INSERT INTO imagem_planta (id, imagem)
        VALUES (3, 'assets/images/Capiçoba/1.jpg');''');

    await db.execute('''
        INSERT INTO imagem_planta (id, imagem)
        VALUES (3, 'assets/images/Capiçoba/2.jpg');''');

    await db.execute('''
        INSERT INTO imagem_planta (id, imagem)
        VALUES (3, 'assets/images/Capiçoba/3.jpg');''');
  }

  Future<int> insertObservacao(int idPlanta) async {
    Database db = await instance.database;

    Map<String, dynamic> row = {
      columnIdPlanta: idPlanta,
      columnDataHora: DateTime.now().toString(),
    };
    return await db.insert(tableObservacao, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> observacoes() async {
    Database db = await instance.database;
    return await db.query(tableObservacao);
  }

  Future<List<Map<String, dynamic>>> idPlantaToNomePlanta(int idPlanta) async {
    Database db = await instance.database;
    return await db.rawQuery(
        'SELECT * FROM $tablePlanta WHERE $columnId = $idPlanta', null);
  }

  Future<List<Map<String, dynamic>>> idPlantaToImagePlanta(int idPlanta) async {
    Database db = await instance.database;
    return await db.rawQuery(
        'SELECT * FROM $tableImagemPlanta WHERE $columnId = $idPlanta', null);
  }
}
