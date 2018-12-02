int cx,cy,cr;
int hx, hy, mx, my, sx, sy;
int h,m,s;
void setup(){
 size(1000,1000);
 frameRate(2);
 cx=500;
 cy=500;
 cr=400;
 hx=hy=mx=my=sx=sy=0;
}

void draw(){
   background(255);
   stroke(0);
   strokeWeight(20);
   fill(255,255,0);
   ellipse(cx,cy,2*cr,2*cr);
   
   h = hour()%12;
   m = minute();
   s = second();
   
   hx = cx+(int)(cos(radians(90-(30*h)))*(cr/2));
   hy = cy+(int)(sin(radians((30*h)-90))*(cr/2));
   mx = cx+(int)(cos(radians(90-(6*m)))*((cr*4)/5));
   my = cy+(int)(sin(radians(((6*m)-90)))*((cr*4)/5));
   sx = cx+(int)(cos(radians(90-(6*s)))*cr);
   sy = cy+(int)(sin(radians(((6*s)-90)))*cr);
   
   strokeWeight(10);
   line(cx,cy,hx,hy);
   strokeWeight(5);
   line(cx,cy,mx,my);
   strokeWeight(2);
   line(cx,cy,sx,sy);
}
