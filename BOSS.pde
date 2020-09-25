class Bos {

  PVector loc;
  float vel;
  float size;
  int coolingTime;
  boolean isDead;
  boolean move = true;
  int HP = 300;
  int MaxHP = 300;
  PImage [] images;
  PImage bos1;

  Bos() {
    size = 200;
    loc = new PVector(width/2, -size - 100 / 2);    
    vel = 3;
    coolingTime = int(random(60));
    isDead = false;
    bos1 = loadImage("ship3.png");
  }

  void display() {
    noFill();    
    stroke(255, 0, 0);   
    //Lokasi Musuh Spawn

    //rect(loc.x, loc.y, size, size);
    image(bos1, loc.x, loc.y, 180, 180);
    
    ////Boss HP Display
    //rectMode(CORNER);
    //stroke(#FFFFFF);
    //fill(#000000);
    //rect(45+loc.x, 18+loc.y, MaxHP+loc.x, 15+loc.y);

    //if (HP < MaxHP*0.5 && HP > MaxHP*0.2) {
    //  fill(#F5FA03);
    //} else if (HP <= MaxHP*0.2) {
    //  fill(255, 0, 0);
    //} else {
    //  fill(#46FC00);
    //}
    //rect(45, 18, HP, 15);
    //rectMode(CENTER);
    //fill(#FFFFFF);
    //stroke(0);
    
    
    //-=--=-=-=-=-=-=--=---=--=---=-=-=-=-=-=-=-=-------=-=-=-===========-=-=-
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
