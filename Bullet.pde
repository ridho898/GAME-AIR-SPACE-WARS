class Bullet{
  
  PVector loc;
  float vel;
  boolean isMine;
  boolean isDead;
  
  Bullet(){
    loc = new PVector(myself.loc.x, myself.loc.y);    
    vel = -5;
    isMine = true;
  }
  
  Bullet(Myself myself){
    loc = new PVector(myself.loc.x-25, myself.loc.y+25);    
    vel = -5;
    isMine = true;
  }
  
  Bullet(Myself myself, float lox){
    loc = new PVector(myself.loc.x+25, myself.loc.y+25);    
    vel = -5;
    isMine = true;
  }
  
  Bullet(Myself2 myself2){
    loc = new PVector(myself2.loc.x, myself2.loc.y);
    vel = -5;
    isMine = true;
  }
  
  Bullet(Myself2 myself2, float weapon1){
    loc = new PVector(myself2.loc.x+25, myself2.loc.y+25);
    vel = -5;
    isMine = true;
  }
  
  Bullet(Myself2 myself2, boolean weapon2){
    loc = new PVector(myself2.loc.x-25, myself2.loc.y+25);
    vel = -5;
    isMine = true;
  }
  
  Bullet(Enemy enemy){
    loc = new PVector(enemy.loc.y, enemy.loc.x);
    vel = 5;
    isMine = false;
  }
  
  Bullet(Enemy2 enemy2){
    loc = new PVector(enemy2.loc.x, enemy2.loc.y);
    vel = 5;
    isMine = false;
  }
  
  Bullet(Bos bos){
    loc = new PVector(bos.loc.y, bos.loc.x);
    vel = 5;
    isMine = false;
  }
  
  void display(){
    if(isMine){
      stroke(0, 255, 0);
    } else {
      stroke(255, 0, 0);    
    }
    //Bentuk Bullet dan gerakannya
    line(loc.x, loc.y, loc.x, loc.y+vel);    
  }

  void update(){
    loc.y += vel;    
    if((vel > 0 && loc.y > height) || (vel < 0 && loc.x < 0)){
      isDead = true;
    }
  }  
}
