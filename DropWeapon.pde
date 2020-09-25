class DropWeapon {

  PVector loc;
  float vel;
  float size;
  int coolingTime;
  boolean isDead;
  String WeaponType;
   PImage [] images;
  PImage weapon1;

  DropWeapon() {
    size = 25;  

    if (random(1) < 0.5) {
      WeaponType="BarrageGun";
    } else if (random(1) < 0.6) {
      WeaponType="DoubleGun";
    } else{     
      WeaponType="TrippleGun";
    }
    loc = new PVector(random(size / 2, width - size / 2) - 160, -size / 2);    
    vel = 3;
    coolingTime = int(random(60));
    isDead = false;
    weapon1 = loadImage("tanya.png");
  }

  void display() {    
    stroke(#FF5040);
      fill(#8FFF40);
    //Lokasi Heart Spawn    
    image(weapon1, loc.x, loc.y, 30, 30);
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

    //Fungsi Jika Musuh2 Kena Tembakan, maka musuh mati
  }
}
