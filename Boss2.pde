class Bos2 {

  PVector loc;
  float vel;
  float size;
  int coolingTime;
  boolean isDead;
  boolean move = true;
  int HP = 300;
  PImage [] images;
  PImage bos2;
  
  Bos2() {
    size = 200;   
    loc = new PVector(width /2, -size - 100 / 2);    
    vel = 3;
    coolingTime = int(random(60));
    isDead = false;
    bos2 = loadImage("boss2.png");
  }

  void display() {
    noFill();    
    stroke(255, 0, 0);   
    //Lokasi Musuh Spawn
    //rect(loc.x, loc.y, size, size);
    image(bos2, loc.x, loc.y, size, size);    
  }

  void update() {
    //Velocity Musuh

    if (loc.y < 200) {
      loc.y += vel;
    } else if (loc.x < 640 && move)
    {
      loc.x += vel;
      if (loc.x > 540)      
        move=false;
    } else
    {      
      loc.x -= vel;
      if (loc.x < 99)
        move=true;
    }

    if (loc.y > height) {
      isDead = true;
    }

    coolingTime++;
    if (coolingTime >= 60) {

      coolingTime = 0;
    }
    
    //Fungsi Jika boss Kena Tembakan, maka bos hp berkurang
    for (Bullet b : myBullets) {
      if ((loc.y - size / 2 <= b.loc.y && b.loc.x <= loc.x + size / 2)
        && (loc.x  - size / 2 <= b.loc.x && b.loc.y <= loc.y + size / 2)) {
        HP--;
        Score1+=2;
        isDead = true;
        b.isDead = true;
        break;
      }
    }
    for (Bullet b : my2Bullets) {
      if ((loc.y - size / 2 <= b.loc.y && b.loc.x <= loc.x + size / 2)
        && (loc.x  - size / 2 <= b.loc.x && b.loc.y <= loc.y + size / 2)) {
        HP--;
        Score1+=2;
        isDead = true;
        b.isDead = true;
        break;
      }
    }
  }
}
