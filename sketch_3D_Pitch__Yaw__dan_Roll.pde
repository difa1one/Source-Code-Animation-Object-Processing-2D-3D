float halfh;
float angle = 0;
PImage img, img2;

PVector axis1 = new PVector(1.0, 0.0, 0.0);
PVector axis2 = new PVector(1.0, 1.0, 0.0);
PVector axis3 = new PVector(1.0, 1.0, 1.0);

void setup() {
  size(700, 700, P3D);
  halfh = height * 0.5;
  noStroke();
  println(axis2.normalize());
  println(axis3.normalize());
  
  img = loadImage("sarutobisasuke.jpg");
  img.resize(700,700);
  img2 = loadImage("difaanimation.jpg");
  img2.resize(700,700);
  ortho();
}

void draw() {
  background(#ffffff);
  directionalLight(255, 255, 255, 0.0, 0.6, -0.8);
  float t = frameCount * 0.01;
  
  fill(0);
  noStroke();
  float tiles = 200;
  float tileSize = width/tiles;
  
  
  // Green
  pushMatrix();
  translate(width * 0.2, halfh);
  rotate(t, axis1.x, axis1.y, axis1.z);
  scale(25.0, 50.0, 32.5);
  fill(0xff00ff7f); box(1.0);
  popMatrix();
  
  
  // Magenta box, far-right.
  pushMatrix();
  translate(width * 0.8, halfh);
  rotateX(t); rotateY(t); rotateZ(t);
  scale(25.0, 50.0, 32.5);
  fill(#00008B); box(1.0);
  popMatrix();
  
  push();
  translate(width/2,height/2);
  rotateY(radians(frameCount));
  for (int x =0; x < tiles; x++){
    for(int y =0; y < tiles; y++){
      
      color c = img.get(int(x*tileSize),int(y*tileSize));
      float b = map(brightness(c),0,255,1,0);
      
      float z = map(b,0,1,-100,100);
      
      color d = img2.get(int(x*tileSize),int(y*tileSize));
      float e = map(brightness(d),0,255,1,0);
      
      float g = map(e,0,1,100,-100);
      
      push();
      translate(x*tileSize - width/2, y*tileSize - height/2, z);
      ellipse(0,0,tileSize*b, tileSize*b);
      pop();
      
      push();
      fill(0xff00ff7f);
      translate(x*tileSize - width/2, y*tileSize - height/2, g);
      ellipse(0,0,tileSize*e, tileSize*e);
      pop();
      
    }
  }
  pop();
  
  translate(width/2, height/2);
  stroke(#8B0000);
  strokeWeight(4);
  noFill();
  rotateX(angle);
  rotateY(angle * 2);
  rotateZ(angle * 3);
  box(200);
  
  angle += 0.01;
  
}
