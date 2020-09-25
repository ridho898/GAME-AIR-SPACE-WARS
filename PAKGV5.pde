import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import ddf.minim.*;

Myself myself;
Myself2 myself2;
Bos bos;
Bos2 bos2;
Minim minim;
Minim minim2;
Minim minim3;
AudioPlayer game1, gameover, healthitem, destroy, powerup, powerup2, healthitem2, hit, bosong, victory;

ArrayList<Enemy> enemies;
ArrayList<Enemy2> enemies2;
ArrayList<Meteor> meteories;
ArrayList<DropHeart> drophearties;
ArrayList<DropWeapon> dropweaponies;
ArrayList<BossBullet> bossbulleties;
ArrayList<Boss2Bullet> boss2bulleties;
ArrayList<JurusBoss> jurusbossies;
ArrayList<JurusBoss2a> jurusbossies2a;
ArrayList<JurusBoss2b> jurusbossies2b;
ArrayList<Bos> bosies;
ArrayList<Bos2> bos2ies;
ArrayList<Bullet> myBullets;
ArrayList<Bullet> my2Bullets;
ArrayList<Bullet> eneBullets;

int menu = 0;
int Countkill = 0;
int Score1 = 0;
int HighScore = 0;
int RequirementKill = 1;
int RequirementKill2 = 400;
int CountJurus = 150;
int CountJurus2 = 150;
int HP = 200;
int MaxHP =250;
boolean start = false;
boolean boss = true;
boolean boss2 = true;
boolean MeteorShower = false;
int Stage = 1;
int CountShow = 0;
int CountShow2 = 0;
int finalscore;
float speed, speed1;
PImage space, plane, plane2, bg;

Drop[] drops = new Drop[0];
Star[] stars = new Star[100];

void setup() {
  size(640, 640);
  rectMode(CENTER);
  myself = new Myself();
  myself2 = new Myself2();
  bos = new Bos();
  bos2 = new Bos2();  
  enemies = new ArrayList<Enemy>();
  enemies2 = new ArrayList<Enemy2>();
  meteories = new ArrayList<Meteor>();
  drophearties = new ArrayList<DropHeart>();
  dropweaponies = new ArrayList<DropWeapon>();
  bosies = new ArrayList<Bos>();
  bos2ies = new ArrayList<Bos2>();
  bossbulleties = new ArrayList<BossBullet>();
  boss2bulleties = new ArrayList<Boss2Bullet>();
  jurusbossies = new ArrayList<JurusBoss>();
  jurusbossies2a = new ArrayList<JurusBoss2a>();
  jurusbossies2b = new ArrayList<JurusBoss2b>();
  myBullets = new ArrayList<Bullet>();
  my2Bullets = new ArrayList<Bullet>();
  eneBullets = new ArrayList<Bullet>();

  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Drop();
  }
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }

  minim = new Minim(this);
  minim2 = new Minim(this);
  minim3 = new Minim(this);
  game1 = minim.loadFile("game1.wav");
  gameover = minim2.loadFile("GameOver.mp3");  
  victory = minim3.loadFile("victory.mp3");
  game1.loop();
}

