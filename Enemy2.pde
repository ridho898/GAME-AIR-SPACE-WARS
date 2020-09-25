class Enemy2 {

  PVector loc;
  float vel;
  float size;
  float coolingTime;
  boolean isDead;
  PImage [] image;
  PImage enemy2;

  Enemy2() {
    size = 40;
    loc = new PVector(random(size / 2, width - size / 2), size / 2);    
    vel = 3;
    coolingTime = int(random(60));
    isDead = false;
    enemy2 = loadImage("enemy2.png");
  }

  void display() {
    noFill();
    stroke(255, 0, 0);
    //Lokasi Musuh Spawn
    image(enemy2, loc.x, loc.y, 50, 50);
    //rect(loc.x, loc.y, size, size);
  }

  void update() {
    //Velocity Dari Musuh
    loc.y += vel;
    if (loc.y > height) {
      isDead = true;
    }

    coolingTime+=0.8;
    if (coolingTime >= 60) {
      eneBullets.add(new Bullet(this));
      coolingTime = 0;
    }    

    for (Bullet b : myBullets) {                 
      //Fungsi Jika Musuh2 Kena Tembakan, maka musuh mati
      if ((loc.x - size / 2 <= b.loc.x && b.loc.y <= loc.y + size / 2)
        && (loc.y  - size / 2 <= b.loc.y && b.loc.x <= loc.x + size / 2)) {
        Countkill++;
        Score1+=2;
        isDead = true;
        b.isDead = true;
        break;
      }
    }
    for (Bullet b : my2Bullets) {                 
      //Fungsi Jika Musuh2 Kena Tembakan, maka musuh mati
      if ((loc.x - size / 2 <= b.loc.x && b.loc.y <= loc.y + size / 2)
        && (loc.y  - size / 2 <= b.loc.y && b.loc.x <= loc.x + size / 2)) {
        Countkill++;        
        isDead = true;
        b.isDead = true;
        break;
      }
    }
  }
}
