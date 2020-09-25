void Reset(){
  HP = 200;
  finalscore = 0;
  RequirementKill = 200;
  RequirementKill2 = 400;
  Countkill = 0;
  CountJurus = 150;
  CountJurus2 = 150;
  bos.HP = 300;
  bos2.HP = 300;
  start = false;
  boss = true;
  boss2 = true;
  MeteorShower = false;
  Stage = 1;
  Score1 =0;
  CountShow = 0;
  CountShow2 = 0;
  myself.loc = new PVector(width / 2, height - myself.size / 2 - 10);
  myself2.loc = new PVector(width / 2, height - myself2.size / 2 - 10);
  bos.loc = new PVector(width/2, -bos.size / 2);
  bos2.loc = new PVector(width/2, -bos2.size / 2);
  for (Enemy enemy : enemies) {
    enemy.isDead = true;
  }    
  for (Enemy2 enemy2 : enemies2) {
    enemy2.isDead = true;
  }
  for (Meteor meteor : meteories) {
    meteor.isDead = true;
  }
  for (DropHeart dropheart : drophearties) {
    dropheart.isDead = true;
  }

  for (DropWeapon dropweapon : dropweaponies) {
    dropweapon.isDead = true;
  }
  for (BossBullet bossbulleties : bossbulleties) {
    bossbulleties.isDead = true;
  }
  for (Boss2Bullet boss2bulleties : boss2bulleties) {
    boss2bulleties.isDead = true;
  }

  for (JurusBoss jurusboss : jurusbossies) {
    jurusboss.isDead = true;
  }

  for (JurusBoss2a jurusboss2a : jurusbossies2a) {
    jurusboss2a.isDead= true;
  }

  for (JurusBoss2b jurusboss2b : jurusbossies2b) {
    jurusboss2b.isDead=true;
  }
  for (Bullet bullet : myBullets) {
    bullet.isDead=true;
  }
  for (Bullet bullet : my2Bullets) {
    bullet.isDead=true;
  }
  for (Bullet bullet : eneBullets) {
    bullet.isDead=true;
  }
}
