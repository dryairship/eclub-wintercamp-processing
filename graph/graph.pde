int a;
void setup(){
   size(1000,1000);
   background(255);
   stroke(0);
   a=0;
   line(0,500,1000,500);
   line(500,0,500,1000);
}

void draw(){
  if(a<500){
    line(500+a,500-f(a), 500+a+1, 500-f(a+1));
    line(500-a,500-f(-a), 500-a-1, 500-f(-a-1));
    a+=1;
  }
}

int f(int x){
  return (int)(100*sin(x*cos(x/31.4f)));
  //return (int)(10*Math.sqrt(1000-(x*x/100f)));
  //return (int)(100*tan(x/100f));
  //return (x*x*x)/10000 -(3*x*x/100) + x;
  //return  (int)Math.sqrt(100*x);
  ////return x*x/100;
  //return (int)(100*cos(x/10f));
  //return (int)(100*sin(x/10f));
}
