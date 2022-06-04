//Pan and Zoom Doraemon
float scale = 1;
float xPan = 350;
float yPan = 300;
boolean zoomIn = false;
boolean zoomOut = false;
boolean panUp = false;
boolean panDown = false;
boolean panLeft = false;
boolean panRight = false;
float panSpeed = 5;
float zoomSpeed = 1.04;

void setup() {
  size (700, 600, P2D);
}
void draw() {
  translate (width/2, height/2);
  scale (scale);
  translate (-xPan, -yPan);
  background(100,1000,1000);
  smooth();
  
  //kepala
  strokeWeight(3);
  fill(0,0,255);
  stroke(0,0,0);
  arc(350,250,250,255,radians(30),radians(410));
  fill(255,255,255);
  arc(350,270,210,200,radians(30),radians(410));
  
  //mata kiri
  strokeWeight(3);
  fill(255,255,255);
  stroke(0,0,0);
  ellipse(330,170, 50, 60);
  fill(0,0,0);
  strokeWeight(15);
  point(340,185);
  
  //mata kanan
  strokeWeight(3);
  fill(255,255,255);
  ellipse(385,170, 50, 60);
  fill(0,0,0);
  strokeWeight(15);
  point(375,185);
  
  //warna merah hidung mulut
  strokeWeight(3);
  fill(255,0,0);
  
  //hidung
  ellipse(357,200,25,20);
  line(356,210,356,245);
  
  //mulut
  arc(350,245,140,180,radians(0),radians(180));
  arc(350,325,140,115,radians(215),radians(325));
  line(280,245,420,245);
  
  //kumis kiri
  line(330,210,290,200);
  line(330,220,290,210);
  line(330,230,290,220);
  
  //kumis kanan
  line(378,210,418,200);
  line(378,220,418,210);
  line(378,230,418,220);
  
  //tangan kiri
  fill(0,0,255);
  strokeWeight(3);
  stroke(0,0,0);
  ellipse(240,390,40,100);
  
  //telapak kiri
  fill(255,255,255);
  ellipse(240,440,40,40);
  
  //tangan kanan
  fill(0,0,255);
  strokeWeight(3);
  stroke(0,0,0);
  ellipse(480,360,100,40);
  
  //telapak kanan
  fill(255,255,255);
  ellipse(530,360,40,40);
  
  //badan
  fill(0,0,255);
  stroke(0,0,0);
  strokeWeight(3);
  rect(255,350,190,150);
  
  //leher
  strokeWeight(9);
  stroke(255,0,0);
  line(255,345,445,345);
  
  //perut
  fill(255,255,255);
  strokeWeight(3);
  stroke(0,0,0);
  arc(350,395,160,170,radians(330),radians(570));
  noStroke();
  rect(283,352,135,50);
  
  //lonceng
  fill(255,255,0);
  strokeWeight(3);
  stroke(0,0,0);
  ellipse(350,358,25,25);
  ellipse(350,365,10,10);
  arc(350,356,25,10,radians(180),radians(360));
  arc(350,360,25,10,radians(180),radians(360));
  
  //kantong
  fill(255,255,255);
  strokeWeight(3);
  stroke(0,0,0);
  arc(350,390,140,150,radians(0),radians(180));
  line(280,390,420,390);
  
  //garis kaki
  fill(0,0,255);
  arc(340,490,30,20,radians(280),radians(420));
  
  //kaki
  fill(255,255,255);
  ellipse(410,520,120,50);
  ellipse(290,520,120,50);
  
  if (zoomIn) {
    scale *= zoomSpeed;
  }
  if (zoomOut) {
    scale /= zoomSpeed;
  }
  if (panUp) {
    yPan += panSpeed;
  }
  if (panDown) {
    yPan -= panSpeed;
  }
  if (panLeft) {
    xPan += panSpeed;
  }
  if (panRight) {
    xPan -= panSpeed;
  }
}

void keyPressed() {
  if (keyCode  == UP) {
    zoomIn = true;
    zoomOut = false;
  }
  if (keyCode  == DOWN) {
    zoomOut = true;
    zoomIn = false;
  }
  if (key == 'w') {
    panUp = true;
    panDown = false;
  }
  if (key == 's') {
    panDown = true;
    panUp = false;
  }
  if (key == 'a') {
    panLeft = true;
    panRight = false;
  }
  if (key == 'd') {
    panRight = true;
    panLeft = false;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    zoomIn = false;
  }
  if (keyCode == DOWN) {
    zoomOut = false;
  }
  if (key == 'w') {
    panUp = false;
  }
  if (key == 's') {
    panDown = false;
  }
  if (key == 'a') {
    panLeft = false;
  }
  if (key == 'd') {
    panRight = false;
  }
} 
