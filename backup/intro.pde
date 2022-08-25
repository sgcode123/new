void intro(){

  background(#6CC1D6);
  stroke(white);
  line(800,50,0,50);
  line(800,550,0,550);
  blackButton.show();
   
   blackButton.show();
  
   //myHero = new Hero();
image(geer,400,200,400,400);
   
 // myObject.add(myHero);
}

void introClicks() {
 
 if (mouseX > 290 && mouseX< 560  && mouseY> 380 && mouseY< 480)
mode = GAME;
  myHero = new Hero();
        myHero.speed = 5;
  myObject.add(myHero);
}
