class Boss2Bullet {

  PVector loc;
  float vel;
  float size;
  int coolingTime;
  boolean isDead;
  int hp = 1;
  int velmov = 0;
  PImage [] image;
  PImage rudal5;
  
  Boss2Bullet() {    
    size = 25;    
    loc = new PVector(random(bos2.loc.x-100, bos2.loc.x+100), (-size / 2) + 200);    
    vel = 3;
    coolingTime = int(random(60));
    isDead = false;
    rudal5 = loadImage("fire.png");
  }

  void display() {
        
    stroke(#39CEE0);    
    //Lokasi Musuh Spawn
    fill(#FA0303);
    image(rudal5, loc.x, loc.y, 30, 30);
    //rect(loc.x, loc.y, size, size);
  }

  void update() {  
    loc.y += vel;
    if (loc.y > height) {
      isDead = true;
    }  
    
  }
}
