class Meteor {

  PVector loc;
  float vel;
  float size;
  int coolingTime;
  boolean isDead;
  int HP = 3;
  PImage [] images;
  PImage batu;

  Meteor() {
    size = 50;   
    loc = new PVector(random(size / 2, width - size / 2), -size / 2);    
    vel = 3;
    coolingTime = int(random(60));
    isDead = false;
    batu = loadImage("obs3.png");
  }

  void display() {
    noFill();
    stroke(#6C4F4C);    
    //Lokasi Heart Spawn
    image(batu, loc.x, loc.y, size, size);
    //rect(loc.x, loc.y, size, size);
  }

  void update() {
    //Velocity Musuh
    loc.y += vel;
    if (loc.y > height) {
      isDead = true;
    }

    coolingTime++;
    if (coolingTime >= 60) {   
      coolingTime = 0;
    }

    for (Bullet b : myBullets) {
      if ((loc.x - size / 2 <= b.loc.x && b.loc.y <= loc.y + size / 2)
        && (loc.y  - size / 2 <= b.loc.y && b.loc.x <= loc.x + size / 2)) {
        HP--;
        Score1+=2;
        if (HP<1)
        {
          isDead = true;
        }
        b.isDead = true;
        break;
      }
    }
    for (Bullet b : my2Bullets) {
      if ((loc.x - size / 2 <= b.loc.x && b.loc.y <= loc.y + size / 2)
        && (loc.y  - size / 2 <= b.loc.y && b.loc.x <= loc.x + size / 2)) {
        HP--;        
        if (HP<1)
        {
          isDead = true;
        }
        b.isDead = true;
        break;
      }
    }

    //Fungsi Jika Musuh2 Kena Tembakan, maka musuh mati
  }
}
