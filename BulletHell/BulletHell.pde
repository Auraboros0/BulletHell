// make touhou esque patterns

import processing.sound.*;

SoundFile b;

int spawnTime = 0;
int enemyCaller = 1;
int enemyCallerCount = 0;
int enemyNumCount = 1;
int enemyDeathCount = 0; // resets each wave
int bulletAdvance3 = 500;


abilityDisplay[] aDisplay;
ShooterEnemy[] shooters;
//SpreaderEnemy[] spreaders;
Bullet[] bullets;
playerBullet[] pBullets;
bigBullet[] bigBullets;
int colorBG;
int state;
int count;
int initCount;
PImage star;
int r = 0;
PImage thing;
float x;
float y;
int c;
int points;
int iFrames;
int HP;
int HPDisplayValue;
int spawnFrames;
float xVelo;
float yVelo;
char lastKey;
int killCount = 0;
int cooldown = 0;
int abilityPoints = 0;
int abilityPointsCompromise = 0;
int shooterEnemyAdvance;
int spreaderEnemyAdvance;
int bulletAdvance;
int pBulletAdvance;
int bigBulletAdvance = 0;
int bulletAdvance2;
int abilityDisplayAdvance = 0;
float randomShooter;

void setup() {
  //fullScreen(P2D);
  size(1200, 1200);
  x = width/2;
  y = height/2;
  star = loadImage("Star.png");
  star.resize(50, 50);
  thing = loadImage("Game Character.png");
  thing.resize(100, 80);
  state = 1;

  colorBG = 0;
  xVelo = 0;
  yVelo = 0;
  c = #FF0000;
  lastKey = ' ';
  points = 0;
  spawnFrames = 0;
  iFrames = 0;
  HP = 8;
  HPDisplayValue = 0;
  b = new SoundFile(this, "Boom.wav");

  initCount = 0;
  count = 100;
  bulletAdvance = 0;
  pBulletAdvance = 0;
  shooterEnemyAdvance = 0;
  spreaderEnemyAdvance = 0;
  bulletAdvance2 = 100;
  randomShooter = int(random(1, 2));
  aDisplay = new abilityDisplay[6];
  shooters = new ShooterEnemy[100];
  //spreaders = new SpreaderEnemy[10];
  pBullets = new playerBullet[100];
  bullets = new Bullet[10000];
  bigBullets = new bigBullet[100];
}

void draw() {
  if (state == 0) {
    openingScreen();
  }
  if (state == 1) {
    gameScreen();
  }
}
void keyPressed() {
  if (state == 0 && key == 'z') {
    state = 1;
  }
  if (state == 1) {
    lastKey = key;
    if ((lastKey == '1' || lastKey == ' ') && cooldown <= 0) {
      cooldown = 5;
      for (int i = -1; i < 2; i++) {
        float xVelo = i*3;
        pBullets[pBulletAdvance] = new playerBullet(x, y, xVelo, -5);
        pBulletAdvance++;
        if (pBulletAdvance == 100) {
          pBulletAdvance = 0;
        }
      }
    }
    if (lastKey == '2' && abilityPoints > 0) {

      aDisplay[abilityDisplayAdvance - 1] = new abilityDisplay(width+1000, height+1000, 1, 255);
      abilityDisplayAdvance--;
      abilityPoints--;
      //abilityPointsCompromise--;
      cooldown = 5;
      for (int i = 0; i < 50; i++) {
        float xVelo;
        float yVelo;
        xVelo = sin(i * 2 * PI/50);
        yVelo = cos(i * 2 * PI/50);
        bigBullets[bigBulletAdvance] = new bigBullet(x, y, xVelo, yVelo);
        bigBulletAdvance++;
        if (bigBulletAdvance == 100) {
          bigBulletAdvance = 0;
        }
      }
    }
  }
  if (key =='w') {
    yVelo = -7;
  }
  if (key =='a') {
    xVelo = -7;
  }
  if (key =='s') {
    yVelo = 7;
  }
  if (key =='d') {
    xVelo = 7;
  }
}


void keyReleased() {
  if (state == 1) {
    if (key == 'w') {
      yVelo = 0;
    }
    if (key == 'a') {
      xVelo = 0;
    }
    if (key == 's') {
      yVelo = 0;
    }
    if (key == 'd') {
      xVelo = 0;
    }
  }
}
