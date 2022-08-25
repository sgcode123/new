class sniper extends things{
  
 sniper(int x, int y){
    super(100, 50,x,y);
    xp = 10;
    }
    void show() {
    if (roomX==myHero.roomX && roomY == myHero.roomY) {
      
            
          if (c == 1) {
      //manup.show(loc.x, loc.y, size/1.5, size);
    
    }
    if (c == 2) {
    
      //manleft.show(loc.x, loc.y, size/1.5, size);
    }
    if (c == 3) {
       
     // man_down.show(loc.x, loc.y, size/1.5, size);
    }
    if (c == 4) {
       
    //  manright.show(loc.x, loc.y, size/1.5, size);
    }
if (abs( velocity.y)  > abs( velocity.x)) {
      if ( velocity.y > 0) c = 3;
      else c = 1;
    } else {
      if  (velocity.x > 0) c = 4;
      else  c = 2;
    }
    }
  }
  void act(){
    super.act();
     float d = dist(myHero.loc.x, myHero.loc.y, loc.x, loc.y);
      
        if (d <= size*2 + myHero.size*2) {// beans 
    velocity = new PVector(myHero.loc.x-loc.x,myHero.loc.y-loc.y);
     velocity.setMag(3);
        }
        
  }
}
