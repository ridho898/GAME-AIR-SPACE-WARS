class Enemy{
  
  PVector loc;
  float vel;
  float size;
  float coolingTime;
  boolean isDead;
   PImage [] images;
  PImage enemy1;
  
  Enemy(){
    size = 40; 
    loc = new PVector(random(size / 2, width - size / 2) - 160, -size / 2);    
    vel = 3;
    coolingTime = int(random(60));
    isDead = false;
    enemy1 = loadImage("lalat.png");
  }
  
  void display(){
    noFill();
    stroke(255, 0, 0);    
    //Lokasi Musuh Spawn
    image(enemy1, loc.y, loc.x, 50, 50);
    //rect(loc.y, loc.x, size, size);
  }

  void update(){
    //Velocity Musuh
    loc.y += vel;
    if(loc.y > height){
      isDead = true;
    }
    
    coolingTime++;
    if(coolingTime >= 60){
      eneBullets.add(new Bullet(this));
      coolingTime = 0;
    }
    
    //Fungsi Jika Musuh2 Kena Tembakan, maka musuh mati
    for(Bullet b: myBullets){
      if((loc.x - size / 2 <= b.loc.y && b.loc.x <= loc.y + size / 2)
         && (loc.y  - size / 2 <= b.loc.x && b.loc.y <= loc.x + size / 2)){
        Countkill++;
        Score1+=2;
        isDead = true;
        b.isDead = true;
        break;
      }
    }
    for(Bullet b: my2Bullets){
      if((loc.x - size / 2 <= b.loc.y && b.loc.x <= loc.y + size / 2)
         && (loc.y  - size / 2 <= b.loc.x && b.loc.y <= loc.x + size / 2)){
        Countkill++;        
        isDead = true;
        b.isDead = true;
        break;
      }
    }
  }    
}
