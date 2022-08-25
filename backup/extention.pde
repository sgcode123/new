class things extends GameObject {


   

  things(int _hp, int s, int x, int y) {
    loc= new PVector(width/(random (0,3)), height/(random (0,3)));
    velocity = new PVector(0, 0);
    hp= _hp;
    roomX= x;
    size=s;
    roomY = y;
    
            
  }


  void show() {
    if (roomX==myHero.roomX && roomY == myHero.roomY) {

      stroke(black);
      strokeWeight(2);
      fill (green);
      circle(loc.x, loc.y, size);
      fill(black);
      textSize(20);
      text(hp, loc.x, loc.y);

    }
  }

  void act() {
 
    super.act();

     
  }
}
