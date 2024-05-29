void Player(float x, float y) {
  imageMode(CENTER);
  image(thing, x, y);
}




class playerBullet {
  Bullet[] bl;

  float x3;
  float y3;
  float xVelo;
  float yVelo;

  playerBullet(float x3, float y3, float xVelo, float yVelo) {
    bl = new Bullet[100];
    this.x3 = x3;
    this.y3 = y3;
    this.xVelo = xVelo;
    this.yVelo = yVelo;
  }

  void display() {
    push();
    translate(x3, y3);
    rotate(r++);
    x3 = x3 + xVelo;
    y3 = y3 + yVelo;
    imageMode(CENTER);
    image(star, 0, 0);
    pop();
  }
}

class bigBullet {
  Bullet[] bl;

  float x3;
  float y3;
  float xVelo;
  float yVelo;

  bigBullet(float x3, float y3, float xVelo, float yVelo) {
    bl = new Bullet[100];
    this.x3 = x3;
    this.y3 = y3;
    this.xVelo = xVelo;
    this.yVelo = yVelo;
  }

  void display() {
    push();
    translate(x3, y3);
    rotate(r++);
    x3 = x3 + xVelo;
    y3 = y3 + yVelo;
    imageMode(CENTER);
    image(star, 0, 0);
    pop();
  }
}

class Timer {
  float x;
  float y;
  
  Timer(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void display(int time) {
    
  }
  
  
}
