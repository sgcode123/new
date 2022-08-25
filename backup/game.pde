void game() {
 
  background(0);
  drawRoom();
  drawGameOdjects();

  drawMiniMap();
}
void drawRoom() {
  background(#535D5F);
  stroke(black);
  strokeWeight(4);



  

  //check details in room code make shure to print varibles 

  northRoom = map.get(myHero.roomX, myHero.roomY-1);
  eastRoom = map.get(myHero.roomX +1, myHero.roomY);
  southRoom = map.get(myHero.roomX, myHero.roomY+1);
  westRoom = map.get(myHero.roomX-1, myHero.roomY);



  noStroke();
  fill(black);
  if (northRoom != #FFFFFF) {
    ellipse(width/2, height*0.1, 100, 100);
  }
  if (eastRoom != #FFFFFF) {
    ellipse(width*0.9, height/2, 100, 100);
  }
  if (southRoom != #FFFFFF) {
    ellipse(width/2, height*0.9, 100, 100);
  }
  if (westRoom != #FFFFFF) {
    ellipse(width*0.1, height/2, 100, 100);//door design 
  }
  if  (eastRoom != #FFFFFF && southRoom != #FFFFFF && northRoom == #FFFFFF && westRoom == #FFFFFF){
   myHero.cover= 1;
   myHero.coveroff= true;
   
  }else  myHero.cover= 0;
  
  if  (eastRoom == #FFFFFF && southRoom != #FFFFFF && northRoom == #FFFFFF && westRoom != #FFFFFF){
   myHero.scary = true;
  
      
  }else  myHero.scary = false;
  
  
 
  
  fill(#6D797C);
  rectMode(CENTER);
  rect(width/2, height/2, width*0.8, height*0.8);
  

  
}
void drawGameOdjects() {
  int i = 0;
  while (i< myObject.size()) {
    GameObject myObj = myObject.get(i);
    if (myObj == myHero) println(myObj.roomX, myObj.roomY);
    if ( myObj.roomX == myHero.roomX &&  myObj.roomY == myHero.roomY) {
      myObj.show();
      myObj.act();
    }
    if (myObj.hp ==0) {
      myObject.remove(i);
    } else {
      i++;
    }
  }
}




void drawMiniMap() {

  float size =6;
  int x = 0, y = 0;
  rectMode(CORNER);
  while (y<map.height) {

    color c = map.get(x, y);
    fill(c);
    square(x*size+50, y*size+50, size);
    x = x +1;

    if (x >=map.width) {
      x =0;
      y = y +1;
    }
  }
  fill(start);
  square(myHero.roomX*size+50, myHero.roomY*size+50, size);// guy
  
  fill(purple);
   
   
   fill(white);
  textSize(25);

}


void gameClicks() {
  if (mouseX > 10 && mouseX< 60  && mouseY> 10 && mouseY< 50) 
    
    mode = PAUSE;
  }
