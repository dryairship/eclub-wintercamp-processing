import java.util.Arrays;

int snake[][], pixold[];
int score, vx, vy, v, del, fx, fy, li;
void setup() {
  size(1000, 1000);
  snake = new int [100][2];
  snake[0][0] = 40; 
  snake[0][1]=20;
  snake[1][0] = 30; 
  snake[1][1]=20;
  snake[2][0] = 20; 
  snake[2][1]=20;
  snake[3][0] = 10; 
  snake[3][1]=20;
  for (int i=4; i<snake.length; i++) {
    snake[i][0]=snake[i][1]=-1;
  }
  del = 20;
  v = 20;
  vx = v;
  vy=0;
  li=4;
  fx = (int)random(100, 900);
  fy = (int)random(100, 900);
  score=0;
  stroke(0);
}

void draw() {
  background(255, 255, 0);
  fill(255, 255, 0);
  strokeWeight(20);
  rect(0, 0, 1000, 1000);
  strokeWeight(0);
  fill(0, 0, 255);
  int px = snake[0][0], py=snake[0][1], p2x=0, p2y=0;
  if (fx<=px+10 && fx>=px-10 && fy<=py+10 && fy>=py-10) {
    snake[li][0]=snake[li-1][0]-10;
    snake[li][1] = snake[li-1][1]-10;
    li++;
    del-=2;
    score++;
    fx = (int)random(100, 900);
    fy = (int)random(100, 900);
  }
  if(px>980 || px<20 || py<20 || py>980){
    text("GAME OVER", 500,500);
     noLoop(); 
  }
  ellipse(fx, fy, 15, 15);
  snake[0][0]+=vx; 
  snake[0][1]+=vy; 
  ellipse(snake[0][0], snake[0][1], 20, 20);
  for (int i=1; i<snake.length; i++) {
    if (snake[i][0]==-1) break;
    p2x = snake[i][0]; 
    p2y=snake[i][1];
    snake[i][0]=px; 
    snake[i][1]=py;
    px = p2x; 
    py = p2y;
    ellipse(snake[i][0], snake[i][1], 20, 20);
    if (del>0)   delay(del);
  }
  text("Score : "+score, 10, 10);
  
}

void keyPressed() {
  //println(keyCode);
  if (keyCode==37 && vx!=v) {
    vx=-v; 
    vy=0;
  } else if (keyCode==38 && vy!=v) {
    vx=0; 
    vy=-v;
  } else if (keyCode==39 && vx!=-v) {
    vx=v; 
    vy=0;
  } else if (keyCode==40 && vy!=-v) {
    vx=0; 
    vy=v;
  }
}
