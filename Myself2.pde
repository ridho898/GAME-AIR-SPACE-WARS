class Myself2 {

  PVector loc;
  float size;
  float coolingTime;
  boolean isDead;
  PImage [] images;
  PImage shooter, damaged;
  String Weaponizer = "None";
  boolean Weaponget = false;
  boolean UseSpecial = false;
  int WeapongetTime = 0;
  
  boolean upPressed = false;
  boolean downPressed = false;
  boolean leftPressed = false;
  boolean rightPressed = false;

  Myself2() {
    size = 25;
    loc = new PVector(width / 2, height - size / 2 - 10);
    coolingTime = 0;
    isDead = false;
    shooter = loadImage ("shooter2.png");
    damaged = loadImage ("damaged.png");
  }

  void display() {
    if (isDead) {
      fill(255, 255, 0);
      stroke(0, 255, 0);
    } else {
      noFill();
      stroke(0, 255, 0);
    }
    //rect(loc.x, loc.y, size, size);
    imageMode(CENTER);
    image(shooter, loc.x, loc.y, 50, 50);
  }

  void update() {
    isDead = false;
    if (keyPressed == true){
    if (upPressed && loc.y > 0) {
    loc.y -= 5;
    }

    if (downPressed && loc.y < width) {
    loc.y += 5;
    }

    if (leftPressed && loc.x >0) {
    loc.x -= 5;
    }

    if (rightPressed && loc.x <width) {
    loc.x += 5;
    }}
    
    if (key == 'w') {
    upPressed = true;
    }
    else if (key == 's') {
    downPressed = true;
    }
    else if (key == 'a') {
    leftPressed = true;
    }
    else if (key == 'd') {
    rightPressed = true;
    }
    
    if (keyPressed == false){
    if (key == 'w') {
    upPressed = false;
    downPressed = false;
    leftPressed = false;
    rightPressed = false;
    }
    else if (key == 's') {
    upPressed = false;
    downPressed = false;
    leftPressed = false;
    rightPressed = false;
    }
    else if (key == 'a') {
    upPressed = false;
    downPressed = false;
    leftPressed = false;
    rightPressed = false;
    }
    else if (key == 'd') {
    upPressed = false;
    downPressed = false;
    leftPressed = false;
    rightPressed = false;
    }}
    if (key == TAB)
    {
      UseSpecial=true;
    }               
    coolingTime+=0.6;



    if (Weaponget == true && WeapongetTime < 310 && Weaponizer == "BarrageGun" && UseSpecial)
    {
      coolingTime+=1.9;
      WeapongetTime++;
    } else if (Weaponget == true && WeapongetTime < 510 && Weaponizer == "DoubleGun" && UseSpecial)
    { 
      coolingTime+=0.3;
      WeapongetTime++;
    } else if (Weaponget == true && WeapongetTime < 510 && Weaponizer == "TrippleGun" && UseSpecial)
    {   
      coolingTime+=0.3;
      WeapongetTime++;
    } else if (Weaponget == true && WeapongetTime==0)
    {
    } else
    {
      WeapongetTime = 0;
      Weaponget = false;
      Weaponizer = "None";
      UseSpecial = false;
    }

    if (coolingTime >= 10) {
      if (Weaponizer == "DoubleGun" && UseSpecial) {
        myBullets.add(new Bullet(this, isDead));
        myBullets.add(new Bullet(this, size));
      } else if (Weaponizer == "TrippleGun" && UseSpecial) {
        myBullets.add(new Bullet(this));
        myBullets.add(new Bullet(this, isDead));
        myBullets.add(new Bullet(this, size));
      } else {
        myBullets.add(new Bullet(this));
      }      
      coolingTime = 0;
    }

    for (Bullet b : eneBullets) {
      //Bullet hilang jika mengenai player
      if ((loc.y - size / 2 <= b.loc.y && b.loc.x <= loc.x + size / 2)
        && (loc.x - size / 2 <= b.loc.x && b.loc.y <= loc.y + size / 2)) {
        HP-=2;
        image(damaged, loc.x, loc.y, 50, 50);        
        isDead = true;
        b.isDead = true;
        break;
      }
    }

    //jika nabrak musuh1, musuh1 mati, darah kita berkurang
    for (Enemy e : enemies) {
      if (abs(loc.y - e.loc.x) < size / 2 + e.size / 2 
        && abs(loc.x - e.loc.y) < size / 2 + e.size / 2) {
        HP-=5;
        image(damaged, loc.x, loc.y, 50, 50);

        isDead = true;
        e.isDead = true;
        break;
      }
    }
    //jika nabrak musuh, musuh2 dan kita mati
    for (Enemy2 e : enemies2) {
      if (abs(loc.y - e.loc.y) < size / 2 + e.size / 2 
        && abs(loc.x - e.loc.x) < size / 2 + e.size / 2) {
        HP-=5;
        image(damaged, loc.x, loc.y, 50, 50);        
        isDead = true;
        e.isDead = true;
        break;
      }
    }

    for (Meteor e : meteories) {
      if (abs(loc.y - e.loc.y) < size / 2 + e.size / 2 
        && abs(loc.x - e.loc.x) < size / 2 + e.size / 2) {
        HP-=15;
        image(damaged, loc.x, loc.y, 50, 50);        
        isDead = true;
        e.isDead = true;
        break;
      }
    }

    for (DropHeart e : drophearties) {
      if (abs(loc.y - e.loc.y) < size / 2 + e.size / 2 
        && abs(loc.x - e.loc.x) < size / 2 + e.size / 2) {
        HP = HP+30;
        healthitem2 = minim.loadFile("healtitem.mp3");
          healthitem2.play();
        image(damaged, loc.x, loc.y, 50, 50);        
        e.isDead = true;
        break;
      }
    }

    for (DropWeapon e : dropweaponies) {
      if (abs(loc.y - e.loc.y) < size / 2 + e.size / 2 
        && abs(loc.x - e.loc.x) < size / 2 + e.size / 2) {
          powerup2 = minim.loadFile("destroy.wav");
          powerup2.play();
        Weaponget=true;
        WeapongetTime=0;
        UseSpecial=false;
        Weaponizer = e.WeaponType;
        image(damaged, loc.x, loc.y, 50, 50);        
        e.isDead = true;
        break;
      }
    }

    for (BossBullet e : bossbulleties) {
      if (abs(loc.y - e.loc.y) < size / 2 + e.size / 2 
        && abs(loc.x - e.loc.x) < size / 2 + e.size / 2) {
        HP-=5;
        image(damaged, loc.x, loc.y, 50, 50);
        isDead = true;
        e.isDead = true;
        break;
      }
    }
    
    for (Boss2Bullet e : boss2bulleties) {
      if (abs(loc.y - e.loc.y) < size / 2 + e.size / 2 
        && abs(loc.x - e.loc.x) < size / 2 + e.size / 2) {
        HP-=5;
        image(damaged, loc.x, loc.y, 50, 50);
        isDead = true;
        e.isDead = true;
        break;
      }
    }

    for (JurusBoss e : jurusbossies) {
      if (abs(loc.y - e.loc.y) < size / 2 + e.size / 2 
        && abs(loc.x - e.loc.x) < size / 2 + e.size / 2) {
        HP-=2;
        image(damaged, loc.x, loc.y, 50, 50);
        isDead = true;
        e.isDead = true;
        break;
      }
    }
    
    for (JurusBoss2a e : jurusbossies2a) {
      if (abs(loc.y - e.loc.y) < size / 2 + e.size / 2 
        && abs(loc.x - e.loc.x) < size / 2 + e.size / 2) {
        HP-=2;
        image(damaged, loc.x, loc.y, 50, 50);
        isDead = true;
        e.isDead = true;
        break;
      }
    }
    
    for (JurusBoss2b e : jurusbossies2b) {
      if (abs(loc.y - e.loc.y) < size / 2 + e.size / 2 
        && abs(loc.x - e.loc.x) < size / 2 + e.size / 2) {
        HP-=2;
        image(damaged, loc.x, loc.y, 50, 50);
        isDead = true;
        e.isDead = true;
        break;
      }
    }

    if (abs(loc.y - bos.loc.y) < size / 2 + bos.size / 2 
      && abs(loc.x - bos.loc.x) < size / 2 + bos.size / 2) {
      HP = -1;        
      isDead = true;
      bos.isDead = true;
    }
    
    if (abs(loc.y - bos2.loc.y) < size / 2 + bos2.size / 2 
      && abs(loc.x - bos2.loc.x) < size / 2 + bos2.size / 2) {
      HP = -1;        
      isDead = true;
      bos2.isDead = true;
    }
  }
}
