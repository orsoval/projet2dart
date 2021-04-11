import 'dart:math';

main(List<String> args) {
  //2 - Robot à un ami

  Robot robot1 = new Robot('Rob 1', 200, 2, 3, 4);
  Robot robot2 = new Robot('Rob 2', 400, 5, 5, 2);
  Robot robot3 = new Robot('Rob 3', 200, 2, 0, 2);
  Robot robot4 = new Robot('Rob 4', 400, 5, 1, 1);

  //3 - Des Robots qui parlent
  robot1.presentation();
  robot2.presentation();

  //4 - Une armée de robots
  var robots = [robot1, robot2, robot3, robot4];
  robots.forEach((robot) {
    robot.presentation();
  });

  //5 - Des Robots à la conquête du monde (Application)
  robot1.seDeplacerVers('haut');
  robot3.seDeplacerVers('gauche');

  //6 - En mouvement brownien (Application)
  robot1.seDeplacerAleatoirement(4);

  //7 - Des robots uniques (Application)
  Robot robot5 = new Robot.rob('Rob 5', 100, 5, 1, 1);
  robot5.presentation();

  //8 - Des Robots Méchants(Application)
  RobotMechant robotMechant =
      new RobotMechant('Rob Danger', 200, 5, 2, 3, 5, false);
  robotMechant.attaque();
}

//1 - Créer une Classe Robot

class Robot {
  //attribut
  String nom = '';
  int pointsVie = 0;
  int vitesseMaxi = 0;
  int x = 0;
  int y = 0;

  //Constructeur
  Robot(String nom, int pointsVie, int vitesseMaxi, int x, int y) {
    this.nom = nom;
    this.pointsVie = 100;
    this.vitesseMaxi = 3;
    this.x = 0;
    this.y = 0;
  }

  //7 - Des robots uniques (2éme constructeur)
  Robot.rob(String nom, int pointsVie, int vitesseMaxi, int x, int y) {
    this.nom = nom;
    this.pointsVie = pointsVie;
    this.vitesseMaxi = vitesseMaxi;
    this.x = x;
    this.y = x;
  }

  //Methode
  void presentation() {
    print(
        'Je m\'apelle $nom. j\'ai $pointsVie points de vie et je me deplace de $vitesseMaxi cases par seconde. je suis à la case ($x;$y)');
  }

  //5 - Des Robots à la conquête du monde
  void seDeplacerVers(direct) {
    switch (direct) {
      case 'haut':
        this.y++;
        print('Je me deplace de $y cases vers le haut');
        break;
      case 'droite':
        this.x++;
        print('Je me deplace de $x cases vers la droite');
        break;
      case 'bas':
        this.y--;
        print('Je me deplace de $y cases vers le bas');
        break;
      case 'gauche':
        this.x--;
        print('Je me deplace de $x cases vers la gauche');
        break;
    }
  }

  //6 - En mouvement brownien
  seDeplacerAleatoirement(int number) {
    List directions = ['haut', 'droite', 'bas', 'gauche'];
    Random randDirection = new Random();
    Random randNumber = new Random();
    int intDirection = randDirection.nextInt(number);
    int intrandNumber = randNumber.nextInt(number);
    //print('$intDirection; et $intrandNumber');
    String direction = directions[intDirection];
    //print(directions[intDirection]);
    switch (direction) {
      case 'haut':
        this.y = y + intrandNumber;
        print('Je me deplace aléatoirement de $y cases vers le haut');
        break;
      case 'droite':
        this.x = x + intrandNumber;
        print('Je me deplace aléatoirement de $x cases vers la droite');
        break;
      case 'bas':
        this.y = y - intrandNumber;
        print('Je me deplace aléatoirement de $y cases vers le bas');
        break;
      case 'gauche':
        this.x = x - intrandNumber;
        print('Je me deplace aléatoirement de $x cases vers la gauche');
        break;
    }
  }
}

//8 - Des Robots Méchants
class RobotMechant extends Robot {
  int pointsDommage = 0;
  bool degats = false;
  RobotMechant(String nom, int pointsVie, int vitesseMaxi, int x, int y,
      int pointsDommage, bool degats)
      : super(nom, pointsVie, vitesseMaxi, x, y) {
    this.pointsDommage = pointsDommage;
    this.degats = degats;
  }

  attaque() {
    if (this.degats == true) {
      print('vous avez une option de degats à distance vous pouvez attaquer');
    } else {
      print('La cible est trop loin pour être attaquée');
    }
  }
}
