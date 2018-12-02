int bx, by, bvx, bvy;
int pw, ph, py;
int count;
void setup() {
  background(255);
  frameRate(100);
  bx = 500;
  by = 20;
  size(1000, 1000);
  pw=100;
  ph=20;
  stroke(0, 0, 255);
  bvx=-2;
  bvy=-2;
  py=600;
  count=0;
}

void draw() { 
  background(255);
  fill(255, 255, 255);
  strokeWeight(20);
  rect(0, 0, 1000, 1000);
  fill(255,0,0);
  textSize(32);
  text(""+count,500,700);  strokeWeight(0);
  fill(255, 0, 0);
  ellipse(bx, by, 20, 20);
  fill(0, 0, 255);
  rect(mouseX-(pw/2), py, pw, ph);
  bx+=bvx;
  by+=bvy;
  if (bx>980) {
    bvx*=-1;
  }
  if (bx<20) {
    bvx*=-1;
  }
  if (by<20) {
    bvy*=-1;
  }
  if (by>py-10 && bx>mouseX-(pw/2) && bx<mouseX+(pw/2)) {
    bvy*=-1;
  }
  if(by>py+10){
    by=20;
    bx=500;
    count++;
  }
}
