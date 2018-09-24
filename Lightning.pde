
float headX = 50;
float headY = 700;
float headSize = 15;
float z = 0.0;
float change = .1;
float cloudPos = 50;
float startX = 0;
float startY = 0;
float endX = 0;
float endY = 0;
float cloudColor = 237;
void setup() {
  size(900, 900);
}

void draw() {
  cloudColorMaker();
  endX = 0;
  endY = 0;
  startY = 100;
  startX = cloudPos;
  background(190);
  if (mousePressed == true && cloudColor<50) {
    lightning();
  }
  
 
    noStroke();
  fill(50, 50, cloudColor);
  ellipse(cloudPos, 100-20, 100, 100);
  ellipse(cloudPos-30, 100+10, 100, 100);
  ellipse(cloudPos+30, 100, 100, 100);
  ellipse(cloudPos-10, 100, 100-30, 100);
  ellipse(cloudPos+40, 110, 100, 100);
  cloudPos=cloudPos%900+1;
  stroke(3);
  float y = sin(sin(headX));
  float yy = cos(sin(headX));
  float y2=(sin(headX-0.4)-.3);
  float yy2 = cos(sin(headX-0.4)-.3);
  float neckX = headX;
  float neckY = headY+8;
  float rArmX = neckX + 25;
  float lArmX = neckX -25;
  float rArmY = neckY - 4;
  float lArmY = neckY - 4;
  float hipsX = headX;
  float hipsY = headY+35;
  float legL = 10;
  float rLegX = headX + ((y+1)*legL);
  float rLegY = hipsY+((yy+1)*legL);
  float lLegX = headX - ((y+1)*legL);
  float lLegY = hipsY+((yy+1)*legL);
  float rToeX = rLegX + ((y2+1)*legL);
  float rToeY = rLegY+((yy2+1)*legL);
  float lToeX = lLegX + ((y2)*legL*2);
  float lToeY = lLegY+((yy2)*legL*2);
  line(headX, headY, hipsX, hipsY);
  line(neckX, neckY, lArmX, lArmY);
  line(neckX, neckY, rArmX, rArmY);
  line(hipsX, hipsY, rLegX, rLegY);
  line(hipsX, hipsY, lLegX, lLegY);
  line(rLegX, rLegY, rToeX, rToeY);
  line(lLegX, lLegY, lToeX, lToeY);

  ellipse(headX, headY - headSize, headSize*2, headSize*2);
  headX=(headX+3)%900;

  if (z>10||z<0) {
    change = -change+.1;
  } else {
    z+=change;
  }
}



void lightning() {
    while (startY<height) {
    float endX = startX + (int)(Math.random()*8-4);
    //float endX = startX + random(-4,4);
    float endY = startY + 1;
    strokeWeight(2);
    stroke(255); 
    line(Math.abs(startX), startY, Math.abs(endX), endY);
    //System.out.println(startX+", "+ startY+", "+ endX+ ", " + endY);
    startX = endX;
    startY = endY;
  }
}
void cloudColorMaker() {
  if (cloudColor<255)
  cloudColor++;
  else {
    cloudColor = 0;
  }
}
