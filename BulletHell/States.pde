void openingScreen() {
  background(90);
  textAlign(CENTER);
  textSize(50);
  text("Shape Shooter", width/2, height/2);
}

void instructionScreen() {
}

void gameScreen() {
  background(colorBG);
  colorBG++;
  if (colorBG > 110) {
    colorBG--;
  }
  if (colorBG < 1) {
    colorBG++;
  }
  x = x + xVelo;
  y = y + yVelo;
  randomShooter = int(random(1, 3));
  spawnFrames++;
  HPDisplayValue = 180*HP/8;
  iFrames--;
  cooldown--;

  if (abilityPoints > 5) {
    abilityPoints = 5;
  }

  if (abilityPointsCompromise > 5) {
    abilityPointsCompromise = 5;
  }

  if (killCount == 10) {
    abilityPoints++;
    abilityPointsCompromise++;
    killCount = 0;
  }

  if (cooldown < 0) {
    cooldown = 0;
  }

  if (x < 0) {
    x = 0;
  }
  if (x > width *.75) {
    x = width * .75;
  }
  if (y < 0) {
    y = 0;
  }
  if (y > height) {
    y = height;
  }

  if (iFrames <= 0) {
    iFrames = 0;
  }
  if (HP <= 0) {
    HP = 0;
  }
  fill(#0076cc);
  //square(400, 600);
  //square(300, 400);
  //square(100, 100);
  Player(x, y);
  ellipse(x, y, 15, 15);


  // Object For Loops
  for (Bullet bullet : bullets) {
    for (bigBullet bBullet : bigBullets) {
      if (bBullet != null && bullet != null) {
        if (dist(bBullet.x3, bBullet.y3, bullet.x2, bullet.y2) < 40) {
          bBullet.x3 = width+100;
          bullet.x2 = width+100;
        }
      }
    }
    if (bullet != null) {
      bullet.display();
    }
  }
  for (playerBullet pBullet : pBullets) {
    if (pBullet != null) {
      pBullet.display();
    }
  }
  for (bigBullet bBullet : bigBullets) {
    if (bBullet != null) {
      bBullet.display();
    }
  }

  for (ShooterEnemy shooter : shooters) {
    for (playerBullet pBullet : pBullets) {
      if (pBullet != null && shooter != null) {
        if (shooter.spellCardFrames <= 0 || shooter.alive == false) {
          if (dist(shooter.x2, shooter.y2, pBullet.x3, pBullet.y3) < 40) {
            shooter.hitPoints--;
            pBullet.x3 = width+100;
          }
        }
        // kill
        if (shooter.hitPoints == 0) {
          shooter.alive = false;
          enemyDeathCount++;
          killCount = killCount + 1;
          shooter.x2 = -100;
          shooter.y2 = height*2;
          points = points + 100;
          shooter.hitPoints = -1;
        }
      }
    }
    if (shooter != null) {
      shooter.display();
      if (shooter.x2 > 0 && shooter.x2 < width*.75) {
        shooter.attack1();
        shooter.attack2();
        shooter.attack3();
        shooter.attack4();
      }
      if (shooter.alive == false) {
        shooter.xVelo = 0;
        shooter.yVelo = 0;
      }
    }
  }
  // Control for spawning enemies
  if (enemyCaller == 1) {
    spawnTime = 120;
    enemyNumCount = 1;
    if (enemyCallerCount >= 5) {
      enemyCallerCount = 0;
      enemyDeathCount = 0;
      enemyCaller = 2;
    }
  }
  if (enemyCaller == 2) {
    spawnTime = 120;
    enemyNumCount = 1;
    if (enemyCallerCount == 1) {
      enemyCallerCount = 0;
      enemyDeathCount = 0;
      enemyCaller = 3;
    }
  }
  if (enemyCaller == 3) {
    spawnTime = 120;
    enemyNumCount = 2;
    if (enemyCallerCount >= 2) {
      enemyCallerCount = 0;
      enemyDeathCount = 0;
      enemyCaller = 4;
    }
  }
  if (enemyCaller == 4) {
    spawnTime = 120;
    enemyNumCount = 2;
    if (enemyCallerCount >= 3 && spawnTime == 0) {
      enemyCallerCount = 0;
      enemyDeathCount = 0;
      enemyCaller = 1;
    }
  }
  if (spawnFrames >= spawnTime) {
    enemyCallerCount++;
    spawnFrames = 0;



    for (int i = 0; i < enemyNumCount; i++) {
      float enemyInitXpos = 0;
      float enemyInitYpos = 0;


      if (enemyCaller == 1) {
        enemyInitYpos = random(0, height/2) ;
      }

      if (enemyCaller == 3) {
        if (i == 0) {
          enemyInitXpos = (width*.75) * .25 ;
        }
        if (i == 1) {
          enemyInitXpos = (width*.75) * .75 ;
        }
      }

      if (enemyCaller == 4) {
        enemyInitXpos = random(0, width*.75) ;
        if (i == 0) {
          enemyInitYpos = 0 ;
        }
        if (i == 1) {
          enemyInitYpos = height ;
        }
      }

      shooters[shooterEnemyAdvance] = new ShooterEnemy(enemyInitXpos, enemyInitYpos, 5, random(1, 5), 2, enemyCaller);
      shooterEnemyAdvance++;

      if (shooterEnemyAdvance == 100) {
        shooterEnemyAdvance = 0;
      }
    }
  }
  rect(width*.75, 0, width*.25, height);
  HPdisplay(width*.76, height*.02);
  pointsDisplay(width-190, 150, 0, 5, points);
  for (abilityDisplay aDis : aDisplay) {
    if (aDis != null) {
      aDis.display();
    }
  }
  for (int i = 0; i < abilityPointsCompromise; i++) {
    //if (abilityDisplayAdvance < 5) {
    float x;
    float y;
    if (abilityDisplayAdvance < 5) {
      x = width*.8 + (abilityDisplayAdvance * 30);
    } else {
      x = width*.8 + (abilityDisplayAdvance * 300);
    }
    y = height * .3;
    aDisplay[abilityDisplayAdvance] = new abilityDisplay(x, y, 1, 255);
    abilityPointsCompromise--;
    abilityDisplayAdvance++;
    if (abilityDisplayAdvance > 5) {
      abilityDisplayAdvance = 5;
    }
  }
  println(enemyDeathCount);
}

void GameOver () {
}
