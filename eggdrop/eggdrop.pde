import processing.serial.*;

float ex, ey, eh, ew, vy;
float cx,cy,ch,cw;
int score;
float ll[];
Serial ser;
void setup(){
  size(1000,1000);
  ser = new Serial(this, "/dev/ttyUSB0", 9600);
  
  ex = random(100,900);
  ey = 100;
  ew = 50;
  eh = 70;
  vy=2;
  
  cx = 500;
  cy = 900;
  ch = 40;
  cw = 100;
  
  ll = new float[10];
}

void draw(){
    background(210,240,255);
    egg(ex,ey);
    ey+=vy;
    vy+=0.2f;
    
    
    if(ey>=cy){
      if(ex<=cx+(cw/2) && ex>=cx-(cw/2)){
         score++; 
      }
      ex = random(100,900);
      ey = 100;
      vy = 2;
    }
    if (ser.available()>0)
    {
        String str = ser.readStringUntil('\n');
        for(int i=8; i>=0; i--){
            ll[i+1]=ll[i]; 
        }
        float sum=0;
        if(str!=null && !str.trim().isEmpty()) ll[0] = 1000-Integer.parseInt(str.trim()); // read it and store it in val
        for(int i=0; i<10; i++){
           sum+=ll[i];
        }
        cx=sum/10;
        println(str);
        println("Avg");
        println(cx);
    }
    catcher(cx,cy);
    text("Score : "+score, 10, 10);
}

/*void keyPressed(){
  if (keyCode==37) {
    cx-=30;
  } else if (keyCode==39) {
    cx+=30;
  }
}*/

void catcher(float x, float y){
 fill(255,170,100);
 rect(x-cw/2,y-ch/2,cw,ch);
}

void egg(float x, float y){
  fill(255);
  ellipse(x,y,ew,eh);
}
