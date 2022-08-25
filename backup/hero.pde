class Hero extends GameObject {
  PVector direction;
  //float speed;


  AnimatedGIF currentAction;
  int shotTimer, threshold;
  int timer;
  int transparency_counter;
  int c;
  int cover;
  boolean coveroff;
  boolean effect;
  boolean win;
  Hero() {

    super();
    effect = false;
    roomX= 1;
    roomY= 1;
    hp=20;
    hpmax=20;
    win= false;
    ammomax=1000;
    ammo =1000;
    c=1;
    cover =0;
    coveroff = true;
    damage = 0;
    xp= 5;
    size= 80;
    timer = 60;
    shotTimer =0;
    threshold=60;
   
    currentAction = manup;
    transparency_counter = 255;
  }


  void show() {
    // currentAction.show(loc.x,loc.y, size/1.5, size);
    fill(#535D5F);

    if (cover == 1 && coveroff == true) {
      rect(width/2, height/2, 100, 100);
    }
   
    if (c == 1) {
      manup.show(loc.x, loc.y, size, size);
      print(cover);
      print(coveroff);
    }
    if (c == 2) {
      manleft.show(loc.x, loc.y, size, size);
    }
    if (c == 3) {
      man_down.show(loc.x, loc.y, size, size);
    }
    if (c == 4) {
      manright.show(loc.x, loc.y, size, size);
    }

    if (abs( velocity.y)  > abs( velocity.x)) {
      if ( velocity.y > 0) c = 3;
      else c = 1;
    } else {
      if  (velocity.x > 0) c = 4;
      else  c = 2;
    }
   
    fill(black);
    
 
  }

  void act() {


    super.act();
    
    
    if (w) velocity.y = -speed;
    if (a) velocity.x = -speed;
    if (s) velocity.y = speed;
    if (d) velocity.x = speed;

    if (velocity.mag() > speed)
      velocity.setMag(speed);


    if (!w && !s) velocity.y = velocity.y * 0.75;
    if (!a && !d) velocity.x = velocity.x * 0.75;

    if (abs( velocity.y)  > abs( velocity.x)) {
      if ( velocity.y > 0) currentAction = man_down;
      else currentAction = manup;
    } else {
      if  (velocity.x > 0) currentAction = manright;
      else  currentAction = manleft;
    }

    if (hp >= hpmax) {
      hp=hpmax;
    }

    if (hp <= 0) {

      mode = GAMEOVER;
    }
    if (northRoom != #FFFFFF && loc.y == height*0.1 && loc.x >= width/2-50 && loc.x<= width/2+50) {
      roomY--;
      loc = new PVector(width/2, height*0.9-10);
    }
    if (eastRoom != #FFFFFF && loc.x == width*0.9 && loc.y >= height/2-50 && loc.y <= height/2+50) {
      roomX++;
      loc = new PVector(width*0.1+10, height/2);
    }
    if (southRoom != #FFFFFF && loc.y == height*0.9 && loc.x >= width/2-50 && loc.x<= width/2+50) {
      roomY++;
      loc = new PVector(width/2, height*0.1 +10);
    }
    if (westRoom != #FFFFFF && loc.x == width*0.1 && loc.y >= height/2-50 && loc.y <= height/2+50) {
      roomX--;
      loc = new PVector(width*0.9-10, height/2);
    }



   



  }
}