void draw() {

  background(0);  
  if (menu==0) {
    imageMode(CORNER);
    speed1 = map(100, 0, width, 0, 150);
    //space = loadImage("backg.png");
    //plane = loadImage("plane.png");
    //plane2 = loadImage("plane2.png");
    bg= loadImage ("background.png");

    //image(space, 200, 40, 240, 70);
    //image(plane, 95, 480, 109, 119);
    //image(plane2, 440,480,109,119);
    image(bg, 0, 0, 640, 640);
    //translate(width/2, height/2);
    for (int i = 0; i < stars.length; i++) {
      stars[i].update();
      stars[i].show();
    }
  }

  if (menu==0) {  
    stroke(0);
    //fill(0, 200, 20);
    //rect(0, 0, 1000, 700);  
    strokeWeight(2);

    fill(200); //singleplayer
    if (mouseX > 230 && mouseX < 410 && mouseY > 180 && mouseY < 215) {
      fill(200, 0, 0);
    }
    rect(320, 200, 180, 35);

    fill(200); //multiplayer
    if (mouseX > 230 && mouseX < 410 && mouseY > 230 && mouseY < 265) {
      fill(200, 0, 0);
    }
    rect(320, 250, 180, 35);

    fill(200); //instructions
    if (mouseX > 230 && mouseX < 410 && mouseY > 285 && mouseY < 315) {
      fill(200, 0, 0);
    }
    rect(320, 300, 180, 35);

    fill(200); //credit
    if (mouseX > 230 && mouseX < 410 && mouseY > 330 && mouseY < 365) {
      fill(200, 0, 0);
    }
    rect(320, 350, 180, 35);

    fill(200); //highscore
    if (mouseX > 230 && mouseX < 410 && mouseY > 380 && mouseY < 415) {
      fill(200, 0, 0);
    }
    rect(320, 400, 180, 35);


    fill(200); //exit
    if (mouseX > 230 && mouseX < 410 && mouseY > 430 && mouseY < 465) {
      fill(200, 0, 0);
    }
    rect(320, 450, 180, 35);



    fill(0);
    textAlign(LEFT);
    textSize(15);
    text("SINGLEPLAYER", 265, 205);
    text("MULTIPLAYER", 270, 255);
    text("INSTRUCTIONS", 265, 305);
    text("CREDIT", 290, 355);
    text("HIGHSCORE", 275, 405);
    text("EXIT", 300, 455);
  }


  //text("PRESS MOUSE TO START GAME\n rule : bunuh 100 musuh untuk menang,\n mati 10 kali anda kalah", 220, 320); 

  if ((mousePressed || start) && HP >= 0 && (menu == 1 || menu == 2)) {
    start=true;
    background(0);

    //music mk = new music();
    //mk.musik();

    for (int i = 0; i < drops.length; i++) {
      drops[i].fall();
      drops[i].show();
    }

    

    rectMode(CORNER);
    stroke(#FFFFFF);
    fill(#000000);
    rect(45, 18, MaxHP, 15);

    if (HP < MaxHP*0.5 && HP > MaxHP*0.2) {
      fill(#F5FA03);
    } else if (HP <= MaxHP*0.2) {
      fill(255, 0, 0);
    } else {
      fill(#46FC00);
    }
    rect(45, 18, HP, 15);
    rectMode(CENTER);
    fill(#FFFFFF);
    stroke(0);
    text("HP : ", 10, 30);
    text("Score : "+Score1, 10, 60);
    text("Player 1 S.Weapon : "+myself.Weaponizer, 400, 30);    
    text("Player 2 S.Weapon : "+myself2.Weaponizer, 400, 60);

    noFill();
    myself.display();
    if (menu == 2)
    {
      myself2.display();
    }

    if (bos.HP > 0)
    {
      bos.display();
    } else {
      bos.loc.x = -100;
      bos.loc.y = -100;
    }

    if (bos2.HP > 0 &&  Stage == 2)
    {
      bos2.display();
    } else {
      bos2.loc.x = -100;
      bos2.loc.y = -100;
    }

    for (Enemy enemy : enemies) {
      enemy.display();
    }
    for (Enemy2 enemy2 : enemies2) {
      enemy2.display();
    }
    for (DropHeart dropheart : drophearties) {
      dropheart.display();
    }
    for (DropWeapon dropweapon : dropweaponies) {
      dropweapon.display();
    }
    for (Meteor meteor : meteories) {
      meteor.display();
    }


    for (Bos bos : bosies) {
      bos.display();
    }
    for (Bos2 bos2 : bos2ies) {
      bos2.display();
    }
    for (BossBullet bosbullet : bossbulleties) {
      bosbullet.display();
    }
    for (Boss2Bullet bos2bullet : boss2bulleties) {
      bos2bullet.display();
    }
    for (JurusBoss jurusboss : jurusbossies) {
      jurusboss.display();
    }
    for (JurusBoss2a jurusboss2a : jurusbossies2a) {
      jurusboss2a.display();
    }
    for (JurusBoss2b jurusboss2b : jurusbossies2b) {
      jurusboss2b.display();
    }

    for (Bullet bullet : myBullets) {
      bullet.display();
    }
    for (Bullet bullet : my2Bullets) {
      bullet.display();
    }
    for (Bullet bullet : eneBullets) {
      bullet.display();
    }

    myself.update();
    if (menu == 2) {
      myself2.update();
    }

    ArrayList<Enemy> nextEnemies = new ArrayList<Enemy>();
    ArrayList<Enemy2> nextEnemies2 = new ArrayList<Enemy2>();
    ArrayList<Meteor> nextMeteor = new ArrayList<Meteor>();
    ArrayList<DropHeart> nextDrophearties = new ArrayList<DropHeart>();
    ArrayList<DropWeapon> nextDropweaponies = new ArrayList<DropWeapon>();

    ArrayList<Bos> nextBosies = new ArrayList<Bos>();
    ArrayList<Bos2> nextBos2ies = new ArrayList<Bos2>();
    ArrayList<BossBullet> nextBossbulleties = new ArrayList<BossBullet>();
    ArrayList<Boss2Bullet> nextBoss2bulleties = new ArrayList<Boss2Bullet>();
    ArrayList<JurusBoss> nextJurusbossies = new ArrayList<JurusBoss>();
    ArrayList<JurusBoss2a> nextJurusbossies2a = new ArrayList<JurusBoss2a>();
    ArrayList<JurusBoss2b> nextJurusbossies2b = new ArrayList<JurusBoss2b>();

    for (Enemy enemy : enemies) {
      enemy.update();
      if (!enemy.isDead) {
        nextEnemies.add(enemy);
      }
    }
    for (Enemy2 enemy2 : enemies2) {
      enemy2.update();
      if (!enemy2.isDead) {
        nextEnemies2.add(enemy2);
      }
    }
    for (Meteor meteor : meteories) {
      meteor.update();
      if (!meteor.isDead) {
        nextMeteor.add(meteor);
      }
    }
    for (DropHeart dropheart : drophearties) {
      dropheart.update();
      if (!dropheart.isDead) {
        nextDrophearties.add(dropheart);
      }
    }

    for (DropWeapon dropweapon : dropweaponies) {
      dropweapon.update();
      if (!dropweapon.isDead) {
        nextDropweaponies.add(dropweapon);
      }
    }

    for (Bos bos : bosies) {
      bos.update();
      if (!bos.isDead) {
        bosies.add(bos);
      }
    }

    for (Bos2 bos2 : bos2ies) {
      bos2.update();
      if (!bos2.isDead) {
        bos2ies.add(bos2);
      }
    }

    for (BossBullet bossbulleties : bossbulleties) {
      bossbulleties.update();
      if (!bossbulleties.isDead) {
        nextBossbulleties.add(bossbulleties);
      }
    }
    for (Boss2Bullet boss2bulleties : boss2bulleties) {
      boss2bulleties.update();
      if (!boss2bulleties.isDead) {
        nextBoss2bulleties.add(boss2bulleties);
      }
    }

    for (JurusBoss jurusboss : jurusbossies) {
      jurusboss.update();
      if (!jurusboss.isDead) {
        nextJurusbossies.add(jurusboss);
      }
    }

    for (JurusBoss2a jurusboss2a : jurusbossies2a) {
      jurusboss2a.update();
      if (!jurusboss2a.isDead) {
        nextJurusbossies2a.add(jurusboss2a);
      }
    }

    for (JurusBoss2b jurusboss2b : jurusbossies2b) {
      jurusboss2b.update();
      if (!jurusboss2b.isDead) {
        nextJurusbossies2b.add(jurusboss2b);
      }
    }

    //Membuat musuh hilang jika mati
    enemies = nextEnemies;
    enemies2 = nextEnemies2;
    meteories = nextMeteor;
    bossbulleties = nextBossbulleties;
    boss2bulleties = nextBoss2bulleties;
    bosies = nextBosies;
    bos2ies = nextBos2ies;
    jurusbossies = nextJurusbossies;
    jurusbossies2a = nextJurusbossies2a;
    jurusbossies2b = nextJurusbossies2b;
    drophearties = nextDrophearties;
    dropweaponies = nextDropweaponies;

    ArrayList<Bullet> nextMyBullets = new ArrayList<Bullet>();
    for (Bullet bullet : myBullets) {
      bullet.update();
      if (!bullet.isDead) {
        nextMyBullets.add(bullet);
      }
    }
    myBullets = nextMyBullets;

    ArrayList<Bullet> nextEneBullets = new ArrayList<Bullet>();
    for (Bullet bullet : eneBullets) {
      bullet.update();
      if (!bullet.isDead) {
        nextEneBullets.add(bullet);
      }
    }

    ArrayList<Bullet> nextMy2Bullets = new ArrayList<Bullet>();
    for (Bullet bullet : my2Bullets) {
      bullet.update();
      if (!bullet.isDead) {
        nextMy2Bullets.add(bullet);
      }
    }

    eneBullets = nextEneBullets;
    my2Bullets = nextMy2Bullets;

    //FUNGSI Untuk Spawn Musuh  
    if (random(1) < (0.05) && Countkill < RequirementKill && !MeteorShower) {
      enemies.add(new Enemy());
    }

    if (random(1) < (0.1) && Countkill < RequirementKill && !MeteorShower) {   
      enemies2.add(new Enemy2());
    }

    //Fungsi untuk Spawn Heart
    if (random(1) < 0.005) {
      drophearties.add(new DropHeart());
    }      

    //Fungsi Untuk Spawn Meteor
    if (random(1) < 0.0095 && !MeteorShower) {
      meteories.add(new Meteor());
    }

    if (random(1) < 0.0035) {
      dropweaponies.add(new DropWeapon());
    }

    //Fungsi Untuk Spawn Boss
    if (Countkill >= RequirementKill && boss && bos.HP >0) {      
      bos.update();
    }

    if (random(1) < 0.2 && Countkill >= RequirementKill && bos.loc.y >= 200) {      
      bossbulleties.add(new BossBullet());
    }

    //====================JURUS BOSS==========================//

    if (CountJurus >= 150)
    {            
      if (random(1) < 0.001 && bos.loc.y >= 200)
      {
        CountJurus =0;
      } else if (bos.HP < 40)
      {
        CountJurus = -400;
      }
    }

    if (random(1) < 0.3 && Countkill >= RequirementKill && bos.loc.y >= 200 && CountJurus < 150) {

      jurusbossies.add(new JurusBoss());      
      CountJurus++;
    }
    //========================================================//



    //=========================Musuh Stage 2=================================//
    //=========================Musuh Stage 2=================================//    
    if (random(1) < (0.05) && Countkill < RequirementKill2 && !MeteorShower && Stage==2 && CountShow >= 3000) {
      enemies.add(new Enemy());
    }

    if (random(1) < (0.12) && Countkill < RequirementKill2 && !MeteorShower && Stage==2 && CountShow >= 3000) {   
      enemies2.add(new Enemy2());
    }

    //====================JURUS BOSS==========================//
    if (CountJurus2 >= 150)
    {            
      if (random(1) < 0.001 && bos2.loc.y >= 200)
      {        
        CountJurus2 =0;
      } else if (bos2.HP < 40)
      {
        CountJurus2 = -400;
      }
    }

    if (random(1) < 0.095 && Countkill >= RequirementKill2 && bos2.loc.y >= 200 && CountJurus2 < 150) {

      jurusbossies2a.add(new JurusBoss2a());
      jurusbossies2b.add(new JurusBoss2b());
      CountJurus++;
    }
    //========================================================//

    if (Countkill >= RequirementKill2 && boss2 && bos2.HP >0 && Stage == 2) {      
      bos2.update();
    }

    if (random(1) < 0.083 && Countkill >= RequirementKill2 && bos2.loc.y >= 200) {      
      bossbulleties.add(new BossBullet());
    }

    if (random(1) < 0.083 && Countkill >= RequirementKill2 && bos2.loc.y >= 200) {      
      boss2bulleties.add(new Boss2Bullet());
    }

    if (MeteorShower && random(1) < 0.3) {
      meteories.add(new Meteor());
    }
    //=========================Musuh Stage 2=================================//    
    //=========================Musuh Stage 2=================================//      

    if (CountShow > 240 && Stage == 1)
    {
      text("YOU CLEARED STAGE 1!!!", 220, 320);
      CountShow++;
      if (CountShow > 500 && Stage == 1) {
        Stage = 2;
      }
    } else if (bos.HP <1)
    {
      CountShow++;
    }

    if (CountShow2 > 240 && Stage == 2)
    {          
      text("YOU BEAT THE GAME CONGRATULATION!!!", 220, 300);
      text("FINAL SCORE : "+finalscore, 220, 340);
      text("press mouse to back to menu", 220, 380);
      game1.pause();
      victory.play();
      if (HighScore < finalscore)
        HighScore =finalscore;
      CountShow2++;      
      if (mousePressed) {
        victory.pause();
        game1.rewind();
        game1.loop();
        Reset();
        menu = 0;
      }
    } else if (bos2.HP <1)
    {
      finalscore = Score1;
      CountShow2++;
    }

    if (CountShow > 500 && Stage == 2 && CountShow <650) {
      fill(#FA0303);
      text("WARNING!!! WARING!!! METEOR SHOWER IS COMMING", width / 4 - 50, width / 2);
      noFill();
    } else if (CountShow > 650 && Stage == 2 && CountShow <= 3000)
    {
      MeteorShower=true;
      CountShow++;
    } else if (CountShow >= 3000 && Stage == 2) {
      MeteorShower = false;
    }
  } else if (HP < 0) {
    background(0);
    game1.pause();
    text("GAME OVER", 280, 280);
    gameover.play();


    text("FINAL SCORE : "+Score1, 270, 320);
    if (HighScore < Score1)
      HighScore =Score1;
    if (mousePressed) {
      gameover.pause();
      game1.rewind();
      game1.loop();
      menu=0;
      Reset();
    }
  } else if (menu == 3) {
    background(100);
    fill(200);
    rect(0, 0, 6400, 6400);
    fill(0);
    strokeWeight(1);

    textSize(32);
    textAlign(LEFT, TOP);
    text("Air Space War", 230, 20);

    textSize(22);
    text(">Player 1 : Move with Mouse Cursor\n>Player 2 : Move with W-A-S-D Button\n>Heart Icon for Restore Health\n>? Icon for Upgrade Weapon, \n     Player 1 Click Mouse, Player 2 Click Tab to Use it", 60, 112);

    fill(200);
    strokeWeight(2);
    if (mouseX > 59 && mouseX < 181 && mouseY > 500 && mouseY < 561) {
      fill(200, 0, 0);
    }
    rect(120, 530, 120, 60);

    fill(0);
    strokeWeight(1);
    text("Back", 95, 515);
  } else if (menu == 4) {
    background(100);
    fill(200);
    rect(0, 0, 6400, 6400);
    fill(0);
    strokeWeight(1);

    textSize(32);
    textAlign(LEFT, TOP);
    text("Credits", 60, 60);

    textSize(22);
    text("1. Muhammad Ridho Iryarahadi - 1615015170 \n2. Muhammad Fahrizal Irfandi - 1615015161 \n3. Muhammad Iqbal - 1615015185 \n4. Octafian CHristianto - 1615015171 \n5. Kurniati Bahruddin - 1615015157", 60, 112);

    fill(200);
    strokeWeight(2);
    if (mouseX > 59 && mouseX < 181 && mouseY > 500 && mouseY < 561) {
      fill(200, 0, 0);
    }
    rect(120, 530, 120, 60);

    fill(0);
    strokeWeight(1);
    text("Back", 95, 515);
  } else if (menu == 5) {
    background(100);
    fill(200);
    rect(0, 0, 6400, 6400);
    fill(0);
    strokeWeight(1);

    textSize(32);
    textAlign(LEFT, TOP);
    text("", 60, 60);

    textSize(40);
    text("High Score : "+HighScore, 60, 112);

    fill(200);
    strokeWeight(2);
    if (mouseX > 59 && mouseX < 181 && mouseY > 500 && mouseY < 561) {
      fill(200, 0, 0);
    }
    rect(120, 530, 120, 60);

    fill(0);
    strokeWeight(1);
    textSize(22);
    text("Back", 95, 515);
  } else if (menu == 6) {
    exit();
  }
}

void mousePressed() {  
  if (menu == 0 && mouseX > 230 && mouseX < 410 && mouseY > 180 && mouseY < 215) { //singleplayer
    menu = 1;
  }
  if (menu == 0 && mouseX > 230 && mouseX < 410 && mouseY > 230 && mouseY < 265) { //multiplayer
    menu = 2;
  }
  if (menu == 0 && mouseX > 230 && mouseX < 410 && mouseY > 285 && mouseY < 315) { //instructions
    menu = 3;
  }
  if (menu == 3 && mouseX > 59 && mouseX < 181 && mouseY > 500 && mouseY < 561) { //instructions back
    menu = 0;
  }  
  if (menu == 0 && mouseX > 230 && mouseX < 410 && mouseY > 330 && mouseY < 365) { //credit
    menu = 4;
  }
  if (menu == 4 && mouseX > 59 && mouseX < 181 && mouseY > 500 && mouseY < 561) { //credit back
    menu = 0;
  }    
  if (menu == 0 && mouseX > 230 && mouseX < 410 && mouseY > 380 && mouseY < 415) { //highscore
    menu = 5;
  }
  if (menu == 5 && mouseX > 59 && mouseX < 181 && mouseY > 500 && mouseY < 561) { //highscore back
    menu = 0;
  }   
  if (menu == 0 && mouseX > 230 && mouseX < 410 && mouseY > 430 && mouseY < 465) { //exit
    menu = 6;
  }
}
