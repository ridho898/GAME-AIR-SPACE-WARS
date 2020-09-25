class DropHeart{
  
  PVector loc;
  float vel;
  float size;
  int coolingTime;
  boolean isDead;
  PImage [] images;
  PImage heart;
  
  DropHeart(){
    size = 25;   
    loc = new PVector(random(size / 2, width - size / 2), -size / 2);    
    vel = 3;
    coolingTime = int(random(60));
    isDead = false;
    heart = loadImage("heart.png");
  }
  
  void display(){
    noFill();
    stroke(#FF00EF);    
    //Lokasi Heart Spawn
    
    image(heart, loc.x, loc.y, 30, 30);
    //rect(loc.x, loc.y, size, size);
  }

  void update(){
    //Velocity Musuh
    loc.y += vel;
    if(loc.y > height){
      isDead = true;
    }
    
    coolingTime++;
    if(coolingTime >= 60){   
      coolingTime = 0;
    }
    
    //Fungsi Jika Musuh2 Kena Tembakan, maka musuh mati
  }    
}
