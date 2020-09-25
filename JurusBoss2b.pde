class JurusBoss2b {

  PVector loc;
  float vel;
  float size;
  int coolingTime;
  boolean isDead;
  int hp = 1;
  int velmov = 0;
  PImage [] image;
  PImage rudal3;
  
  JurusBoss2b() {    
    size = 25;    
    loc = new PVector(bos2.loc.x+80,bos2.loc.y);    
    vel = 3;
    coolingTime = int(random(60));
    isDead = false;
    rudal3 = loadImage("rudal2.png");
  }

  void display() {
    
    noFill();
    stroke(#587C4C);    
    //Lokasi Musuh Spawn
    image(rudal3, loc.x, loc.y, size, size);
    //rect(loc.x, loc.y, size, size);
  }

  void update() {  
    loc.y += vel;
    if (loc.y > height) {
      isDead = true;
    }



    ////Fungsi Jika Musuh2 Kena Tembakan, maka musuh mati
    for (Bullet b : myBullets) {                 
      //Fungsi Jika Musuh2 Kena Tembakan, maka musuh mati
      if ((loc.x - size / 2 <= b.loc.x && b.loc.y <= loc.y + size / 2)
        && (loc.y  - size / 2 <= b.loc.y && b.loc.x <= loc.x + size / 2)) {
        hp--;      
        if (hp < 0 )
          isDead = true;
        b.isDead = true;
        break;
      }
    }
    for (Bullet b : my2Bullets) {                 
      //Fungsi Jika Musuh2 Kena Tembakan, maka musuh mati
      if ((loc.x - size / 2 <= b.loc.x && b.loc.y <= loc.y + size / 2)
        && (loc.y  - size / 2 <= b.loc.y && b.loc.x <= loc.x + size / 2)) {
        hp--;
        if (hp < 0 )        
          isDead = true;
        b.isDead = true;
        break;
      }
    }
  }
}
