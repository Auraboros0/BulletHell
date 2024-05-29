void square(float x2, float y2) {
  push();
  translate(x2, y2);
  if (iFrames <=0) {
    if (dist(x, y, x2, y2) < 70) {
      fill(#FF0000);
      HP--;
      iFrames = 60;
      if (!b.isPlaying()) {
        b.play();
      }
    }
  }
  fill(255);
  rectMode(CENTER);
  rect(0, 0, 40, 40);
  pop();
}

class Bullet {
  playerBullet pbl;

  float x2;
  float y2;
  float xVelo;
  float yVelo;
  float rotate;
  int bColor;

  Bullet (float x2, float y2, float xVelo, float yVelo, int bColor) {
    this.x2 = x2;
    this.y2 = y2;
    this.xVelo = xVelo;
    this.yVelo = yVelo;
    this.bColor = bColor;
    rotate = 0;
  }

  void display() {
    push();
    translate(x2, y2);
    rotate(rotate = rotate + 0.125);
    if (iFrames <=0) {
      if (dist(x, y, x2, y2) < 17.5) {
        HP--;
        iFrames = 60;
        if (!b.isPlaying()) {
          b.play();
        }
      }
    }
    fill(bColor);
    x2 = x2 + xVelo;
    y2 = y2 + yVelo;
    rectMode(CENTER);
    rect(0, 0, 20, 20);
    pop();
  }
}









class ShooterEnemy {
  playerBullet pbl;
  float x2;
  float y2;
  float xVelo;
  float yVelo;
  float xOffset;
  float yOffset;
  float spawnCircleSize;
  int frames;
  int hitPoints;
  int attackNum;
  int aFrames;
  int spellCardFrames;
  boolean alive;

  ShooterEnemy (float x2, float y2, float xVelo, float yVelo, int hitPoints, int attackNum) {

    this.x2 = x2;
    this.y2 = y2;
    this.xVelo = xVelo;
    this.yVelo = yVelo;
    this.frames = 0;
    this.hitPoints = hitPoints;
    this.xOffset = 2;
    this.yOffset = 2;
    this.attackNum = attackNum;
    this.aFrames = 0;
    this.spellCardFrames = 0;
    this.alive = true;
    this.spawnCircleSize = 60;
  }

  void display() {
    push();
    translate(x2, y2);
    rotate(16.5);
    spellCardFrames--;
    frames++;
    if (iFrames <=0) {
      if (dist(x, y, x2, y2) < 27.5) {
        HP--;
        iFrames = 60;
        if (!b.isPlaying()) {
          b.play();
        }
      }
    }
    if (attackNum == 1) {
      fill(#9300FF);
      yVelo = yVelo - .025;
      y2 = y2 + yVelo;
      x2 = x2 + xVelo;
      fill(#9300FF);
      rectMode(CENTER);
      rect(0, 0, 40, 40);
    }

    if (attackNum == 2) {
      fill(#4473FF);
      yVelo = yVelo - .025;
      y2 = y2 + yVelo;
      x2 = (width*.75)/2 ;
      if (yVelo <= 0) {
        yVelo = 0;
        spawnCircleSize = spawnCircleSize + 5;
        fill(255, 0);
        ellipse(0, 0, spawnCircleSize, spawnCircleSize);
      }
      rectMode(CENTER);
      rect(0, 0, 40, 40);
      spellCardFrames = 600;
    }

    if (attackNum == 3) {
      fill(#ff733a);
      //yVelo = yVelo - .025;
      //y2 = 0;
      if (yVelo <= 0) {
        yVelo = 0;
      }

      if (attackNum == 4) {
        fill(#4473FF);
        yVelo = yVelo - .025;
        y2 = y2 + yVelo;
        if (yVelo <= 0) {
          yVelo = 0;
        }
      }

      rectMode(CENTER);
      rect(0, 0, 40, 40);
    }
    pop();
  }

  // attacks triggered by if test

  void attack1() {
    push();
    if (hitPoints > 0) {
      if (attackNum == 1) {
        if (frames >= 12) {
          frames = 0;
          for (int i = 1; i < 4; i++) {
            float xVelo;
            float yVelo;
            xVelo = cos(i * 2 * PI/3 + xOffset )*2;
            yVelo = sin(i * 2 * PI/3 + yOffset )*2;
            xOffset = xOffset + .075;
            yOffset = yOffset + .075;
            bullets[bulletAdvance2] = new Bullet(x2, y2, xVelo, yVelo, #AAAFFF);
            bulletAdvance2++;

            if (bulletAdvance2 == 500) {
              bulletAdvance2 = 100;
            }
          }
        }
      }
    }
    pop();
  }

  void attack2() {
    push();

    if (hitPoints > 0) {
      if (attackNum == 2) {
        if (aFrames < 600) {
          aFrames++;
          if (frames >= 12) {
            frames = 0;
            for (int i = 1; i < 5; i++) {
              float xVelo;
              float yVelo;
              xVelo = cos(i * 2 * PI/4 + xOffset )*2;
              yVelo = sin(i * 2 * PI/4 + yOffset )*2;
              xOffset = xOffset + .075;
              yOffset = yOffset + .075;
              bullets[bulletAdvance2] = new Bullet(x2, y2, xVelo, yVelo, #FB34A1);
              bulletAdvance2++;

              if (bulletAdvance2 == 500) {
                bulletAdvance2 = 100;
              }
            }
          }
        }
      }
    }
    pop();
  }

  void attack3() {
    push();
    if (hitPoints > 0) {
      if (attackNum == 3) {
        if (frames >= 12) {
          frames = 0;
          for (int i = 1; i < 2; i++) {
            float xVelo;
            float yVelo;
            xVelo = (x - x2)/dist(x2, y2, x, y)*7;
            yVelo = (y - y2)/dist(x2, y2, x, y)*7;
            xOffset = xOffset + .075;
            yOffset = yOffset + .075;
            bullets[bulletAdvance2] = new Bullet(x2, y2, xVelo, yVelo, #aa33de);
            bulletAdvance2++;

            if (bulletAdvance2 == 500) {
              bulletAdvance2 = 100;
            }
          }
        }
      }
    }
    pop();
  }

  void attack4() {
    push();

    if (hitPoints > 0) {
      if (attackNum == 4) {
        if (aFrames < 600) {
          aFrames++;
          if (frames >= 12) {
            frames = 0;
            for (int i = 1; i < 11; i++) {
              float xVelo;
              float yVelo;
              xVelo = cos(i * 2 * PI/10 + xOffset )*2;
              yVelo = sin(i * 2 * PI/10 + yOffset )*2;
              xOffset = xOffset + 0;
              yOffset = yOffset + 0;
              bullets[bulletAdvance3] = new Bullet(x2, y2, xVelo, yVelo, #FB34A1);
              bulletAdvance3++;

              if (bulletAdvance3 == 4000) {
                bulletAdvance3 = 500;
              }
            }
          }
        }
      }
    }
    pop();
  }
}





void HPdisplay(float x, float y) {
  push();
  translate(x, y);
  fill(255);
  rect(0, 0, 180, 75);
  fill(#FF0000);
  rect(0, 0, HPDisplayValue, 75);
  pop();
}

void pointsDisplay(float x, float y, float r, float s, int points) {
  push();
  fill(#FFFFFF);
  translate(x, y);
  rotate(radians(r));
  scale(s);
  text(points + " pts", 0, 0);
  pop();
}

class abilityDisplay {

  float x;
  float y;
  float s;
  int a;

  abilityDisplay (float x, float y, float s, int a) {
    this.x = x;
    this.y = y;
    this.s = s;
    this.a = a;
  }

  void display() {
    push();
    scale(s);
    fill(a);
    // if (abilityDisplayAdvance < 5) {
    triangle(x, y, x+20, y+40, x-20, y+40);
    triangle(x, y+60, x+20, y+20, x-20, y+20);
    //  }
    pop();
  }
}


// Pattern Library //

// Circular Movement

//  y2 = y2 + 5*sin(yVelo);
//  x2 = x2 + 5*cos(xVelo);

// Straight Lines

//        xOffset = xOffset + .5;
//        yOffset = yOffset + .5;
//        xVelo = cos(i * xOffset * PI/4);
//        yVelo = sin(i * yOffset * PI/4);
