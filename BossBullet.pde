class BossBullet {

  PVector loc;
  float vel;
  float size;
  int coolingTime;
  boolean isDead;
  int hp = 1;
  int velmov = 0;
  PImage [] image;
  PImage rudal1;
  
  BossBullet() {    
    size = 20;
    if(Stage == 1)
    loc = new PVector(random(bos.loc.x-100, bos.loc.x+100), (-size / 2) + 200);
    else if(Stage == 2)
    loc = new PVector(random(bos2.loc.x-100, bos2.loc.x+100), (-size / 2) + 200);
    vel = 3;
    coolingTime = int(random(60));
    isDead = false;
    rudal1 = loadImage("rudal2.png");
  }

  void display() {
    
    noFill();
    stroke(#39CEE0);    
    //Lokasi Musuh Spawn
    image(rudal1, loc.x, loc.y, 20, 20);
    //rect(loc.x, loc.y, size, size);
  }

  void update() {  
    loc.y += vel;
    if (loc.y > height) {
      isDead = true;
    }



    //Fungsi Jika Musuh2 Kena Tembakan, maka musuh mati
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
