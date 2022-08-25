int mode; //<>//
int i;

boolean mouseReleased;
boolean hadPressed;
final int INTRO=0;
final int GAME=1;
final int PAUSE=2;
final int GAMEOVER=3;





AnimatedGIF myGIF;
AnimatedGIF yourGIF;
AnimatedGIF ourGIF;
AnimatedGIF introGIF;
AnimatedGIF manup;

AnimatedGIF manright;
AnimatedGIF manleft;
AnimatedGIF man_down;

PImage map,geer;

color northRoom, eastRoom, southRoom, westRoom;
Button blueButton, greenButton, pinkButton, blackButton,purpleButton,whiteButton;
color bkg;



boolean upkey, downkey, leftkey, rightkey, spacekey;
boolean win, lose;
Hero myHero;


ArrayList<GameObject> myObject;


boolean a, w, d, s;


//color pallet
color blue   = #0E91AA;
color green  = #04900F;
color pink   = #F7AADE;
color red    = #ff0000;
color yellow = #ffe100;
color black  = #000000;
color white  = #FFFFFF;
color purple = #A600AF;
color brown = #7E6012;
color grey = #EDEDED;
color brown2 = #463506;


color start = #00FF00;
color danger = #FF0000;
color extra = #999900;
color royal = #9966CC;
color winner = #FFFF00;



void setup() {
  size(800, 600);
  bkg = white;
  mode = INTRO;
  imageMode(CENTER);
  map = loadImage("map.png");
 
  geer = loadImage("geer.png");

  int size =10;
  int x = 0, y = 0;
  rectMode(CORNER);
  while (y < height) {
 
    x = x + size;
    if (x >= width) {
      x =0;
      y = y + size;
      
    }
  }





  myObject = new ArrayList<GameObject>();
  myHero =new Hero();
  myObject.add(myHero);
x =0;
      y = 0;
      while(y < map.height){
        color roomColor = map.get(x,y);
        if(roomColor == pink){
         
        myObject.add(new sniper(x,y));
           myObject.add(new fruniture (x,y));
        }
        if(roomColor == black){
           myHero.coveroff = true;
        
           
        }
         if(roomColor == blue){
          

            myHero.cover= 0;
          
        
           
        }
        if (roomColor== purple){
     

}

 if (roomColor== red){
   

}
 if (roomColor== yellow){
   


}

        if (roomColor== green){

     
     myHero.effect = true;
 
}
        x++;
        if(x== map.width){
          x =0;
      y ++;
        }
      }
      
    
  
  blueButton  = new Button("", 200, 100, 200/2, 150/2, white, pink);
  greenButton = new Button("", 200, 200, 100, 75, white, blue);
  purpleButton  = new Button("", 200, 300, 100, 75, white, green);
  whiteButton = new Button("", 200, 450, 200, 150, white, yellow);
  
  
  pinkButton  = new Button("", 20, 20, 50, 40, pink, blue); 
  blackButton = new Button("GAME", 400, 400, 400, 150, black, white);


  myGIF = new AnimatedGIF(38,10, "frame_", "_delay-0.03s.png", 100, 100, 200, 200);
  ourGIF = new AnimatedGIF(3,10, "gameGif/frame_", "_delay-0.2s.png");
  introGIF = new AnimatedGIF(3,10, "frame_", "_delay-0.1s.gif");
  manup = new AnimatedGIF(4,10, "sprites/man/up/sprite_", "_delay-0.03s.png");
  man_down = new AnimatedGIF(4,10, "sprites/man/_down/sprite_", ".png");
  manright= new AnimatedGIF(4,10, "sprites/man/right/sprite_", ".png");
  manleft= new AnimatedGIF(4,10, "sprites/man/left/sprite_", ".png");
  
  
}





void draw() {
  //println(myObject.size());
  if (mousePressed) hadPressed = true;
  if (hadPressed && !mousePressed) {
    mouseReleased = true;
    hadPressed = false;
  } else if (  mouseReleased )  mouseReleased  = false;




  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } 
   else {
    println("Error: Mode = " + mode);
  }
}
void keyPressed() {
  if (key == 'a') a = true;
  if (key =='w') w= true;
  if (key== 's') s = true;
  if (key == 'd') d = true;
}
void keyReleased() {
  if (key == 'a') a = false;
  if (key =='w') w = false;
  if (key == 's') s  = false;
  if (key == 'd') d  = false;
}
