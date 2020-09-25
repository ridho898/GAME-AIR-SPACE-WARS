class Drop {
  float x;
  float y;
  float z;
  float r;
  float len;
  float yspeed;

  Drop() {
    x  = random(width);
    y  = random(-5, -50);
    z  = random(0, 20);
    r  = random(-50);
    len = map(z, 0, 20, 10, 20);
    yspeed  = map(z, 0, 20, 1, 20);
  }

  void fall() {
    y = y + yspeed;
    float grav = map(z, 0, 10, 0, 0.1);
    yspeed = yspeed + grav;
    

    if (y > height) {
      y = random(-200, -100);
      yspeed = map(z, 0, 20, 4, 10);
    }
  }

  void show() {
    float thick = map(z, 0, 20, 1, 3);
    r = random(-30);
    strokeWeight(thick);
    for (int i = 0; i < 1; i++) {
    stroke(250+r, 250+r, 250+r);
    //stroke(138, 43, 226);
    line(x, y, x, y+len);
  }
  }
}
